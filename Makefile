CC      = gcc
CFLAGS  = -g -Wall -O2 -Wno-unused-function -Wno-format
LDFLAGS = -lz -lm

# Detect OS (Windows_NT is set in MSYS/MinGW environments)
ifeq ($(OS),Windows_NT)
    EXE     = seqtk.exe
    BINDIR  = $(CURDIR)   # install into current directory on Windows
else
    EXE     = seqtk
    BINDIR  = /usr/local/bin
endif

# Sources
SRCS    = seqtk.c compat.c
OBJS    = $(SRCS:.c=.o)

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

install: all
	install $(EXE) $(BINDIR)

clean:
	rm -f gmon.out *.o ext/*.o a.out seqtk seqtk.exe trimadap *~ *.a *.dSYM session*
