#!/usr/bin/env python3

from socket import *
import sys

# Get command line arguments
if len(sys.argv) != 4:
    print("Usage: python3 client.py server_host server_port filename")
    sys.exit(1)

server_host = sys.argv[1]
server_port = int(sys.argv[2])
filename = sys.argv[3]

# Create a socket and connect to the server
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((server_host, server_port))

# Construct the HTTP GET request
request = f"GET /{filename} HTTP/1.1\r\nHost: {server_host}:{server_port}\r\nConnection: close\r\n\r\n"

# Send the request to the server
clientSocket.send(request.encode())

# Receive and display the response
response = b""
while True:
    chunk = clientSocket.recv(1024)
    if not chunk:
        break
    response += chunk

# Close the socket
clientSocket.close()

# Print the response
print(response.decode())
