override CC ?= gcc
override CFLAGS += -Wall -Wextra
o := out

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

test:
	@echo -e "\033[32m\tRunning unit tests\033[m"
	@$(MAKE) -C tests
	@echo -e "\033[32m\tDone!\033[m"

build: test mkdirs $o/build.elf

$o/build.elf: $o/main.o $o/lib/readline.o
	$(CC) -o $@ $^ $(CFLAGS)

$o/main.o: main.c
	$(CC) -c $< -o $@ $(CFLAGS)

$o/lib/readline.o: lib/readline.c
	$(CC) -c $< -o $@ $(CFLAGS)