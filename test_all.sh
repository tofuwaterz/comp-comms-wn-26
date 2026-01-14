#!/bin/bash

# CPSC-471 Programming Assignment 1 - Complete Test Suite
# This script tests the web server and client together

cd /home/luisenriquesalgado/Documents/comp-comms/comp-comms-wn-26

echo "=========================================="
echo "CPSC-471 Web Server & Client Test Suite"
echo "=========================================="
echo ""

# Start the server in the background
echo "[1/4] Starting server on port 6789..."
python3 server.py > /tmp/server.log 2>&1 &
SERVER_PID=$!
echo "Server started with PID: $SERVER_PID"
echo ""

# Give server time to start
sleep 2

# Test 1: Successful request
echo "[2/4] TEST 1: Requesting HelloWorld.html (HTTP 200 expected)"
echo "Command: python3 client.py localhost 6789 HelloWorld.html"
echo "---"
python3 client.py localhost 6789 HelloWorld.html
echo ""
echo ""

# Test 2: 404 Error
echo "[3/4] TEST 2: Requesting nonexistent.html (HTTP 404 expected)"
echo "Command: python3 client.py localhost 6789 nonexistent.html"
echo "---"
python3 client.py localhost 6789 nonexistent.html
echo ""
echo ""

# Clean up
echo "[4/4] Cleaning up..."
kill $SERVER_PID 2>/dev/null
wait $SERVER_PID 2>/dev/null
echo "Server stopped"
echo ""

echo "=========================================="
echo "All tests completed!"
echo "=========================================="
