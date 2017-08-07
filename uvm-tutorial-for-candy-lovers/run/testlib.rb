
def runtest(arg)
  n = arg[:n]
  sim = arg[:sim] || "incisive"
  test = arg[:test] || abort("Must specify the test name")
  batch = arg[:batch] || true
  abort("repeat count cannot be 0") if n == 0

  output_name = "#{test}_n#{n}"
  puts `../src/mk_#{test} -n #{n} -o #{output_name}.sv`
  puts "Running #{sim} with #{output_name}.sv"
  puts
  log_file = "#{sim}_#{output_name}.log"
  `rm -rf #{log_file}`

  if(batch) 
    system(%Q(nc run -I -g interactive -- make #{sim} TEST=#{output_name})) ||
      abort("nc job failed")
    sleep 3 # To allow the log file to be present.
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

