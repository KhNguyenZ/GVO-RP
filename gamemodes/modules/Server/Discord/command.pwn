
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

// DCMD:verify(user, channel, params[])
// {
//     if(!DISCORD_IsChannel(channel,SSA_CMD)) return DISCORD_WARNING_MSG(channel, "Lệnh không khả dụng trong kênh này \nCố tình 'Spam' sẽ bị `Mute`");

//     if(DISCORD_HadRole(user, AuthMember)) return DISCORD_ERROR_MSG(SSA_CMD, "Bạn đã xác thực \nNếu đây là bug role(chưa xác thực nhưng đã có role `Authentic Member`) thì hãy liên hệ Admin ngay nhé~~~");
//     new PlayerAuthName[MAX_PLAYER_NAME];
//     if(sscanf(params, "s[128]",PlayerAuthName)) return DISCORD_SendUsageCMD("/verify [Tên đăng nhập (VD: ~~Jey_Bee)~~]");

//     if(IsUserOnline(PlayerAuthName)) return DISCORD_ERROR_MSG(SSA_CMD, "Tài khoản của bạn đang Online , vui lòng thoát (/quit) game !!!");
//     new dcid_o[DCC_ID_SIZE];
//     DCC_GetUserId(user,dcid_o);
//     if(IsDiscordLinked(dcid_o)) return DISCORD_ERROR_MSG(SSA_CMD,"1 Discord chỉ có thể liên kết được 1 Account !");
//     AuthAccount(user, PlayerAuthName, dcid_o);
//     return 1;
// }

CMD:verify(playerid, params[])
{
    if(!strcmp(Character[playerid][char_DCID],"-1")) return SendErrorMessage(playerid, "Vui long truy cap discord va thuc hien lenh /verify nhe !!");
    if(Character[playerid][char_DC_Auth] != 0) return SendErrorMessage(playerid, "Tai khoan cua ban da duoc kich hoat truoc do !!");
    new auth_code[12];

    if(sscanf(params, "s[12]", auth_code)) return SendUsageMessage(playerid, "/verify [Auth_Code]");

    // printf("%s | %s",auth_code,Character[playerid][char_DC_Code]);
    if(!strcmp(auth_code,Character[playerid][char_DC_Code]))
    {
        AuthSuccess(playerid);
    }
    else SendErrorMessage(playerid, "Ma xac thuc khong hop le !!");
    return 1;
}

DCMD:otp(user, channel, params[])
{
    if(!DISCORD_IsChannel(channel,SSA_CMD)) return DISCORD_WARNING_MSG(channel, "Lệnh không khả dụng trong kênh này \nCố tình 'Spam' sẽ bị `Mute`");

    new dcid_o[DCC_ID_SIZE];
    DCC_GetUserId(user,dcid_o);
    if(!IsDiscordLinked(dcid_o)) return DISCORD_ERROR_MSG(SSA_CMD,"Tài khoản của bạn chưa được liên kết với bất kì Account nào !");

    CreateOTP(user, dcid_o);
    return 1;
}