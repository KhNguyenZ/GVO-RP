func:OnPlayerLoadPortersJobTD(playerid){
    PortersTD[playerid][0] = CreatePlayerTextDraw(playerid, 253.000000, 105.000000, "mdl-2026:trunk");
    PlayerTextDrawFont(playerid, PortersTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, PortersTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PortersTD[playerid][0], 135.500000, 220.000000);
    PlayerTextDrawSetOutline(playerid, PortersTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PortersTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PortersTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, PortersTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, PortersTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PortersTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, PortersTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PortersTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PortersTD[playerid][0], 0);

    PortersTD[playerid][1] = CreatePlayerTextDraw(playerid, 257.000000, 111.000000, "mdl-2026:box");
    PlayerTextDrawFont(playerid, PortersTD[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, PortersTD[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PortersTD[playerid][1], 128.500000, 151.000000);
    PlayerTextDrawSetOutline(playerid, PortersTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PortersTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PortersTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, PortersTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PortersTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PortersTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, PortersTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PortersTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PortersTD[playerid][1], 1);
}
