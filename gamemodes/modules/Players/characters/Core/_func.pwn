forward SwitchCharacter(playerid, level, Float:cX, Float:cY, Float:cZ, Float:cA);
public SwitchCharacter(playerid, level, Float:cX, Float:cY, Float:cZ, Float:cA)
{
    switch (level)
    {
        case 1:
        {
            // if(GetPVarInt(playerid,"Teleportation") > gettime()) return SendClientMessage(playerid, -1, "The character switch isn't available at the moment.");
            SetPVarInt(playerid, "Teleportation", gettime() + 1000);

            TogglePlayerControllable(playerid, 0);
            InterpolateCameraPos(playerid, 1475.2776, -1714.8265, 45.0341, 1475.2776, -1714.8265, 45.0341 + 200, 3000);
            InterpolateCameraLookAt(playerid, 1475.2776, -1714.8265, 45.0341, 1475.2776, -1714.8265, 45.0341, 3000);

            InterpolateCameraPos(playerid, 1475.2776, -1714.8265, 45.0341, 1475.2776, -1714.8265, 45.0341 + 200, 20000);
            InterpolateCameraLookAt(playerid, 1481.8513, -1752.0916, 25.2723, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 5, 20000);
            SetTimerEx("SwitchCharacter", 3500, false, "ii", playerid, 2);
        }
        case 2:
        {
            InterpolateCameraPos(playerid, 1475.2776, -1714.8265, 45.0341 + 200, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 200, 3000);
            InterpolateCameraLookAt(playerid, 1475.2776, -1714.8265, 45.0341, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 5, 3000);
            SetTimerEx("SwitchCharacter", 3500, false, "ii", playerid, 3);
        }
        case 3:
        {
            InterpolateCameraPos(playerid, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 200, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 5, 3000);
            InterpolateCameraLookAt(playerid, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2], Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2] + 5, 3000);
            SetTimerEx("SwitchCharacter", 3500, false, "ii", playerid, 4);
        }
        case 4:
        {
            TogglePlayerControllable(playerid, true);
            SetCameraBehindPlayer(playerid);
            CancelSelectTextDraw(playerid);

            if (GetPVarInt(playerid, "SetupRegister_") == 0)
            {
                SetSpawnInfo(playerid, 0, Character[playerid][char_Skin], Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2], Character[playerid][char_last_Pos][3], 0, 0, 0, 0, 0, 0);
                FadeOutPlayerScreen(playerid);
                SetTimerEx("PlayerJoinGameReal", 1000, false, "i", playerid);
                HidePlayerSpawnMenu(playerid);
                PlayerSetupping[playerid] = 0;
                OnPlayerLoad(playerid);
            }
        }
    }
    return true;
}

func:CharacterSelect_Click(playerid, PlayerText:playertextid)
{
    for (new char_click = 3 ; char_click < 6; char_click++)
    {
        if (playertextid == SelectCharPTD[playerid][char_click])
        {
            if (IsLoadChar(playerid, char_click - 3))
            {
                SetPVarInt(playerid, "CharSelected_", char_click - 3);

                HideCharacterSelect(playerid);
                new Char_Selected = GetPVarInt(playerid, "CharSelected_");
                SetPlayerName(playerid, character_Name_data[playerid][Char_Selected]);
                new query[240];
                format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", player_get_name(playerid, false));
                mysql_tquery(Handle(), query, "OnCharacterLoad", "i", playerid);
                SetPVarInt(playerid, "CharSelected_", 1);

                SetSpawnInfo(playerid, 0, Character[playerid][char_Skin], Character[playerid][char_last_Pos][0],Character[playerid][char_last_Pos][1],Character[playerid][char_last_Pos][2],Character[playerid][char_last_Pos][3],0,0,0,0,0,0);
	            SpawnPlayer(playerid);
                
                CreateActorSelect(playerid);
            }
            else
            {
                HideCharacterSelect(playerid);
                SetPVarInt(playerid, "CharSelect_", char_click - 3);
                ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.", "Nhap ten nhan vat ban muon tao.", "Tao", "Tro lai");
            }

            printf("CharSelect: %d", GetPVarInt(playerid, "CharSelect_"));
        }
    }
    return 1;
}