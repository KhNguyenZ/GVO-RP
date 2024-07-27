const mysql = require('mysql2/promise');
const { dbConfig } = require('../config.json');

// Kết nối cơ sở dữ liệu
async function queryDatabase(query, params = []) {
    const connection = await mysql.createConnection(dbConfig);
    const [results] = await connection.execute(query, params);
    await connection.end();
    return results;
}

// Kiểm tra xem người dùng có đang trực tuyến không
async function isUserOnline(username) {
    const results = await queryDatabase("SELECT `Online` FROM `accounts` WHERE `Username` = ?", [username]);
    return results.length > 0 ? results[0].Online : false;
}

// Kiểm tra xem ID Discord có được liên kết không
async function isDiscordLinked(discordId) {
    const results = await queryDatabase("SELECT 1 FROM `accounts` WHERE `DiscordID` = ? AND `Discord_Auth` = 1 LIMIT 1", [discordId]);
    return results.length > 0;
}

module.exports = { queryDatabase, isUserOnline, isDiscordLinked };
