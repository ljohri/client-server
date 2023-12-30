
	CC = gcc
	CFLAGS = -Wall -Wextra -g -I./include
	LDFLAGS = -lpthread

DEBUG_DIR = debug
RELEASE_DIR = release

DEBUG_OBJ_DIR = $(DEBUG_DIR)/obj
RELEASE_OBJ_DIR = $(RELEASE_DIR)/obj

CLIENT_SRC = client.c
SERVER_SRC = server.c

CLIENT_DEBUG_OBJ = $(DEBUG_OBJ_DIR)/client.o
SERVER_DEBUG_OBJ = $(DEBUG_OBJ_DIR)/server.o

CLIENT_RELEASE_OBJ = $(RELEASE_OBJ_DIR)/client.o
SERVER_RELEASE_OBJ = $(RELEASE_OBJ_DIR)/server.o

CLIENT_DEBUG_EXE = $(DEBUG_DIR)/client
SERVER_DEBUG_EXE = $(DEBUG_DIR)/server

CLIENT_RELEASE_EXE = $(RELEASE_DIR)/client
SERVER_RELEASE_EXE = $(RELEASE_DIR)/server

.PHONY: all debug release clean

all: debug release

debug: $(CLIENT_DEBUG_EXE) $(SERVER_DEBUG_EXE)

release: $(CLIENT_RELEASE_EXE) $(SERVER_RELEASE_EXE)

$(DEBUG_OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(RELEASE_OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(CLIENT_DEBUG_EXE): $(CLIENT_DEBUG_OBJ)
	$(CC) $< -o $@ $(LDFLAGS)

$(SERVER_DEBUG_EXE): $(SERVER_DEBUG_OBJ)
	$(CC) $< -o $@ $(LDFLAGS)

$(CLIENT_RELEASE_EXE): $(CLIENT_RELEASE_OBJ)
	$(CC) $< -o $@ $(LDFLAGS)

$(SERVER_RELEASE_EXE): $(SERVER_RELEASE_OBJ)
	$(CC) $< -o $@ $(LDFLAGS)

clean:
	rm -rf $(DEBUG_DIR) $(RELEASE_DIR)
