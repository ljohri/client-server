CC = gcc  
CFLAGS = -Wall -Wextra -g -I./include
LDFLAGS = -lpthread
DEBUG_DIR = debug
DEBUG_OBJ_DIR = $(DEBUG_DIR)/obj

CLIENT_SRC = client.c

CLIENT_DEBUG_OBJ = $(DEBUG_OBJ_DIR)/client.o $(DEBUG_OBJ_DIR)/sec.o

CLIENT_DEBUG_EXE = $(DEBUG_DIR)/client

 

debug: $(CLIENT_DEBUG_EXE)

$(DEBUG_OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(CLIENT_DEBUG_EXE): $(CLIENT_DEBUG_OBJ)
	$(CC) $(CLIENT_DEBUG_OBJ) -o $@ $(LDFLAGS)


clean:
	rm -rf $(DEBUG_DIR) 

