CC = gcc
CFLAGS = -g -O2 -m32 -Wall -nostdlib -nostdinc \
	-fno-builtin -nostartfiles -nodefaultlibs -I./include
LD = ld -m elf_i386
AS = as --32

OBJFILES = \
	boot/entry.o \
	kernel/main.o

all: vmsilix.bin

boot/.s.o:
	$(AS) -o $@ $<

kernel/.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

vmsilix.bin: $(OBJFILES)
	$(LD) -T tools/linker.ld -o $@ $^

clean:
	$(RM) $(OBJFILES) vmsilix.bin
