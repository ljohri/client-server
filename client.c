#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
int test(); 

int main() {
    int client_socket;
    struct sockaddr_in server_addr;
    char message[] = "Hello, Server!";

    // Create socket
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket == -1) {
        perror("Error creating socket");
        exit(1);
    }

    // Initialize server address structure
    server_addr.sin_family = AF_INET; 
    server_addr.sin_port = htons(5555);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    // Connect to the server
    if (connect(client_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
        perror("Error connecting to server");
        exit(1);
    }

    // Send data to the server
    if (send(client_socket, message, sizeof(message), 0) == -1) {
        perror("Error sending data");
        exit(1);
    }

    printf("Message sent to server: %s\n", message);
    test();
    // Close the socket
    close(client_socket);

    return 0;
}
