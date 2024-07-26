func:CreateDeathUI(playerid)
{
    DeathUI[playerid][0] = CreatePlayerTextDraw(playerid, 0.000000, 0.000000, "mdl-2019:bg");
    PlayerTextDrawFont(playerid, DeathUI[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, DeathUI[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][0], 640.500000, 448.500000);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][0], 1);
    PlayerTextDrawColour(playerid, DeathUI[playerid][0], -1);
    PlayerTextDrawBackgroundColour(playerid, DeathUI[playerid][0], 255);
    PlayerTextDrawBoxColour(playerid, DeathUI[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, DeathUI[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, DeathUI[playerid][0], 0);

    DeathUI[playerid][1] = CreatePlayerTextDraw(playerid, 229.000000, 112.000000, "mdl-2019:item");
    PlayerTextDrawFont(playerid, DeathUI[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, DeathUI[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][1], 181.500000, 164.000000);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][1], 1);
    PlayerTextDrawColour(playerid, DeathUI[playerid][1], -1);
    PlayerTextDrawBackgroundColour(playerid, DeathUI[playerid][1], 255);
    PlayerTextDrawBoxColour(playerid, DeathUI[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, DeathUI[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, DeathUI[playerid][1], 0);

    DeathUI[playerid][2] = CreatePlayerTextDraw(playerid, 296.000000, 211.000000, "5:00");
    PlayerTextDrawFont(playerid, DeathUI[playerid][2], 2);
    PlayerTextDrawLetterSize(playerid, DeathUI[playerid][2], 0.625000, 2.800000);
    PlayerTextDrawTextSize(playerid, DeathUI[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, DeathUI[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, DeathUI[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, DeathUI[playerid][2], 1);
    PlayerTextDrawColour(playerid, DeathUI[playerid][2], -1);
    PlayerTextDrawBackgroundColour(playerid, DeathUI[playerid][2], 255);
    PlayerTextDrawBoxColour(playerid, DeathUI[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, DeathUI[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, DeathUI[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, DeathUI[playerid][2], 0);
    return 1;
}

func:DestroyDeathUI(playerid)
{
    for(new i; i < 3 ; i++)
    {
        PlayerTextDrawHide(playerid, DeathUI[playerid][i]);
    }
    return 1;
}

func:ShowDeathUI(playerid)
{
    for(new i; i < 3 ; i++)
    {
        PlayerTextDrawShow(playerid, DeathUI[playerid][i]);
    }
}