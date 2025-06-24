CC=gcc
CFLAGS=-Wall -Wextra -std=c99
SRC=$(wildcard src/*.c)
OBJ=$(SRC:.c=.o)
OUT=build/quad_solver

.PHONY: all static check clean

all: $(OUT)

static: CFLAGS += -static
static: $(OUT)

$(OUT): $(OBJ)
	mkdir -p build
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

check:
	cppcheck --enable=all --suppress=missingIncludeSystem src

clean:
	rm -rf src/*.o build
# Makefile patch
