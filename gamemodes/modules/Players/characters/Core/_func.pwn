
func:CharacterSelect_Click(playerid, PlayerText:playertextid)
{
    for (new char_click = 3 ; char_click < 6; char_click++)
    {
        if (playertextid == SelectCharPTD[playerid][char_click])
        {
            if (IsLoadChar(playerid, char_click - 3))
            {
                // Character[playerid][char_Login] = true;
                printf("Da Login");
                SetPVarInt(playerid, "CharSelected_", char_click - 3);

                HideCharacterSelect(playerid);
                new Char_Selected = GetPVarInt(playerid, "CharSelected_");
                SetPlayerName(playerid, character_Name_data[playerid][Char_Selected]);
                new query[240];
                format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", player_get_name(playerid, false));
                mysql_tquery(Handle(), query, "OnCharacterLoad", "i", playerid);
                SetPVarInt(playerid, "CharSelected_", 1);
                

                SetSpawnInfo(playerid, 0, Character[playerid][char_Skin], Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2], Character[playerid][char_last_Pos][3], 0, 0, 0, 0, 0, 0);
                FadeOutPlayerScreen(playerid);
                SetTimerEx("PlayerJoinGameReal", 1000, false, "i", playerid);
                HidePlayerSpawnMenu(playerid);
                PlayerSetupping[playerid] = 0;
                OnPlayerLoad(playerid);
                SpawnPlayer(playerid);
            }
            else
            {
                HideCharacterSelect(playerid);
                SetPVarInt(playerid, "CharSelect_", char_click - 3);
                ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.", "Nhap ten nhan vat ban muon tao.", "Tao", "Tro lai");
            }
        }
    }
    return 1;
}