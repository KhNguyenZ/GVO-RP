const { Client, GatewayIntentBits, REST, Routes, SlashCommandBuilder } = require('discord.js');
const mysql = require('mysql2');
const { token, clientId, guildId } = require('../config.json'); 

const commands = [
    new SlashCommandBuilder()
        .setName('verify')
        .setDescription('Xác thực tài khoản **Ingame** với **Discord** của bạn!')
        .addStringOption(option =>
            option.setName('username')
                .setDescription('Tên tài khoản (Không phải tên nhân vật)')
                .setRequired(true)),
].map(command => command.toJSON());

const rest = new REST({ version: '10' }).setToken(token);

(async () => {
    try {
        console.log('Started refreshing application (/) commands.');

        await rest.put(
            Routes.applicationGuildCommands(clientId, guildId),
            { body: commands },
        );

        console.log('Successfully reloaded application (/) commands.');
    } catch (error) {
        console.error(error);
    }
})();

const client = new Client({ intents: [GatewayIntentBits.Guilds] });

client.once('ready', () => {
    console.log('Bot is online!');
});

client.on('interactionCreate', async interaction => {
    if (!interaction.isCommand()) return;
});

client.login(token);
