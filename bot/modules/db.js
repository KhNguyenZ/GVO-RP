const mysql = require('mysql2');
const { dbConfig } = require('../config/db_config.json');

const connection = mysql.createConnection(dbConfig);

connection.connect(err => {
    if (err) {
        console.error('Lỗi kết nối cơ sở dữ liệu:', err);
        return;
    }
    console.log('Kết nối cơ sở dữ liệu thành công.');
});

module.exports = connection;
