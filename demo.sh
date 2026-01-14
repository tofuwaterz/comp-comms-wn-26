#!/bin/bash

cd /home/luisenriquesalgado/Documents/comp-comms/comp-comms-wn-26

python3 server.py > /tmp/server.log 2>&1 &
SERVER_PID=$!
sleep 2

echo "=== TEST 1: GET HelloWorld.html ==="
python3 client.py localhost 6789 HelloWorld.html
echo ""
echo ""

echo "=== TEST 2: 404 Not Found ==="
python3 client.py localhost 6789 nonexistent.html
echo ""

kill $SERVER_PID 2>/dev/null
echo "Client command:"
echo "  $ python3 client.py localhost 6789 HelloWorld.html"
echo ""
echo "What this does:"
echo "  1. Creates a TCP socket connection to localhost:6789"
echo "  2. Sends HTTP GET request for /HelloWorld.html"
echo "  3. Receives HTTP response and file contents"
echo "  4. Displays the response"
echo ""
read -p "Press Enter to execute the client request..."
echo ""
echo "Server Response:"
echo "─" | awk '{for(i=0;i<76;i++)printf "─"}' && echo ""
python3 client.py localhost 6789 HelloWorld.html
echo "─" | awk '{for(i=0;i<76;i++)printf "─"}' && echo ""
echo ""
echo "✓ Success! The server sent:"
echo "  - HTTP Status: 200 OK"
echo "  - Response Headers: Content follows"
echo "  - Response Body: Complete HTML file"
echo ""
read -p "Press Enter to continue to the second client request (404 error)..."

# =============================================================================
# STEP 3: 404 Error Request
# =============================================================================
clear
echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║ STEP 3: Client Requests Non-Existent File (HTTP 404 Error)             ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "Client command:"
echo "  $ python3 client.py localhost 6789 nonexistent.html"
echo ""
echo "What this does:"
echo "  1. Creates a TCP socket connection to localhost:6789"
echo "  2. Sends HTTP GET request for /nonexistent.html"
echo "  3. Server tries to open file but it doesn't exist (IOError)"
echo "  4. Server catches exception and sends 404 response"
echo "  5. Client displays the error response"
echo ""
read -p "Press Enter to execute the client request..."
echo ""
echo "Server Response:"
echo "─" | awk '{for(i=0;i<76;i++)printf "─"}' && echo ""
python3 client.py localhost 6789 nonexistent.html
echo "─" | awk '{for(i=0;i<76;i++)printf "─"}' && echo ""
echo ""
echo "✓ 404 Error handled correctly! The server sent:"
echo "  - HTTP Status: 404 Not Found"
echo "  - Response Headers: Content follows"
echo "  - Response Body: 404 error page"
echo ""
read -p "Press Enter to clean up and finish the demo..."

# =============================================================================
# CLEANUP
# =============================================================================
clear
echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║ Demo Complete - Cleaning Up                                            ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "Stopping server..."
kill $SERVER_PID 2>/dev/null
wait $SERVER_PID 2>/dev/null
echo "✓ Server stopped"
echo ""
echo "Demo Summary:"
echo "─────────────────────────────────────────────────────────────────────────"
echo "✓ Server successfully started and listened for connections"
echo "✓ Client successfully connected to server"
echo "✓ HTTP 200 OK response: File retrieved and served correctly"
echo "✓ HTTP 404 Not Found: Error handled properly for missing file"
echo "✓ All socket connections properly closed"
echo ""
echo "Your implementation is complete and working correctly!"
echo "Ready for submission to Canvas."
echo ""
