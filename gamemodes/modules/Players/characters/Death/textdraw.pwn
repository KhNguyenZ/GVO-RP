func:CreateDeathUI(playerid)
{
    DeathUI[playerid][0] = CreatePlayerTextDraw(playerid, -11.000, -1.000, "mdl-2019:bg");
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][0], 665.000, 469.000);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][0], 1);
    PlayerTextDrawColor(playerid, DeathUI[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, DeathUI[playerid][0], 255);
    PlayerTextDrawFont(playerid, DeathUI[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][0], 1);

    DeathUI[playerid][1] = CreatePlayerTextDraw(playerid, 237.000, 159.000, "mdl-2019:text");
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][1], 160.000, 66.000);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][1], 1);
    PlayerTextDrawColor(playerid, DeathUI[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, DeathUI[playerid][1], 255);
    PlayerTextDrawFont(playerid, DeathUI[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][1], 1);

    DeathUI[playerid][2] = CreatePlayerTextDraw(playerid, 237.000, 243.000, "mdl-2019:911");
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][2], 48.000, 24.000);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][2], 1);
    PlayerTextDrawColor(playerid, DeathUI[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, DeathUI[playerid][2], 255);
    PlayerTextDrawFont(playerid, DeathUI[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, DeathUI[playerid][2], 1);

    DeathUI[playerid][3] = CreatePlayerTextDraw(playerid, 344.000, 243.000, "mdl-2019:death");
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][3], 48.000, 24.000);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][3], 1);
    PlayerTextDrawColor(playerid, DeathUI[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, DeathUI[playerid][3], 255);
    PlayerTextDrawFont(playerid, DeathUI[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, DeathUI[playerid][3], 1);
    return 1;
}

func:DestroyDeathUI(playerid)
{
    for(new i; i < 4 ; i++)
    {
        PlayerTextDrawDestroy(playerid, DeathUI[playerid][i]);
    }
    CancelSelectTextDraw(playerid);
    return 1;
}

func:ShowDeathUI(playerid)
{
    for(new i; i < 4 ; i++)
    {
        PlayerTextDrawShow(playerid, DeathUI[playerid][i]);
    }
    SelectTextDraw(playerid, COLOR_RED);
}