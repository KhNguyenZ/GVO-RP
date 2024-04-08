func:CreateHienTextDraw(playerid)
{
    scm_PTD[playerid] = CreatePlayerTextDraw(playerid, 321.0000, 357.4996, "");
    PlayerTextDrawLetterSize(playerid, scm_PTD[playerid], 0.2128, 1.1390);
    PlayerTextDrawTextSize(playerid, scm_PTD[playerid], 0.0000, 388.0000);
    PlayerTextDrawAlignment(playerid, scm_PTD[playerid], 2);
    PlayerTextDrawColor(playerid, scm_PTD[playerid], -1);
    PlayerTextDrawSetOutline(playerid, scm_PTD[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, scm_PTD[playerid], 255);
    PlayerTextDrawFont(playerid, scm_PTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, scm_PTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, scm_PTD[playerid], 0);
}
func:CreateFadeEffectTextDraw(playerid)
{
	FadeEffect[playerid][0] = CreatePlayerTextDraw(playerid, -75.000, -66.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, FadeEffect[playerid][0], 765.000, 590.000);
	PlayerTextDrawAlignment(playerid, FadeEffect[playerid][0], 0);
	PlayerTextDrawColor(playerid, FadeEffect[playerid][0], 187);
	PlayerTextDrawSetShadow(playerid, FadeEffect[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, FadeEffect[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, FadeEffect[playerid][0], 255);
	PlayerTextDrawFont(playerid, FadeEffect[playerid][0], TEXT_DRAW_FONT_SPRITE_DRAW);
	PlayerTextDrawSetProportional(playerid, FadeEffect[playerid][0], true);
}
func:CreateInfo()
{

    InfoTD[0] = TextDrawCreate(498.000, 6.000, "mdl-2013:user");
    TextDrawTextSize(InfoTD[0], 7.000, 7.000);
    TextDrawAlignment(InfoTD[0], 1);
    TextDrawColor(InfoTD[0], 255);
    TextDrawSetShadow(InfoTD[0], 0);
    TextDrawSetOutline(InfoTD[0], 0);
    TextDrawBackgroundColor(InfoTD[0], 255);
    TextDrawFont(InfoTD[0], 4);
    TextDrawSetProportional(InfoTD[0], 1);

    InfoTD[1] = TextDrawCreate(506.000, 6.000, "");
    TextDrawLetterSize(InfoTD[1], 0.239, 0.699);
    TextDrawAlignment(InfoTD[1], 1);
    TextDrawColor(InfoTD[1], 255);
    TextDrawSetShadow(InfoTD[1], 0);
    TextDrawSetOutline(InfoTD[1], 0);
    TextDrawBackgroundColor(InfoTD[1], 0);
    TextDrawFont(InfoTD[1], 1);
    TextDrawSetProportional(InfoTD[1], 1);

    InfoTD[2] = TextDrawCreate(538.000, 5.000, "mdl-2013:svg_14027066");
    TextDrawTextSize(InfoTD[2], 9.000, 9.000);
    TextDrawAlignment(InfoTD[2], 1);
    TextDrawColor(InfoTD[2], -1);
    TextDrawSetShadow(InfoTD[2], 0);
    TextDrawSetOutline(InfoTD[2], 0);
    TextDrawBackgroundColor(InfoTD[2], 255);
    TextDrawFont(InfoTD[2], 4);
    TextDrawSetProportional(InfoTD[2], 1);
}

func:CreatePlayerInfo(playerid)
{
    InfoPTD[playerid][0] = CreatePlayerTextDraw(playerid, 453.000, 6.000, "ID: 1000");
    PlayerTextDrawLetterSize(playerid, InfoPTD[playerid][0], 0.239, 0.699);
    PlayerTextDrawAlignment(playerid, InfoPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, InfoPTD[playerid][0], 255);
    PlayerTextDrawSetShadow(playerid, InfoPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, InfoPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, InfoPTD[playerid][0], 0);
    PlayerTextDrawFont(playerid, InfoPTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, InfoPTD[playerid][0], 1);

    InfoPTD[playerid][1] = CreatePlayerTextDraw(playerid, 550.000, 6.000, "1,000,000,000,000,000");
    PlayerTextDrawLetterSize(playerid, InfoPTD[playerid][1], 0.239, 0.699);
    PlayerTextDrawAlignment(playerid, InfoPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, InfoPTD[playerid][1], 255);
    PlayerTextDrawSetShadow(playerid, InfoPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, InfoPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, InfoPTD[playerid][1], -1);
    PlayerTextDrawFont(playerid, InfoPTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, InfoPTD[playerid][1], 1);
    return 1;
}

