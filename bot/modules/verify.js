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



function GetAccountInfo(username, callback) {
    const query = "SELECT * FROM accounts WHERE Username = ?";
    
    fetchAll(query, [username])
        .then(results => {
            if (results.length > 0) {
                callback(null, results[0]); // Trả về đối tượng đầu tiên nếu tìm thấy
            } else {
                callback(null, null); // Không tìm thấy thông tin
            }
        })
        .catch(error => {
            callback(error, null); // Trả lỗi nếu có
        });
}

module.exports = {verify, GetAccountInfo, fetchAll };