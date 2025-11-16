# ============================================================================
# Makefile для лабораторной работы №2
# ============================================================================

CC = gcc
CFLAGS = -Wall -Wextra -O2 -pthread
TARGET = batcher_sort
TEST_SCRIPT = test_batcher_sort.sh

all: $(TARGET)

$(TARGET): batcher_sort.c
	$(CC) $(CFLAGS) -o $(TARGET) batcher_sort.c

test: all
	chmod +x $(TEST_SCRIPT)
	./$(TEST_SCRIPT)

clean:
	rm -f $(TARGET) result*.txt

.PHONY: all test clean