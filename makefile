override CC ?= gcc
override CFLAGS += -Wall -Wextra
o = out

all: build

clean:
	rm $(o)/*.o
	rm $(o)/*.elf
	rm $(o)/lib/*.o
	rmdir $(o)/lib
	rmdir $(o)

mkdirs: 
	@[ -d $(o) ] || mkdir $(o)
	@[ -d $(o)/lib ] || mkdir $(o)/lib

build: mkdirs $o/build.elf

$o/build.elf: $o/main.o $o/lib/readline.o
	$(CC) -o $@ $^ $(CFLAGS)

$o/main.o: main.c
	$(CC) -c $< -o $@ $(CFLAGS)

$o/lib/readline.o: lib/readline.c
	$(CC) -c $< -o $@ $(CFLAGS)