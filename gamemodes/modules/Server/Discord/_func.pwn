func:DISCORD_IsChannel(DCC_Channel:ftemp_channel,DCC_Channel:fchannel)
{
    if(ftemp_channel == fchannel) return 1;
    return 0;
}
func:DISCORD_HadRole(DCC_User:fuser,DCC_Role:frole){
    new bool:fD_HadRole;
    DCC_HasGuildMemberRole(DCC_Guild:SSA_GUILD_ID,fuser, frole, fD_HadRole);
    return fD_HadRole;
}
func:DISCORD_MSG(DCC_Channel:f_msg_channel,discord_msg[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***>>> %s***", discord_msg);
    return DCC_SendChannelMessage(f_msg_channel, output_dmsg);
}
func:DISCORD_SUCCES_MSG(DCC_Channel:f_msg_channel,discord_msg[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***>>> ✅ %s***", discord_msg);
    return DCC_SendChannelMessage(f_msg_channel, output_dmsg);
}
func:DISCORD_ERROR_MSG(DCC_Channel:f_msg_channel,discord_msg[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***>>> ❌ %s***", discord_msg);
    return DCC_SendChannelMessage(f_msg_channel, output_dmsg);
}
func:DISCORD_WARNING_MSG(DCC_Channel:f_msg_channel,discord_msg[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***>>> ⚠️ %s***", discord_msg);
    return DCC_SendChannelMessage(f_msg_channel, output_dmsg);
}
func:DISCORD_INFO_MSG(DCC_Channel:f_msg_channel,discord_msg[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***>>> 🛈 %s***", discord_msg);
    return DCC_SendChannelMessage(f_msg_channel, output_dmsg);
}

func:DISCORD_SendUsageCMD(fcmd[])
{
    new output_dmsg[1280];
    format(output_dmsg, sizeof(output_dmsg),"***> Usage: %s***", fcmd);
    return DCC_SendChannelMessage(SSA_CMD, output_dmsg);
}

func:AuthAccount(fuser, user_input[])
{
    new D_UserID[DCC_ID_SIZE];
    DCC_GetUserId(DCC_User:fuser, D_UserID);
    printf("%s | %d", user_input, strval(D_UserID));
    new auth_query[1280];
    format(auth_query, sizeof(auth_query), "SELECT * FROM `accounts` WHERE `Username` = '%s'",user_input);

    new Cache:ExitsAccount;
    ExitsAccount = mysql_query(Handle(), auth_query);
    new UserAuthed[MAX_PLAYER_NAME];
    new Auth_DCID[1280], Auth_Status;
    new auth_code_msg[1280];
    if(cache_num_rows())
    {
        cache_get_value_name(0,"Username", UserAuthed);
        cache_get_value_name(0,"DiscordID", Auth_DCID);
        cache_get_value_name_int(0,"Discord_Auth", Auth_Status);

        if(Auth_Status == 0)
        {
            new Auth_Code = random(999999);
            DISCORD_MSG(SSA_CMD, "Mã xác thực đã được gửi tới hộp thư DM của bạn !");
            DCC_CreatePrivateChannel(fuser, "OnPlayerAuthCode", "ii", strval(D_UserID),Auth_Code);

            new update_disc[1280];
            format(update_disc, sizeof(update_disc), "UPDATE `accounts` SET `DiscordID` = '%d', `Discord_Code` = '%d', `Discord_Auth` = '0' WHERE `Username` = '%s'",strval(D_UserID),Auth_Code, user_input);
            mysql_query(Handle(), update_disc, false);
            printf("%s",update_disc);
        }
        else{
            if(strval(D_UserID) == strval(Auth_DCID))
            {
                new DCC_Embed:embed = DCC_CreateEmbed("Succes: Auth User", "User của bạn đã được kích hoạt trước đó");
                DCC_SetEmbedColor(embed, 0x78FF32);
                format(auth_code_msg, 1280,"***Tài khoản của bạn đã được xác thực với User [%s]***",UserAuthed);
                DCC_SetEmbedFooter(embed, auth_code_msg);
                return DCC_SendChannelEmbedMessage(SSA_CMD, embed);
            }
            else{
                new nameasf[DCC_USERNAME_SIZE];
                DCC_GetUserName(DCC_User:DCC_FindUserById(Auth_DCID), nameasf);

                new DCC_Embed:embed = DCC_CreateEmbed("Error: Invalid User", "User không hợp lệ");
                DCC_SetEmbedColor(embed, 0xFF0000);
                format(auth_code_msg, 1280,"***User [%s] đã được kích hoạt với tài khoản người khác***",nameasf,UserAuthed);
                DCC_SetEmbedFooter(embed, auth_code_msg);
                return DCC_SendChannelEmbedMessage(SSA_CMD, embed);
            }
        }
    }
    
    cache_delete(ExitsAccount);
    return 1;
}

forward OnPlayerAuthCode(fdcid, fauth_code);
public OnPlayerAuthCode(fdcid, fauth_code){
    new DCC_Channel:UserDM = DCC_GetCreatedPrivateChannel();

    new auth_code_msg[1280];
    format(auth_code_msg, 1280,"Discord ID:%d\nMã xác thực tài khoản của bạn là [%d]",fdcid,fauth_code);
    DISCORD_INFO_MSG(UserDM, auth_code_msg);
}