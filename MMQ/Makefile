compiler=c++
objects= MMQ.cpp
temp= MMQ-test.* *.dSYM
dir=/Users/Filippo/Desktop/MMQ
libdir=$(dir)/lib
dep=$(libdir)/*
flag= -Wall -g2 -I$(libdir)

MMQ: MMQ.o *.cpp $(dep)
	mv $< $@
	chmod +x $@

%.o: %.cpp
	c++ $< $(dep) -o $@ $(flag)

.PHONY: clean

clean:
	rm -r -f $(temp)
