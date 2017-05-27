OBJS = libhello.o
CXX = gcc
MAJOR_VERSION = 0
MINOR_VERSION = 0
SONAME = libhello.so

.PHONY: clean

%.o: %.c
	gcc -fPIC -Wall -g  -o $@ -c $<

${SONAME}.${MINOR_VERSION}.${MINOR_VERSION} : ${OBJS}
	$(CXX) -g -shared -Wl,-soname,${SONAME}.${MAJOR_VERSION} -o $@ ${OBJS} -lc

release : ${SONAME}.${MINOR_VERSION}.${MINOR_VERSION}
	mkdir release
	cp $< ./release

clean :
	-rm -rf *.o
	-rm -rf *.so*
	-rm -rf release
