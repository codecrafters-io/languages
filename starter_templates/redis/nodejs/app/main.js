const net = require('net');

console.log("Your code goes here!");

// Uncomment this block to pass the first stage
// const server = net.createServer(function(socket) {
//   socket.write('Echo server\r\n');
//   socket.pipe(socket);
// });
//
// server.listen(6379, '127.0.0.1');
//
// server.on('request', function(request) {
//   const connection = request.accept(null, request.origin);
//
//   connection.on('close', function() {
//     console.log('Client has disconnected.');
//   });
// });
