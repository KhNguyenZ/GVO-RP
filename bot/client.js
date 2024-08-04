const net = require('net');

// Tạo một kết nối đến server
const client = net.createConnection({ port: 7778, host: '127.0.0.1' }, () => {
  console.log('Connected to server');

  // Gửi tin nhắn đến server
  client.write('Hi, server!');
});

// Xử lý dữ liệu nhận được từ server
client.on('data', (data) => {
  console.log('Received from server:', data.toString());
  client.end(); // Đóng kết nối sau khi nhận phản hồi
});

// Xử lý sự kiện kết nối bị đóng
client.on('end', () => {
  console.log('Disconnected from server');
});

// Xử lý lỗi
client.on('error', (err) => {
  console.error('Client error:', err);
});
