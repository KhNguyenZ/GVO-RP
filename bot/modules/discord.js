const { Client, GatewayIntentBits, Collection, TextChannel,MessageEmbed,EmbedBuilder } = require('discord.js');
const mysql = require('mysql2/promise');
// const { dbConfig } = require('../config.json');
const { dbConfig, token, guildId, clientId, authMemberRoleId, commandChannelId } = require('../config.json');
// const { token, guildId } = require('../config.json');
// Khởi tạo client Discord
const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent,
        GatewayIntentBits.DirectMessages,
        GatewayIntentBits.GuildMembers
    ]
});

client.login(token);

function isChannel(tempChannel, channel) {
    return tempChannel === channel;
}

async function hadRole(user, role) {
    try {
        // Đảm bảo client đã sẵn sàng
        if (!client.isReady()) {
            throw new Error('Client is not ready');
        }

        const guild = await client.guilds.fetch(guildId);
        if (!guild) {
            throw new Error('Guild not found');
        }

        const member = await guild.members.fetch(user);
        if (!member) {
            throw new Error('Member not found');
        }

        return member.roles.cache.has(role);
    } catch (error) {
        console.error('Error in hadRole:', error);
        return false;
    }
}

async function sendMessage(channelId, msg) {
    try {
        const channel = await client.channels.fetch(channelId);
        if (channel instanceof TextChannel) {
            await channel.send(`***>>> ${msg}***`);
        } else {
            console.error('Channel is not a TextChannel');
        }
    } catch (error) {
        console.error('Error sending message:', error);
    }
}

async function sendSuccessMessage(interaction, msg) {
    try {
        await interaction.reply(`***>>> ✅ ${msg}***`);
    } catch (error) {
        console.error('Error sending success message:', error);
    }
}

async function sendErrorMessage(interaction, message) {
    try {
        await interaction.reply({ content: message, ephemeral: true });  // Ephemeral sẽ làm tin nhắn chỉ người dùng lệnh thấy
    } catch (error) {
        console.error('Error sending error message:', error);
    }
}
async function sendWarningMessage(interaction, msg) {
    try {
        await interaction.reply(`***>>> ⚠️ ${msg}***`);
    } catch (error) {
        console.error('Error sending warning message:', error);
    }
}
async function sendInfoMessage(interaction, msg) {
    try {
        await interaction.reply(`***>>> 🛈 ${msg}***`);
    } catch (error) {
        console.error('Error sending info message:', error);
    }
}
async function sendUsageCommand(interaction, cmd) {
    try {
        await interaction.reply(`***> Usage: ${cmd}***`);
    } catch (error) {
        console.error('Error sending usage command:', error);
    }
}

const pool = mysql.createPool(dbConfig);
async function authAccount(userId, username) {
    try {
        // Lấy kết nối cơ sở dữ liệu
        const connection = await pool.getConnection();
        
        // Thực hiện truy vấn để kiểm tra thông tin tài khoản
        const [rows] = await connection.execute("SELECT * FROM `accounts` WHERE `Username` = ?", [username]);
        
        if (rows.length > 0) {
            const account = rows[0];
            const { DiscordID: authDcid, Discord_Auth: authStatus } = account;

            if (authStatus === 0) {
                const authCode = Math.floor(Math.random() * 1000000);
                
                // Gửi mã xác thực qua DM
                const user = await client.users.fetch(userId);
                const embed = new EmbedBuilder()
                    .setTitle('Xác thực tài khoản')
                    .setDescription(`Discord ID: ${userId}\nMã xác thực tài khoản của bạn là [${authCode}]`)
                    .setColor('#2ac7ff')
                    .setThumbnail('https://img.upanh.tv/2024/04/29/Authb35441edd8095edc.png');

                await user.send({ embeds: [embed] });
                await user.send("# HƯỚNG DẪN XÁC THỰC TÀI KHOẢN\nBước 1: Vào game, đăng nhập bằng User bạn vừa mới xác thực, sau đó chọn 1 trong 3 nhân vật bất kỳ để tiến hành xác thực.\nBước 2: Sau khi đã hoàn tất bước chọn nhân vật, hãy sử dụng lệnh /verify [Auth_Code]\nAuth_Code: là mã bạn đã nhận được ở phía trên nhé!\nChúc bạn chơi game vui vẻ tại `GVO` ~~~~");
                await user.send("Nếu nhân vật này không phải của bạn nhưng vẫn cố gắng xác thực, bạn sẽ bị cấm vĩnh viễn tại `GVO`");

                // Cập nhật mã xác thực trong cơ sở dữ liệu
                const updateQuery = "UPDATE `accounts` SET `DiscordID` = ?, `Discord_Code` = ?, `Discord_Auth` = 0 WHERE `Username` = ?";
                await connection.query(updateQuery, [userId, authCode, username]);

                // Thêm vai trò cho người dùng
                try {
                    const guild = await client.guilds.fetch(guildId);
                    const member = await guild.members.fetch(userId);

                    // Kiểm tra vai trò và quyền
                    if (!member.roles.cache.has(authMemberRoleId)) {
                        await member.roles.add(authMemberRoleId);
                    }
                } catch (error) {
                    console.error('Error adding role:', error);
                    await sendErrorMessage(commandChannelId, 'Không thể thêm vai trò cho bạn. Hãy kiểm tra quyền của bot và vai trò.');
                }

                await connection.release();
            } else {
                if (authDcid === userId) {
                    const embed = new MessageEmbed()
                        .setTitle('Success: Auth User')
                        .setDescription(`Tài khoản của bạn đã được xác thực với User [${username}]`)
                        .setColor('#78FF32');
                    
                    await sendMessage(commandChannelId, { embeds: [embed] });
                } else {
                    const dOwner = (await client.users.fetch(authDcid)).username;
                    const embed = new MessageEmbed()
                        .setTitle('Error: Invalid User')
                        .setDescription(`User [${username}] đã được kích hoạt với tài khoản discord [${dOwner}]`)
                        .setColor('#FF0000');
                    
                    await sendMessage(commandChannelId, { embeds: [embed] });
                }
            }
        } else {
            await sendErrorMessage(commandChannelId, "Tài khoản này không tồn tại!!!");
        }
    } catch (error) {
        console.error('Error in authAccount:', error);
    }
}
module.exports = {
    isChannel,
    hadRole,
    sendMessage,
    sendSuccessMessage,
    sendErrorMessage,
    sendWarningMessage,
    sendInfoMessage,
    sendUsageCommand,
    authAccount,
};
