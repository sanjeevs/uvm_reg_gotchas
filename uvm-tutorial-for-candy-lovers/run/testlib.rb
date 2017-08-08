#
# Function: runtest
# Generates the test and runs it. Returns the memory usage and time used by the sim.
# Input: Must specify the test name.
# Output: hash with {mem: x, time: y}
# The function does the following steps.
# 1. Runs the script ../src/mk_<test> to product the test <test>_n<x>.sv
# 2. Runs the simulator 
# 3. Greps the log file produced for memory and timing.
# 4. Parses and returns the value.
#
def runtest(arg)
  n = arg[:n]
  sim = arg[:sim] || "incisive"
  test = arg[:test] || abort("Must specify the test name")
  batch = arg[:batch] || true
  srm = arg[:srm] || "0" 
  abort("repeat count cannot be 0") if n == 0

  output_name = "#{test}_n#{n}"
  puts `../src/mk_#{test} -n #{n} -o #{output_name}.sv`
  puts "Running #{sim} with #{output_name}.sv"
  puts
  log_file = "#{sim}_#{output_name}.log"
  `rm -rf #{log_file}`

  if(batch) 
    system(%Q(nc run -I -g interactive -- make #{sim} SRM=#{srm} TEST=#{output_name})) ||
      abort("nc job failed")
    while(!File.exist?(log_file)) 
      sleep 3 # To allow the log file to be present.
    end
  else
    `make #{sim} TEST=#{output_name}`
  end

  abort "Log file #{log_file} not found" unless File.exist?(log_file)

  if(sim == "incisive") 
    memory_usage = `egrep ^Memory #{log_file}`
    md = /\= ([\d\.]+)M total/.match(memory_usage)
    abort "Could not extract memory usage" unless md

    time_usage = `egrep ^CPU #{log_file}`
    td = /\= ([\d\.]+)s total/.match(time_usage)

    {mem: md[1].to_f, time: td[1].to_f}
  end
end

