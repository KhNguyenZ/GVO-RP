stock CreatePlayerGuide(playerid, key_guid[], key_suggest[])
{

    new p_guide_index = CountGuide[playerid];
    if(p_guide_index > 9) return 0;
    new Float:bg_pos[2], Float:Key_pos[2], Float:Key_Sug[2];
    bg_pos[0] = 4;
    Key_pos[0] = 13.5;
    Key_Sug[0] = 24;

    // printf("p_guide_index: %d", p_guide_index);
    bg_pos[1] = 291-(p_guide_index*18);
    Key_pos[1] = 292-(p_guide_index*18);
    Key_Sug[1] = 295-(p_guide_index*18);

    Guide_BG_PTD[playerid][p_guide_index] = CreatePlayerTextDraw(playerid, bg_pos[0],bg_pos[1], "mdl-2012:guide_bg");
    PlayerTextDrawTextSize(playerid, Guide_BG_PTD[playerid][p_guide_index], 19.000, 15.000);
    PlayerTextDrawAlignment(playerid, Guide_BG_PTD[playerid][p_guide_index], 1);
    PlayerTextDrawColor(playerid, Guide_BG_PTD[playerid][p_guide_index], -1);
    PlayerTextDrawSetShadow(playerid, Guide_BG_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawSetOutline(playerid, Guide_BG_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawBackgroundColor(playerid, Guide_BG_PTD[playerid][p_guide_index], 255);
    PlayerTextDrawFont(playerid, Guide_BG_PTD[playerid][p_guide_index], 4);
    PlayerTextDrawSetProportional(playerid, Guide_BG_PTD[playerid][p_guide_index], 1);

    Guide_Key_PTD[playerid][p_guide_index] = CreatePlayerTextDraw(playerid, Key_pos[0], Key_pos[1], key_guid);
    PlayerTextDrawLetterSize(playerid, Guide_Key_PTD[playerid][p_guide_index], 0.210, 1.199);
    PlayerTextDrawTextSize(playerid, Guide_Key_PTD[playerid][p_guide_index], 0.000, 14.000);
    PlayerTextDrawAlignment(playerid, Guide_Key_PTD[playerid][p_guide_index], 2);
    PlayerTextDrawColor(playerid, Guide_Key_PTD[playerid][p_guide_index], 255);
    PlayerTextDrawSetShadow(playerid, Guide_Key_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawSetOutline(playerid, Guide_Key_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawBackgroundColor(playerid, Guide_Key_PTD[playerid][p_guide_index], 150);
    PlayerTextDrawFont(playerid, Guide_Key_PTD[playerid][p_guide_index], 1);
    PlayerTextDrawSetProportional(playerid, Guide_Key_PTD[playerid][p_guide_index], 1);

    Guide_Suggest_PTD[playerid][p_guide_index] = CreatePlayerTextDraw(playerid,Key_Sug[0], Key_Sug[1], key_suggest);
    PlayerTextDrawLetterSize(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 0.190, 0.899);
    PlayerTextDrawAlignment(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 1);
    PlayerTextDrawColor(playerid, Guide_Suggest_PTD[playerid][p_guide_index], -1);
    PlayerTextDrawSetShadow(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawSetOutline(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 0);
    PlayerTextDrawBackgroundColor(playerid, Guide_Suggest_PTD[playerid][p_guide_index], -1);
    PlayerTextDrawFont(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 1);
    PlayerTextDrawSetProportional(playerid, Guide_Suggest_PTD[playerid][p_guide_index], 1);

    PlayerTextDrawShow(playerid, Guide_BG_PTD[playerid][p_guide_index]);
    PlayerTextDrawShow(playerid, Guide_Key_PTD[playerid][p_guide_index]);
    PlayerTextDrawShow(playerid, Guide_Suggest_PTD[playerid][p_guide_index]);

    CountGuide[playerid]++;
    return 1;
}


hook OnPlayerSpawn(playerid)
{
    CreatePlayerGuide(playerid, "A", "Bat Voice");
    CreatePlayerGuide(playerid, "B", "Bat Setting");
    CreatePlayerGuide(playerid, "C", "Bat Inventory");
    CreatePlayerGuide(playerid, "D", "Bat Org Management");
    CreatePlayerGuide(playerid, "E", "Tuong tac voi ~g~Mystery");
    return 1;
}