stock CreatePlayerGuide(playerid, key_guid[], key_suggest[])
{

    new p_guide_index = CountGuide[playerid];

    GuideTXD_Info[p_guide_index][g_id] = p_guide_index;

    GuideTXD_Info[p_guide_index][g_key] = MapCharToValue(key_guid);
    format(GuideTXD_Info[p_guide_index][g_content], 1280, "%s", key_suggest);

    if (p_guide_index > 9) return 0;
    new Float:bg_pos[2], Float:Key_pos[2], Float:Key_Sug[2];
    bg_pos[0] = 4;
    Key_pos[0] = 13.5;
    Key_Sug[0] = 24;

    // printf("p_guide_index: %d", p_guide_index);
    bg_pos[1] = 291 - (p_guide_index * 18);
    Key_pos[1] = 292 - (p_guide_index * 18);
    Key_Sug[1] = 295 - (p_guide_index * 18);

    Guide_BG_PTD[playerid][p_guide_index] = CreatePlayerTextDraw(playerid, bg_pos[0], bg_pos[1], "mdl-2012:guide_bg");
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

    Guide_Suggest_PTD[playerid][p_guide_index] = CreatePlayerTextDraw(playerid, Key_Sug[0], Key_Sug[1], key_suggest);
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

func:MapCharToValue(character[])
{
    new value, n_character;
    n_character = tolower(character[0]);
    switch (n_character)
    {
        case 'a': value = 1;

        case 'b': value = 2;

        case 'c': value = 3;

        case 'd': value = 4;

        case 'e': value = 5;

        case 'f': value = 6;

        case 'g': value = 7;

        case 'h': value = 8;

        case 'i': value = 9;

        case 'j': value = 10;

        case 'k': value = 11;

        case 'l': value = 12;

        case 'm': value = 13;

        case 'n': value = 14;

        case 'o': value = 15;

        case 'p': value = 16;

        case 'q': value = 17;

        case 'r': value = 18;

        case 's': value = 19;

        case 't': value = 20;

        case 'u': value = 21;

        case 'v': value = 22;

        case 'w': value = 23;

        case 'x': value = 24;

        case 'y': value = 25;

        case 'z': value = 26;

        default:
            value = 0; // Default value if character is not a letter

    }

    return value;
}

func:FindKeyGuide(key_find[])
{
    new key_finder = -1;
    for (new i ; i < 10; i++)
    {
        if (GuideTXD_Info[i][g_key] == MapCharToValue(key_find))
        {
            key_finder = i;
            break;
        }
    }
    return key_finder;
}

func:ChangeGuideContent(playerid, key_f[], g_content_c[])
{
    new g_idss = FindKeyGuide(key_f);
    if (g_idss == -1) return CreatePlayerGuide(playerid, key_f, g_content_c);

    format(GuideTXD_Info[g_idss][g_content], 1280, "%s", g_content_c);

    PlayerTextDrawSetString(playerid, Guide_Suggest_PTD[playerid][g_idss], g_content_c);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if (IsPlayerSpawned(playerid))
    {
        for (new i; i < 10; i++)
        {
            PlayerTextDrawDestroy(playerid, Guide_BG_PTD[playerid][i]);
            PlayerTextDrawDestroy(playerid, Guide_Suggest_PTD[playerid][i]);
            PlayerTextDrawDestroy(playerid, Guide_Key_PTD[playerid][i]);
        }
    }
    return 1;
}
