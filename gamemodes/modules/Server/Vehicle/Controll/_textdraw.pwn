new PlayerText: VehControllPTD[MAX_PLAYERS][6];
func:CreatePlayerControll(playerid){

    VehControllPTD[playerid][0] = CreatePlayerTextDraw(playerid, 189.000, 211.000, "mdl-2017:car");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][0], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][0], 1);

    VehControllPTD[playerid][1] = CreatePlayerTextDraw(playerid, 189.000, 232.000, "mdl-2017:trunk");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][1], 74.000, 15.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][1], 1);

    VehControllPTD[playerid][2] = CreatePlayerTextDraw(playerid, 267.000, 165.000, "mdl-2017:lock");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][2], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][2], 1);

    VehControllPTD[playerid][3] = CreatePlayerTextDraw(playerid, 267.000, 189.000, "mdl-2017:open");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][3], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][3], 1);

    VehControllPTD[playerid][4] = CreatePlayerTextDraw(playerid, 267.000, 255.000, "mdl-2017:seatbelt");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][4], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][4], 1);

    VehControllPTD[playerid][5] = CreatePlayerTextDraw(playerid, 267.000, 281.000, "mdl-2017:engine-off");
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][5], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][5], 1);


    for(new i; i < 6; i++)
    {
        PlayerTextDrawShow(playerid, VehControllPTD[playerid][i]);
    }
    SelectTextDraw(playerid, 0xffffffff);
    return 1;
}

