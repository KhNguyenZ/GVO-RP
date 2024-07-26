#include <YSI\YSI_Coding\y_hooks>
hook OnPlayerConnect(playerid)
{
    // new PlayerText: SelectCharPTD[MAX_PLAYERS][12];

    SelectCharPTD[playerid][0] = CreatePlayerTextDraw(playerid, 56.000, 99.000, "mdl-2001:char");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][0], 163.000, 258.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][0], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][0], 1);

    SelectCharPTD[playerid][1] = CreatePlayerTextDraw(playerid, 232.000, 99.000, "mdl-2001:char");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][1], 163.000, 258.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][1], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][1], 1);

    SelectCharPTD[playerid][2] = CreatePlayerTextDraw(playerid, 409.000, 99.000, "mdl-2001:char");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][2], 163.000, 258.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][2], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][2], 1);

    SelectCharPTD[playerid][3] = CreatePlayerTextDraw(playerid, 101.000, 315.000, "mdl-2001:choose");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][3], 63.000, 25.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][3], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][3], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, SelectCharPTD[playerid][3], 1);

    SelectCharPTD[playerid][4] = CreatePlayerTextDraw(playerid, 280.000, 315.000, "mdl-2001:choose");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][4], 63.000, 25.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][4], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][4], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, SelectCharPTD[playerid][4], 1);

    SelectCharPTD[playerid][5] = CreatePlayerTextDraw(playerid, 461.000, 315.000, "mdl-2001:choose");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][5], 63.000, 25.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][5], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, SelectCharPTD[playerid][5], 1);

    SelectCharPTD[playerid][6] = CreatePlayerTextDraw(playerid, 133.000, 108.000, "Name:Char_One");
    PlayerTextDrawLetterSize(playerid, SelectCharPTD[playerid][6], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][6], 2);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][6], 1);

    SelectCharPTD[playerid][7] = CreatePlayerTextDraw(playerid, 313.000, 108.000, "Name:Char_Two");
    PlayerTextDrawLetterSize(playerid, SelectCharPTD[playerid][7], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][7], 2);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][7], 150);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][7], 1);

    SelectCharPTD[playerid][8] = CreatePlayerTextDraw(playerid, 493.000, 108.000, "Name:Char_Three");
    PlayerTextDrawLetterSize(playerid, SelectCharPTD[playerid][8], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][8], 2);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][8], 150);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][8], 1);

    SelectCharPTD[playerid][9] = CreatePlayerTextDraw(playerid, 60.000, 128.000, "_");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][9], 154.000, 176.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][9], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][9], 85);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][9], 5);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][9], 0);
    PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][9], 0);
    PlayerTextDrawSetPreviewRot(playerid, SelectCharPTD[playerid][9], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehicleColours(playerid, SelectCharPTD[playerid][9], 0, 0);

    SelectCharPTD[playerid][10] = CreatePlayerTextDraw(playerid, 236.000, 128.000, "_");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][10], 154.000, 176.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][10], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][10], 85);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][10], 5);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][10], 0);
    PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][10], 1);
    PlayerTextDrawSetPreviewRot(playerid, SelectCharPTD[playerid][10], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehicleColours(playerid, SelectCharPTD[playerid][10], 0, 0);

    SelectCharPTD[playerid][11] = CreatePlayerTextDraw(playerid, 413.000, 128.000, "_");
    PlayerTextDrawTextSize(playerid, SelectCharPTD[playerid][11], 154.000, 176.000);
    PlayerTextDrawAlignment(playerid, SelectCharPTD[playerid][11], 1);
    PlayerTextDrawColour(playerid, SelectCharPTD[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, SelectCharPTD[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, SelectCharPTD[playerid][11], 0);
    PlayerTextDrawBackgroundColour(playerid, SelectCharPTD[playerid][11], 85);
    PlayerTextDrawFont(playerid, SelectCharPTD[playerid][11], 5);
    PlayerTextDrawSetProportional(playerid, SelectCharPTD[playerid][11], 0);
    PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][11], 2);
    PlayerTextDrawSetPreviewRot(playerid, SelectCharPTD[playerid][11], 0.000, 0.000, 0.000, 1.000);
    PlayerTextDrawSetPreviewVehicleColours(playerid, SelectCharPTD[playerid][11], 0, 0);


    return 1;
}

func:IsLoadChar(playerid, slot)
{
    new char_load[1280];
    format(char_load, sizeof(char_load), "Loaded_Char_%d", slot);
    return GetPVarInt(playerid, char_load);
}
func:IsOpenCharSelect(playerid)
{
    return GetPVarInt(playerid, "Open_Char_Select_");
}
func:ShowCharacterSelect(playerid)
{
    if (player_Login(playerid)) return 1;
    SetPVarInt(playerid, "Open_Char_Select_", 1);
    for (new i = 0; i < 3; i++)
    {
        PlayerTextDrawSetString(playerid, SelectCharPTD[playerid][i + 6], character_Name_data[playerid][i]);
    }
    SelectTextDraw(playerid, 0x0d142bAA);
    if (IsLoadChar(playerid, 0))
    {
        PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][9], CharSelectInfo[playerid][cs_skin][0]);
    }
    else PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][9], 299);

    if (IsLoadChar(playerid, 1))
    {
        PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][10], CharSelectInfo[playerid][cs_skin][1]);
    }
    else PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][10], 299);

    if (IsLoadChar(playerid, 2))
    {
        PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][11], CharSelectInfo[playerid][cs_skin][2]);
    }
    else PlayerTextDrawSetPreviewModel(playerid, SelectCharPTD[playerid][11], 299);

    for (new char_show = 0 ; char_show < 12; char_show++)
    {
        PlayerTextDrawShow(playerid, SelectCharPTD[playerid][char_show]);
    }
    return 1;
}
func:HideCharacterSelect(playerid)
{
    SetPVarInt(playerid, "Open_Char_Select_", 0);
    CancelSelectTextDraw(playerid);

    for (new char_show = 0 ; char_show < 12; char_show++)
    {
        PlayerTextDrawHide(playerid, SelectCharPTD[playerid][char_show]);
    }
    return 1;
}
