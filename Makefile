
# Target Info

TARGET_NAME := crow

DIR_SRC := src
DIR_INC := include
DIR_OBJ := obj
DIR_BIN := bin

TARGET := $(DIR_BIN)/lib$(TARGET_NAME).dylib
SOURCES := $(wildcard $(DIR_SRC)/*.c)
OBJECTS := $(patsubst $(DIR_SRC)/%.c, $(DIR_OBJ)/%.o, $(SOURCES))

CLEAN_LIST := $(TARGET) $(OBJECTS)


# Commands

CC := clang
CFLAGS := -std=c17 -c -g -Wall -Werror

LD := clang
LFLAGS := -std=c17 -dynamiclib

RM := rm -f


# Targets

$(TARGET): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $(TARGET)

$(OBJECTS): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
	$(CC) $(CFLAGS) $< -o $@


# Phony targets

default: mkdirs all

.PHONY: all
all: $(TARGET)

.PHONY: mkdirs
mkdirs:
	@mkdir -p $(DIR_SRC) $(DIR_INC) $(DIR_OBJ) $(DIR_BIN)

.PHONY: clean
clean:
	@$(RM) $(CLEAN_LIST)

