#include <YSI_Coding\y_hooks>
#include <discord-connector>

new DCC_Guild:SSA_GUILD_ID;
new DCC_Channel:SSA_MAINTAINCE;
new DCC_Channel:SSA_CMD;
new DCC_Role:AuthMember;
hook SSA_Mysql_Intit()
{
    SSA_GUILD_ID = DCC_FindGuildById("1221835813386584126");
    SSA_CMD = DCC_Channel:DCC_FindChannelById("1234175760810643518");
    SSA_MAINTAINCE = DCC_Channel:DCC_FindChannelById("1234168206118354965");
    AuthMember = DCC_Role:DCC_FindRoleById("1234182795459297300");
    DISCORD_MSG(SSA_MAINTAINCE, "Máy chủ đã được khởi động \nNgười chơi có thể connect rồi đóooooo\n127.0.0.1");

    return 1;
}