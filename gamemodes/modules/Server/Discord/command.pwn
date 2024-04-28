
#include <discord-cmd>
#include <sscanf2>
#define DCMD_STRICT_CASE //Defining this will make commands case-sensitive. !test and !TEST will become different
#define DCMD_ALLOW_BOTS //Defining this will not ignore commands sent on channel by bots.

/*public DCC_OnMessageCreate(DCC_Message:message)
{
    new DCC_Channel:Temp_Channel, Temp_Content[1280];
    DCC_GetMessageChannel(message, Temp_Channel);


    DCC_GetMessageContent(DCC_Message:message, Temp_Content);
    
    return 1;
}
*/
enum HINT_COMMAND{
    hint_id,
    hint_cmd[1280],
    hint_describe[1280]
}
new HintCommand[][HINT_COMMAND] = {
    {0, "verify", "Xác thực tài khoản"}
};

DCMD:verify(user, channel, params[])
{
    if(!DISCORD_IsChannel(channel,SSA_CMD)) return DISCORD_WARNING_MSG(channel, "Lệnh không khả dụng trong kênh này \nCố tình 'Spam' sẽ bị `Mute`");

    if(DISCORD_HadRole(user, AuthMember)) return DISCORD_ERROR_MSG(SSA_CMD, "Bạn đã xác thực \nNếu đây là bug role(chưa xác thực nhưng đã có role `Authentic Member`) thì hãy liên hệ Admin ngay nhé~~~");

    new PlayerAuthName[MAX_PLAYER_NAME];
    if(sscanf(params, "s[128]",PlayerAuthName)) return DISCORD_SendUsageCMD("/verify [Tên đăng nhập (VD: ~~Jey_Bee)~~]");

    AuthAccount(user, PlayerAuthName);
    return 1;
}