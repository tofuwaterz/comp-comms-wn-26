# CPSC-471 Programming Assignment 1 - Socket Programming Web Server

## Assignment Overview
This assignment implements a simple HTTP web server and client in Python to demonstrate socket programming concepts including:
- TCP socket creation and binding
- HTTP request/response parsing
- File retrieval and error handling
- HTTP 404 error responses

## Files Included
- `server.py` - HTTP web server implementation
- `client.py` - HTTP client implementation  
- `HelloWorld.html` - Sample HTML file for testing
- `README.md` - This file

## Implementation Details

### Web Server (server.py)
The server:
- Binds to port 6789 on localhost
- Listens for incoming HTTP requests
- Parses GET requests to extract the requested filename
- Attempts to open and read the requested file
- Sends HTTP 200 OK response with file contents on success
- Sends HTTP 404 Not Found response if file doesn't exist
- Handles one connection at a time in a loop

Key features:
- Exception handling for missing files
- Proper HTTP headers in responses
- Socket cleanup and program termination

### HTTP Client (client.py)
The client:
- Takes three command-line arguments: server host, server port, and filename
- Creates a TCP socket and connects to the server
- Constructs and sends a proper HTTP GET request
- Receives the complete server response
- Displays the response to the console

## How to Run

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

### Using a Web Browser
1. Start the server as above
2. Open a web browser and navigate to:
   ```
   http://localhost:6789/HelloWorld.html
   ```
3. The browser should display the HelloWorld.html content

## Testing Instructions

### Test 1: Successful File Request
1. Start the server: `python3 server.py`
2. In another terminal, run: `python3 client.py localhost 6789 HelloWorld.html`
3. Expected output: HTTP 200 response with HTML content

### Test 2: 404 Error
1. Server should still be running
2. Run: `python3 client.py localhost 6789 nonexistent.html`
3. Expected output: HTTP 404 Not Found response with error message

### Test 3: Browser Test
1. Start the server
2. Open browser and go to: `http://localhost:6789/HelloWorld.html`
3. Expected result: Browser displays the Hello World page

## Group Members
[Please add names and email addresses of all group members here]

## Notes
- Make sure the server and HTML files are in the same directory before running
- Use the correct port number (6789) when accessing the server
- The server runs indefinitely - use Ctrl+C to stop it
- The client automatically closes the connection after receiving the response

## Assignment Submission
This assignment has been completed according to the specifications in Prog_Assignment 1.pdf
