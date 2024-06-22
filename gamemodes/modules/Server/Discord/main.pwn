#include <YSI_Coding\y_hooks>
#include <discord-connector>

new DCC_Guild:SSA_GUILD_ID;
new DCC_Channel:SSA_MAINTAINCE;
new DCC_Channel:SSA_CMD;
new DCC_Role:AuthMember;
new DCC_Channel:LogAuth;
new DCC_Channel:LogMoney;
new DCC_Channel:LogBank;

hook SSA_Mysql_Intit()
{
    LogBank = DCC_FindChannelById("1253565213446373397");

    LogMoney = DCC_FindChannelById("1253565213446373397");
    LogAuth = DCC_FindChannelById("1253565213446373397");
    
    SSA_GUILD_ID = DCC_FindGuildById("1235864057278365756");
    SSA_CMD = DCC_Channel:DCC_FindChannelById("1253178296741400596");
    SSA_MAINTAINCE = DCC_Channel:DCC_FindChannelById("1253565054675320893");
    AuthMember = DCC_Role:DCC_FindRoleById("1234182795459297300");
    if(SERVER_TEST == 0) DISCORD_MSG(SSA_MAINTAINCE, "Máy chủ đã được khởi động \nNgười chơi có thể connect rồi đóooooo\n_SV.GVO.VN:7777_");

    return 1;
}