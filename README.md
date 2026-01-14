# CPSC-471 Programming Assignment 1

## Group Members
Lili Adnani, Julian Ceja,Luis Salgado

## General Use Instructions

### Starting the Server
1. Ensure the server and HelloWorld.html are in the same directory
2. Run the server:
   ```bash
   python3 server.py
   ```
3. The server will display "Ready to serve..." and wait for connections

### Running the Client
1. Open another terminal
2. To request HelloWorld.html:
   ```bash
   python3 client.py localhost 6789 HelloWorld.html
   ```
3. To test a non-existent file (404 error):
   ```bash
   python3 client.py localhost 6789 nonexistent.html
   ```


