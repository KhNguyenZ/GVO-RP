const net = require('net');

const server = net.createServer((socket) => {
  if (!socket.sentWelcome) {
    const welcomeMessage = "Day la 'Response' tu Nodejs cua KhNguyenZ\n";
    socket.write(welcomeMessage);
    socket.sentWelcome = true;
  }

  socket.on('data', (data) => {
    const input = data.toString().trim();
    console.log(input);
    const response = 'Hello to you as well, dear Sir!';
    socket.write(response);
  });

  socket.on('end', () => {
    console.log('Client disconnected');
  });

  socket.on('error', (err) => {
    console.error('Socket error:', err);
  });
});

const PORT = 7778;
const HOST = '127.0.0.1';

server.listen(PORT, HOST, () => {
  console.log(`Server listening on ${HOST}:${PORT}`);
});
