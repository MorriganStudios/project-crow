
CC := clang
CFLAGS := -Wall

RM := rm -f


TARGET_NAME := crow

DIR_SRC := src
DIR_INC := include
DIR_OBJ := obj
DIR_BIN := bin

TARGET := $(DIR_BIN)/lib$(TARGET_NAME).dylib
SOURCES := $(wildcard $(DIR_SRC)/*.c)
OBJECTS := $(patsubst $(DIR_SRC)/%.c, $(DIR_OBJ)/%.o, $(SOURCES))

CLEAN_LIST := $(TARGET) $(OBJECTS)


$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -dynamiclib $(OBJECTS) -o $(TARGET)

$(OBJECTS): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@


default: mkdirs all

.PHONY: all
all: $(TARGET)

.PHONY: mkdirs
mkdirs:
	@mkdir -p $(DIR_SRC) $(DIR_INC) $(DIR_OBJ) $(DIR_BIN)

.PHONY: clean
clean:
	@$(RM) $(CLEAN_LIST)

