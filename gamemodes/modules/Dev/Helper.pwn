/*enum HelpCMD_D{
    h_type,
    h_cmd,
    h_describe
}
new const HelpCMD[][HelpCMD_D] = {
    {"bank", "/banking", "Dung de su dung he thong banking"},
    {"org", "/org", "Dung de quan li to chuc cua ban"},
    {"veh", "/carengine", "Khoi dong xe"},
};*/
enum AHelpCMD_D{
    h_cmd[1280],
    h_describe[1280]
}
new const General_HelpCMD[][AHelpCMD_D] = {
    {"/banking", "Quan li tai khoan ngan hang"},
    {"/mycar", "Quan li kho xe"},
    {"/hanhdong or /animlist", "Tro giup hanh dong"},
    {"/char or /r", "De tro chuyen"},
    {"/org", "De quan li 'To chuc'"},
    {"/sb","De deo day an toan"}
};
new const Org_HelpCMD[][AHelpCMD_D] = {
    {"/orgs", "Cai dat to chuc"},
    {"/saveorgs", "Save tat ca cac to chuc"},
    {"/makeleader", "Trao quyen quan li 'To chuc' cho ai do"},
    {"/createorg", "Tao 'To chuc' moi"},
    {"/createorgveh", "Tao xe cho 'To chuc'"}
};
new const Dynamic_HelpCMD[][AHelpCMD_D] = {
    {"/taodoor", "Tao door moi"},
    {"/dname", "Cai dat ten cho door"},
    {"/dedit", "Tuy chinh door"},
    {"/bcreate", "Tao cua hang"},
    {"/bedit", "Tao cua hang"},
    {"/bcreate", "Tao cua hang"}
    // {"/bcreate", "Tao cua hang"}
};

CMD:ahelp(playerid)
{
    if(!CheckAdmin(playerid, 1)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    ShowPlayerDialog(playerid, DIALOG_AHELP, DIALOG_STYLE_LIST, "Admin Help",
    "Organization\nDynamic(Door & Biz & House)", ">>", "<<");
    return 1;
}

CMD:help(playerid)
{
    if(!CheckAdmin(playerid, 1)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help",
    "General", ">>", "<<");
    return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_HELP)
    {
        new _cmd_ah[1280];
        if(listitem == 0)
        {
            for(new i; i < sizeof(General_HelpCMD); i++)
            {
                new _cmd_ahz[1280];
                format(_cmd_ahz, 1280, "{d7f562}%s{FFFFFF} - %s \n", General_HelpCMD[i][h_cmd], General_HelpCMD[i][h_describe]);
                strcat(_cmd_ah, _cmd_ahz);
            }
            strcat(_cmd_ah, "END");
            ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Help", _cmd_ah, "..", "");
        }
    }
    if(dialogid == DIALOG_AHELP)
    {
        new _cmd_ah[1280];
        if(listitem == 0)
        {
            for(new i; i < sizeof(Org_HelpCMD); i++)
            {
                new _cmd_ahz[1280];
                format(_cmd_ahz, 1280, "{d7f562}%s{FFFFFF} - %s \n", Org_HelpCMD[i][h_cmd], Org_HelpCMD[i][h_describe]);
                strcat(_cmd_ah, _cmd_ahz);
            }
            strcat(_cmd_ah, "END");
            ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Admin Help", _cmd_ah, "..", "");
        }
        if(listitem == 1)
        {
            for(new i; i < sizeof(Dynamic_HelpCMD); i++)
            {
                new _cmd_ahz[1280];
                format(_cmd_ahz, 1280, "{d7f562}%s{FFFFFF} - %s \n", Dynamic_HelpCMD[i][h_cmd], Dynamic_HelpCMD[i][h_describe]);
                strcat(_cmd_ah, _cmd_ahz);
            }
            strcat(_cmd_ah, "END");
            ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "Admin Help", _cmd_ah, "..", "");
        }
    }
    return 1;
}