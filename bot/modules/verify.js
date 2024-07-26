// verify.js

const connection = require('./db.js');


function verify(username, callback) {
    const query = 'SELECT * FROM accounts WHERE `Username` = ?';

    connection.query(query, [username], (error, results) => {
        if (error) {
            console.error('Lỗi truy vấn: ' + error.stack);
            return callback(false);
        }
        callback(results.length > 0);
    });
}

module.exports = verify;

function fetchAll(query, params = []) {
    return new Promise((resolve, reject) => {
        connection.query(query, params, (error, results) => {
            if (error) {
                console.error('Lỗi truy vấn: ' + error.stack);
                return reject(error);
            }
            resolve(results);
        });
    });
}

module.exports = fetchAll;



function GetAccountInfo(username, callback) {
    // Cẩn thận với việc xây dựng truy vấn SQL trực tiếp. Nên sử dụng tham số thay vì nối chuỗi để tránh SQL Injection.
    const query = "SELECT * FROM accounts WHERE Username = ?";
    
    fetchAll(query, [username])
        .then(results => {
            callback(null, results); // Trả kết quả qua callback
        })
        .catch(error => {
            callback(error, null); // Trả lỗi qua callback
        });
}

module.exports = GetAccountInfo;