
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
                new query[500];
                format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", player_get_name(playerid, false));
                mysql_tquery(Handle(), query, "OnCharacterLoad", "i", playerid);
                SetPVarInt(playerid, "CharSelected_", 1);
                PlayerSetupping[playerid] = 0;
                OnPlayerLoad(playerid);
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