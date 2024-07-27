const { SlashCommandBuilder } = require('discord.js');
const { isUserOnline, isDiscordLinked } = require('./db.js');
const { 
    isChannel, 
    hadRole, 
    sendErrorMessage, 
    sendWarningMessage, 
    sendUsageCommand,
    authAccount
} = require('./discord.js');

const { commandChannelId, authMemberRoleId } = require('../config.json');

module.exports = {
    data: new SlashCommandBuilder()
        .setName('verify')
        .setDescription('Xác thực tài khoản Ingame với Discord của bạn!')
        .addStringOption(option =>
            option.setName('username')
                .setDescription('Tên tài khoản (Không phải tên nhân vật)')
                .setRequired(true)),

    async execute(interaction) {
        const username = interaction.options.getString('username');
        const userId = interaction.user.id;
        const channelId = interaction.channel.id;

        // Kiểm tra kênh
        if (!isChannel(channelId, commandChannelId)) {
            return sendWarningMessage(interaction, `Lệnh không khả dụng trong kênh này \nCố tình 'Spam' sẽ bị **Mute** <@${userId}>`);
        }

        // Kiểm tra vai trò của người dùng
        if (await hadRole(userId, authMemberRoleId)) {
            return sendErrorMessage(interaction, `Bạn đã xác thực \nNếu đây là bug role(chưa xác thực nhưng đã có role **Authentic Member**) thì hãy liên hệ Admin ngay nhé~~~ <@${userId}>`);
        }

        // Kiểm tra tính hợp lệ của tên tài khoản
        if (!username || username.length > 128) {
            return sendUsageCommand(interaction, `/verify [Tên đăng nhập (VD: ~~Jey_Bee)~~] <@${userId}>`);
        }

        // Kiểm tra trạng thái trực tuyến của tài khoản
        if (await isUserOnline(username)) {
            return sendErrorMessage(interaction, `Tài khoản của bạn đang Online, vui lòng thoát (/quit) game!!! <@${userId}>`);
        }

        // Kiểm tra liên kết Discord
        if (await isDiscordLinked(userId)) {
            return sendErrorMessage(interaction, `1 Discord chỉ có thể liên kết được 1 Account! <@${userId}>`);
        }

        // Xác thực tài khoản
        await authAccount(userId, username);
    }
};
