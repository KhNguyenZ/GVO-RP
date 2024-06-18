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
new const Org_HelpCMD[][AHelpCMD_D] = {
    {"/orgs", "Cai dat to chuc"},
    {"/saveorgs", "Save tat ca cac to chuc"},
    {"/makeleader", "Trao quyen quan li 'To chuc' cho ai do"},
    {"/createorg", "Tao 'To chuc' moi"}
};
/*CMD:help(playerid)
{
    for (new i; i < 1000; i++)
    {

    }
}*/
CMD:ahelp(playerid)
{
    if(!CheckAdmin(playerid, 1)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    ShowPlayerDialog(playerid, DIALOG_AHELP, DIALOG_STYLE_LIST, "Admin Help",
    "Organization\nDoor\nBiz\nHouse", ">>", "<<");
    return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
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
    }
}