CC=gcc
CPLUS=g++
ASM=nasm
LD=g++

#File types to compile
.SUFFIXES: .c .cpp .cxx .asm .o .a

OBJS=main.o longop.o

#all: main.cpp
#	$(CPLUS) -S -march=i686 -m32 -I. main.cpp

#main.cpp.s:
#	$(CPLUS) -S  -march=i686 -m32 -I. main.cpp
#Rules for compiling into .o files
.c.o:
	$(CC) -c -march=i686 -m32 -I. $*.c
.cpp.o:
	$(CPLUS) -c -march=i686 -m32 -I. $*.cpp	
.cxx.o:
	$(CPLUS) -c -march=i686 -m32 -I. $*.cxx
.asm.o:
	$(ASM) -g -f elf32 $*.asm -o $*.o

#Rule for linking
prog: $(OBJS)
	$(LD) -march=i686 -m32 -o $@ $(OBJS)

#Cleaning project
clean:
	rm *.o prog
