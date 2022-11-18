'use strict';

const express = require('express');

// Constants
const PORT = process.env.SERVER_PORT || 8080;

// 0.0.0.0 and not 127.0.0.1
// ----------------------------------------------------------------------------------------------------
// In Docker 127.0.0.1 almost always means “this container”, not “this machine”. 
// If you make an outbound connection to 127.0.0.1 from a container it will return to the same container; 
// if you bind a server to 127.0.0.1 it will not accept connections from outside.
// So, if you set a service to bind to 127.0.0.1, that’s the address of the lo interface, 
// and the service will only accept connections from that interface.
// It you set it to bind to 0.0.0.0, it will also accept connections from the per-container eth0 interface, 
// where all connections from outside the container arrive.
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
    console.log('Request received!')
    res.send('Hello World\n');
});

app.listen(PORT, HOST, () => {
    console.log(`Running on http://${HOST}:${PORT}`);
});