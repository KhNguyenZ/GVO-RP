#define ASSETS_PATH "../../../assets/"
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

func:DISCORD_SendEmbedMsg(DCC_Channel:fchannel,title[], content[], color = 0x2ac7ff, thumbnail[] = "", img[] = "")
{
    new DCC_Embed:embed = DCC_CreateEmbed(title, content);
    DCC_SetEmbedColor(embed, color);
    DCC_SetEmbedThumbnail(DCC_Embed:embed, thumbnail);
    DCC_SetEmbedImage(embed, img);
    DCC_SetEmbedFooter(embed, "© 𝑺𝒐𝒖𝒏𝒕𝒉 𝑶𝒇 𝑺𝒂𝒏 𝑨𝒏𝒅𝒓𝒆𝒂𝒔");
    if(DCC_SendChannelEmbedMessage(fchannel, embed)) return 1;
    return 0;
}

func:AuthAccount(fuser, user_input[], DCID_input[])
{
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

            DCC_CreatePrivateChannel(fuser, "OnPlayerAuthCode", "si", DCID_input,Auth_Code);

            new update_disc[1280];
            format(update_disc, sizeof(update_disc), "UPDATE `accounts` SET `DiscordID` = '%s', `Discord_Code` = '%d', `Discord_Auth` = '0' WHERE `Username` = '%s'",DCID_input,Auth_Code, user_input);
            mysql_query(Handle(), update_disc, false);
            // printf("%s",update_disc);
            DCC_AddGuildMemberRole(SSA_GUILD_ID, fuser, AuthMember);
        }
        else{
            if(strcmp(DCID_input, Auth_DCID))
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
                new d_owner[DCC_USERNAME_SIZE];
                DCC_GetUserName(fuser,d_owner);

                format(auth_code_msg, 1280,"***User [%s] đã được kích hoạt với tài khoản discord [%s]***",UserAuthed,d_owner);
                DCC_SetEmbedFooter(embed, auth_code_msg);
                return DCC_SendChannelEmbedMessage(SSA_CMD, embed);
            }
        }
    }
    else{
        DISCORD_ERROR_MSG(SSA_CMD, "Tài khoản này không tồn tại !!!");
    }
    
    cache_delete(ExitsAccount);
    return 1;
}

forward OnPlayerAuthCode(fdcid[], fauth_code);
public OnPlayerAuthCode(fdcid[], fauth_code){
    new DCC_Channel:UserDM = DCC_GetCreatedPrivateChannel();

    new auth_code_msg[1280];
    format(auth_code_msg, 1280,"Discord ID:%s\nMã xác thực tài khoản của bạn là [%d]",fdcid,fauth_code);

    DISCORD_SendEmbedMsg(UserDM,"Xác thực tài khoản", auth_code_msg,0x2ac7ff,"https://img.upanh.tv/2024/04/29/SSA-Logo-Resizw.png","https://img.upanh.tv/2024/04/29/Authb35441edd8095edc.png");


    DISCORD_MSG(UserDM,
    "# HƯỚNG DẪN XÁC THỰC TÀI KHOẢN \n\
    Bước 1: Vào game , đăng nhập bằng User bạn vừa mới xác thực , sau đó chọn 1 trong 3 character bất kì để tiến hành xác thực \n\
    Bước 2: Sau khi đã hoàn tất bước chọn nhân vật , hãy sử dụng lệnh /verify [Auth_Code]\n\
    Auth_Code: là mã bạn đã nhận được ở phía trên nhé!\n\
    \n\
    Chúc bạn chơi game vui vẻ tại `SSA-RP` ~~~~"
    );
    DISCORD_WARNING_MSG(UserDM,"Nếu nhân vật này không phải của bạn nhưng vẫn cố gắng xác thực , bạn sẽ bị cấm vĩnh viễn tại `SSA-RP`");
    return 1;
}


func:IsUserOnline(fusername[])
{
    new query_check[1280], Cache:IsOnlineCache;
    format(query_check, sizeof(query_check), "SELECT * FROM `accounts` WHERE `Username` = '%s'", fusername);
    IsOnlineCache = mysql_query(Handle(), query_check);
    if(cache_num_rows())
    {
        new OnlineValue;
        cache_get_value_name_int(0, "Online", OnlineValue);

        return OnlineValue;
    }
    cache_delete(IsOnlineCache);
    return 0;
}

func:IsUserAuth(fusername[])
{
    new query_check[1280], Cache:IsOnlineCache;
    format(query_check, sizeof(query_check), "SELECT * FROM `accounts` WHERE `Username` = '%s'", fusername);
    IsOnlineCache = mysql_query(Handle(), query_check);
    if(cache_num_rows())
    {
        new AuthValue;
        cache_get_value_name_int(0, "Discord_Auth", AuthValue);

        return AuthValue;
    }
    cache_delete(IsOnlineCache);
    return 0;
}

func:AuthSuccess(playerid)
{
    new query_auth[1280];
    format(query_auth, sizeof(query_auth), "UPDATE `accounts` SET `Discord_Code` = '0', `Discord_Auth` = '1' WHERE `id` = '%d'", Character[playerid][char_account_id]);
    mysql_query(Handle(), query_auth, false);
    printf("%s",query_auth);
    Character[playerid][char_DC_Auth] = 1;
    Character[playerid][char_DC_Code] = 0;

    SendClientMessage(playerid, COLOR_CYAN, "Ban da xac thuc tai khoan thanh cong");

    new DCID_succes[128];
    format(DCID_succes, sizeof(DCID_succes), "%s",Character[playerid][char_DCID]);

    DCC_CreatePrivateChannel(DCC_FindUserById(DCID_succes), "OnPlayerAuthSuccess", "is", playerid,DCID_succes);
    return 1;
}

forward OnPlayerAuthSuccess(playerid, fdcid_succes[]);
public OnPlayerAuthSuccess(playerid, fdcid_succes[])
{
    new DCC_Channel:AuthDM = DCC_GetCreatedPrivateChannel();

    new auth_msg[1280], OwnerName[DCC_USERNAME_SIZE];
    new DCC_User:UserSuccess = DCC_FindUserById(fdcid_succes);
    DCC_GetUserName(UserSuccess,OwnerName);
    format(auth_msg, sizeof(auth_msg), "Tài khoản discord [%s] đã được xác thực bởi nhân vật [%s] của bạn", OwnerName, player_get_name(playerid, false));
    DISCORD_SendEmbedMsg(AuthDM, "Xác thực tài khoản thành công",auth_msg, 0x2ac7ff, "https://img.upanh.tv/2024/04/29/SSA-Logo-Resizw.png","https://img.upanh.tv/2024/04/29/Authb35441edd8095edc.png");
    DISCORD_SendEmbedMsg(LogAuth, "Xác thực tài khoản thành công",auth_msg, 0x2ac7ff, "https://img.upanh.tv/2024/04/29/SSA-Logo-Resizw.png","https://img.upanh.tv/2024/04/29/Authb35441edd8095edc.png");
    return 1;
}