#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

int main() {
	// Disable output buffering
	setbuf(stdout, NULL);

	printf("Your code goes here!\n");

	// Uncomment the implementation below to pass the first stage

	/* int server_fd, client_addr_len; */
	/* struct sockaddr_in client_addr; */

	/* server_fd = socket(AF_INET, SOCK_STREAM, 0); */
	/* if (server_fd == -1) { */
	/* 	printf("Socket creation failed: %s...\n", strerror(errno)); */
	/* 	exit(1); */
	/* } */

	/* int reuse = 1; */
	/* if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEPORT, (const char*)&reuse, sizeof(reuse)) < 0) { */
	/* 	printf("SO_REUSEPORT failed: %s \n", strerror(errno)); */
	/* 	return -1; */
	/* } */

	/* struct sockaddr_in serv_addr = { .sin_family = AF_INET , */
	/* 								 .sin_port = htons(6379), */
	/* 								 .sin_addr = { htonl(INADDR_ANY) }, */
	/* 								}; */

	/* if (bind(server_fd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) != 0) { */
	/* 	printf("Bind failed: %s \n", strerror(errno)); */
	/* 	exit(1); */
	/* } */

	/* if ((listen(server_fd, 5)) != 0) {  */
	/* 	printf("Listen failed: %s \n", strerror(errno)); */
	/* 	exit(1);  */
	/* } */



	/* printf("Waiting for a client to connect...\n");  */
	/* client_addr_len = sizeof(client_addr); */

	/* accept(server_fd, (struct sockaddr *) &client_addr, &client_addr_len); */
	/* printf("Client connected\n");  */

	/* close(server_fd); */

	return 0;
}
