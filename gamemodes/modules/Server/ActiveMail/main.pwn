#include <YSI_Coding\y_hooks>

func:GetNumberic(szInput[])
{
    new szOutput[1280];
    for(new i; i < strlen(szInput); i++)
    {
        if(IsNumeric(szInput[i])){
            strcat(szOutput,szInput[i]);
        }
    }
    return szOutput;
}
func:SendMail(playerid)
{
    new check_url[128];
    format(check_url, 128, "%sapi/mailer.php?Username=%s", SERVER_API, player_get_name(playerid, false));
    HTTP(playerid, HTTP_GET, check_url, "", "SendUserMail");
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    if(SERVER_TEST == 1) return 1;
    
    SetPVarInt(playerid, #Success_Mail, -2);
    if (isnull(Character[playerid][char_Email]))
    {
        ShowPlayerDialog(playerid, 2124, DIALOG_STYLE_INPUT, "Vui long xac thuc email", "Vui long nhap email cua ban vao day", ">>", "<<");
    }
    if (!strcmp(Character[playerid][char_Email_Code], "0") || isnull(Character[playerid][char_Email_Code]))
    {
        if (strcmp(Character[playerid][char_Email], "") && Character[playerid][char_Email_Status] == 0)
        {
            SendMail(playerid);
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == 2124)
    {
        if(!response) return ShowPlayerDialog(playerid, 2124, DIALOG_STYLE_INPUT, "Vui long xac thuc email", "Vui long nhap email cua ban vao day", ">>", "<<");
        if (isnull(inputtext)) return
                ShowPlayerDialog(playerid, 2124, DIALOG_STYLE_INPUT, "Vui long xac thuc email", "Vui long nhap email cua ban vao day", ">>", "<<");


        new update_email[1280],
            account_name[1280];

        format(account_name, 1280, "%s", GetAccountName(playerid));
        format(update_email, sizeof(update_email), "UPDATE `accounts` SET `Email` = '%s' WHERE `Username` ='%s'", inputtext, account_name);
        mysql_query(Handle(), update_email);

        format(Character[playerid][char_Email], 50, "%s", inputtext);

        SendMail(playerid);
    }
    return 1;
}

new TimerCheckEmail[MAX_PLAYERS];

forward SendUserMail(index, response_code, data[]);
public SendUserMail(index, response_code, data[])
{
    if (response_code != 200)
    {
        SendErrorMessage(index, "Mat ket noi voi may chu 'API' , hay bao cho Quan tri vien nhanh nhe !");
        KickDelay(index, 2000);
        return 1;
    }
    format(data, 1280, "%s", GetNumberic(data));

    if (strcmp(data,"-1"))
    {
        ShowPlayerDialog(index, 12213, DIALOG_STYLE_MSGBOX, "Xac thuc email",
                         "> {03fc4e}Email{FFFFFF} da duoc gui thanh cong \n> {fc0303}Luu Y:{ffffff} Neu trong truong hop khong thay email , \
        hay truy cap vao 'Thu rac' nhe !!!", ">>", "<<");

        SendServerMessage(index, "Ban co 1p de xac thuc email , sau 1p ban se bi kick");

        SetPVarInt(index, #CheckEmail_Time, 60);

        new getcode_msg[1280], Cache:Code_Cache;
        format(getcode_msg, sizeof(getcode_msg), "SELECT * FROM `accounts` WHERE `Email` = '%s'", Character[index][char_Email]);
        Code_Cache = mysql_query(Handle(), getcode_msg);
        if (cache_num_rows() > 0)
        {
            cache_get_value_name(0, "Email_Code", Character[index][char_Email_Code]);
        }
        cache_delete(Code_Cache);
        TimerCheckEmail[index] = SetTimerEx("OnCheckVerifyEmail", 1000, 1, "is[10]", index, GetNumberic(data));
    }
    else {
        SendErrorMessage(index, "Xac thuc mail bi loi !");
    }
    return 1;
}

forward OnCheckVerifyEmail(playerid, code[]);
public OnCheckVerifyEmail(playerid, code[])
{
    // printf("%s", code);
    TogglePlayerControllable(playerid, 0);
    if (GetPVarInt(playerid, #CheckEmail_Time) >= 0)
    {

        if (GetPVarInt(playerid, #Success_Mail) == 1)
        {
            SendServerMessage(playerid, "Ban da xac thuc email thanh cong !");
            ShowPlayerDialog(playerid, 12213, DIALOG_STYLE_MSGBOX, "","","", "");
            TogglePlayerControllable(playerid, 1);

            KillTimer(TimerCheckEmail[playerid]);
        }

        new check_msg[1280];
        format(check_msg, 1280, "Dang kiem tra 'Xac thuc Email' , thoi gian con %ds", GetPVarInt(playerid, #CheckEmail_Time));
        HienTextdraw(playerid, check_msg, 1000);
        SetPVarInt(playerid, #CheckEmail_Time, GetPVarInt(playerid, #CheckEmail_Time) - 1);

        new getcode_msg[1280], Cache:GetCode;
        format(getcode_msg, sizeof(getcode_msg), "SELECT * FROM `accounts` WHERE `Username` = '%s'", GetAccountName(playerid));
        GetCode = mysql_query(Handle(), getcode_msg);
        if (cache_num_rows())
        {
            cache_get_value_name(0, "Email_Code", Character[playerid][char_Email_Code]);
        }
        cache_delete(GetCode);

        new check_url[128];
        format(check_url, 128, "%sauth/verify_api.php?&CodeVerify=%s&Username=%s", SEVRER_CONTROLLER, Character[playerid][char_Email_Code], GetAccountName(playerid));
        HTTP(playerid, HTTP_GET, check_url, "", "CheckVerifyMail");
        printf("%s", check_url);
    }
    else if(GetPVarInt(playerid, #CheckEmail_Time) == 0)
    {
        if(GetPVarInt(playerid, #Success_Mail) != 1)
        {
            SendErrorMessage(playerid, "Ban chua xac thuc tai khoan trong 60s");
            KickDelay(playerid, 2000);
        }
    }
}

forward CheckVerifyMail(index, response_code, data[]);
public CheckVerifyMail(index, response_code, data[])
{
    format(data, 1280, "%s", GetNumberic(data));
    if (response_code != 200)
    {
        SendErrorMessage(index, "Mat ket noi voi may chu 'API' , hay bao cho Quan tri vien nhanh nhe !");
        KickDelay(index, 2000);
        return 1;
    }
    if (!strcmp(data, "1"))
    {
        SetPVarInt(index, #Success_Mail, 1);
    }
    return 1;
}