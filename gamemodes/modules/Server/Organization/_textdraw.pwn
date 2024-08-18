func:CreatePlayerOrgManagement(playerid)
{
    OrgPTD[playerid][0] = CreatePlayerTextDraw(playerid, 116.000, 122.000, "mdl-2010:org");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][0], 421.000, 242.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][0], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][0], 1);

    OrgPTD[playerid][1] = CreatePlayerTextDraw(playerid, 123.000, 315.000, "mdl-2010:list-member");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][1], 92.000, 17.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][1], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][1], 1);

    OrgPTD[playerid][2] = CreatePlayerTextDraw(playerid, 228.000, 315.000, "mdl-2010:weapon");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][2], 92.000, 17.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][2], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][2], 1);

    OrgPTD[playerid][3] = CreatePlayerTextDraw(playerid, 333.000, 315.000, "mdl-2010:safe");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][3], 92.000, 17.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][3], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][3], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][3], 1);

    OrgPTD[playerid][4] = CreatePlayerTextDraw(playerid, 438.000, 315.000, "mdl-2010:quit");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][4], 92.000, 17.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][4], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][4], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][4], 1);

    OrgPTD[playerid][5] = CreatePlayerTextDraw(playerid, 282.000, 339.000, "mdl-2010:giaitan");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][5], 92.000, 17.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][5], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][5], 1);

    OrgPTD[playerid][6] = CreatePlayerTextDraw(playerid, 265.000, 153.000, "");
    PlayerTextDrawLetterSize(playerid, OrgPTD[playerid][6], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][6], -12.000, 149.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][6], 2);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][6], 3);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][6], 1);

    OrgPTD[playerid][7] = CreatePlayerTextDraw(playerid, 263.000, 181.000, "");
    PlayerTextDrawLetterSize(playerid, OrgPTD[playerid][7], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][7], -12.000, 122.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][7], 2);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][7], 1);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][7], 150);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][7], 3);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][7], 1);

    OrgPTD[playerid][8] = CreatePlayerTextDraw(playerid, 219.000, 212.000, "");
    PlayerTextDrawLetterSize(playerid, OrgPTD[playerid][8], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][8], -12.000, 28.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][8], 2);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][8], 1);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][8], 150);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][8], 3);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][8], 1);

    OrgPTD[playerid][9] = CreatePlayerTextDraw(playerid, 240.000, 244.000, "");
    PlayerTextDrawLetterSize(playerid, OrgPTD[playerid][9], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][9], -12.000, 28.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][9], 2);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][9], 1);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][9], 150);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][9], 3);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][9], 1);

    OrgPTD[playerid][10] = CreatePlayerTextDraw(playerid, 415.000, 132.000, "");
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][10], 76.000, 73.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][10], 1);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][10], 255);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][10], 4);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, OrgPTD[playerid][10], 1);

    OrgPTD[playerid][11] = CreatePlayerTextDraw(playerid, 451.000, 217.000, "");
    PlayerTextDrawLetterSize(playerid, OrgPTD[playerid][11], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, OrgPTD[playerid][11], -12.000, 28.000);
    PlayerTextDrawAlignment(playerid, OrgPTD[playerid][11], 2);
    PlayerTextDrawColour(playerid, OrgPTD[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, OrgPTD[playerid][11], 1);
    PlayerTextDrawSetOutline(playerid, OrgPTD[playerid][11], 0);
    PlayerTextDrawBackgroundColour(playerid, OrgPTD[playerid][11], 150);
    PlayerTextDrawFont(playerid, OrgPTD[playerid][11], 3);
    PlayerTextDrawSetProportional(playerid, OrgPTD[playerid][11], 1);
    return 1;
}
hook OnPlayerConnect(playerid)
{
    CreatePlayerOrgManagement(playerid);
    return 1;
}
func:ShowPlayerOrgManagement(playerid)
{

    if(Character[playerid][char_OrgID] != -1)
    {
        if(OrgData[Character[playerid][char_OrgID]][org_id] == -1)
        {
            SendErrorMessage(playerid, "Org cua ban khong ton tai hoac da bi giai tan !");
            Character[playerid][char_OrgID] = INVALID_NUMBER;
            return 1;
        }
        SelectTextDraw(playerid, -1);
        SetPVarInt(playerid, #open_org_mng, 1);
        new pOrg = Character[playerid][char_OrgID], org_str[128];
        format(org_str, sizeof(org_str), "%d",OrgGetTotalMember(pOrg));
        PlayerTextDrawSetString(playerid, OrgPTD[playerid][6], OrgData[pOrg][org_name]);
        PlayerTextDrawSetString(playerid, OrgPTD[playerid][7], GetNameFromDB(OrgData[pOrg][org_leader]));
        PlayerTextDrawSetString(playerid, OrgPTD[playerid][8], org_str);

        PlayerTextDrawSetString(playerid, OrgPTD[playerid][9], OrgData[pOrg][org_birth]);
        PlayerTextDrawSetString(playerid, OrgPTD[playerid][10], OrgData[pOrg][org_logo]);

        PlayerTextDrawSetString(playerid, OrgPTD[playerid][11], OrgGetType(OrgData[pOrg][org_type]));

        printf("Name: %s\nLeader: %s \nTotal member: %s\nBirth: %s\nLogo: %s\nType: %d",OrgData[pOrg][org_name],GetNameFromDB(OrgData[pOrg][org_leader]),org_str,OrgData[pOrg][org_birth],OrgData[pOrg][org_logo],OrgData[pOrg][org_type]);
        for(new i; i < 12; i++) PlayerTextDrawShow(playerid, OrgPTD[playerid][i]);
    }
    return 1;
}

func:HidePlayerOrgManagement(playerid)
{
    CancelSelectTextDraw(playerid);
    DeletePVar(playerid, #open_org_mng);
    for(new i; i < 12; i++) PlayerTextDrawHide(playerid, OrgPTD[playerid][i]);
    return 1;
}

CMD:org(playerid)
{
    if(!GetPVarInt(playerid, #open_org_mng)) ShowPlayerOrgManagement(playerid);
    else HidePlayerOrgManagement(playerid);
    return 1;
}


CMD:memberlist(playerid)
{
    OrgShowMemberList(playerid, 1);
    return 1;
}