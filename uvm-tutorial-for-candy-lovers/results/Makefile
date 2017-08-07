all: tutorial_9.png test_randomize.png
	@echo "Done creating all the graphs"

tutorial_9.png: tutorial_9.plt tutorial_9.dat
	gnuplot $<

test_randomize.png: test_randomize.plt test_randomize.dat
	gnuplot $<

clean:
	rm *.png

