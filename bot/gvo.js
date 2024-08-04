const { Client, GatewayIntentBits, Collection } = require('discord.js');
const fs = require('fs');
const { token } = require('./config.json');

// Khởi tạo client Discord với các intents cần thiết
const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent,
        GatewayIntentBits.DirectMessages,
        GatewayIntentBits.GuildMembers
    ]
});

// Tạo một Collection để lưu trữ các lệnh
client.commands = new Collection();

// Đọc tất cả các tệp lệnh từ thư mục './modules'
const commandFiles = fs.readdirSync('./modules').filter(file => file.endsWith('.js'));

// Nạp tất cả các lệnh vào Collection
for (const file of commandFiles) {
    const command = require(`./modules/${file}`);
    if (!command.data || !command.data.name) {
        continue; // Bỏ qua các tệp lệnh không hợp lệ
    }
    client.commands.set(command.data.name, command);
    console.log(`Loaded command: ${command.data.name}`); // Debugging
}

// Khi client sẵn sàng, in thông báo ra console
client.once('ready', () => {
    console.log('GVO Bot is online!');
    console.log(`Logged in as ${client.user.tag}!`);
    try {
        client.user.setActivity('GVO Roleplay', { type: 4 });
        console.log('Activity set successfully.');
    } catch (error) {
        console.error('Error setting activity:', error);
    }
});

// Xử lý các tương tác lệnh
client.on('interactionCreate', async interaction => {
    if (!interaction.isCommand()) return;

    const command = client.commands.get(interaction.commandName);

    if (!command) {
        console.error(`Command ${interaction.commandName} not found`);
        return;
    }

    try {
        await command.execute(interaction);
    } catch (error) {
        console.error('Error executing command:', error);
        await interaction.reply({ content: 'There was an error while executing this command!', ephemeral: true });
    }
});

// Đăng nhập vào Discord
client.login(token);
