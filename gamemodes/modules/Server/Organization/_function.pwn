#include <YSI_Coding\y_hooks>

func:SaveOrg(_org_id)
{
    new query[3000] 
            = "UPDATE `organization` SET";
    mysql_format(Handle(), query, sizeof(query), "%s `name` = '%d',", query, OrgData[_org_id][org_name]);
    mysql_format(Handle(), query, sizeof(query), "%s `leader` = '%d',", query, OrgData[_org_id][org_leader]);
    mysql_format(Handle(), query, sizeof(query), "%s `birth` = '%s',", query, OrgData[_org_id][org_birth]);
    mysql_format(Handle(), query, sizeof(query), "%s `logo` = '%s',", query, OrgData[_org_id][org_birth]);

    mysql_format(Handle(), query, sizeof(query), "%s `type` = '%d',", query, OrgData[_org_id][org_type]);
    mysql_format(Handle(), query, sizeof(query), "%s `safe` = '%d',", query, OrgData[_org_id][org_safe]);

    for(new i = 1; i < 11; i++)
    {
        new skin_save[128];
        format(skin_save, 128, "skin%d", i);
        mysql_format(Handle(), query, sizeof(query), "%s `%s` = '%d',", query,skin_save, OrgData[_org_id][org_skin][i-1]);

        format(skin_save, 128, "rank%d", i);
        mysql_format(Handle(), query, sizeof(query), "%s `%s` = '%s',", query,skin_save, OrgRank[_org_id][i-1]);
    }
    mysql_format(Handle(), query, sizeof(query), "%s `safe_dirty` = '%d'", query, OrgData[_org_id][org_safedirty]);
    mysql_format(Handle(), query, sizeof(query), "%s WHERE `id` = '%d'", query, _org_id);
    return 1;
}
func:LoadOrgs()
{
    for(new i; i < MAX_ORG; i++)
    {
        OrgData[i][org_id] = INVAILID_NUMBER;
        LoadOrg(i);
    }
    InitOrgVehMap();
}
func:LoadOrg(org_idzzz)
{
    new query[1280];
    format(query, sizeof(query), "SELECT * FROM `organization` WHERE `id` = '%d'", org_idzzz);
    return mysql_tquery(Handle(), query, "OnLoadOrganization", "i", org_idzzz);
}
func:OrgGetTotalMember(orgid)
{
    new query[1280], total_member, total_member_str[123];
    format(query, sizeof(query), "SELECT * FROM `players` WHERE `OrgID` = '%d'", orgid);
    new Cache:OrgGetTotal;
    OrgGetTotal = mysql_query(Handle(), query);

    total_member = cache_num_rows();
    cache_delete(OrgGetTotal);
    return valstr(total_member_str, total_member);
}

func:SendOrgMessage(orgid, msg[])
{
    foreach (new i: Player)
    {
        if (Character[i][char_OrgID] == orgid)
        {
            new msg_org[1280];
            format(msg_org, 1280, "[Organization]: %s", msg);
            SendClientMessage(i, COLOR_CYAN, msg_org);
        }
    }
    return 1;
}
func:GetFreeVarML()
{
    for (new i; i < MAX_ORG; i++)
    {
        if (MakeLeader_V[i] == -1) return i;
    }
    return -1;
}

func:OrgGetType(org_typez)
{
    new _org[256];
    switch (org_typez)
    {
        case 0: _org = "Government";
        case 1: _org = "Non-Government";
        case 2: _org = "LAW Organization";
        case 3: _org = "Non-LAW";
        case 4: _org = "Criminal";
        case 5: _org = "Non-Criminal";
            default:_org = "Non-Type";
    }
    return _org;
}

func:OrgShowMemberList(playerid, org_idz)
{
    new dialog_member_list[1280];
    strcat(dialog_member_list, "Ten\tChuc vu\n");

    foreach (new i:Player)
    {
        if (Character[i][char_OrgID] == org_idz)
        {
            new dl_memlist[1280];
            format(dl_memlist, sizeof(dl_memlist), "%s\t%s\n", player_get_name(i), OrgRank[org_idz][Character[i][char_OrgRank] - 1]);
            strcat(dialog_member_list, dl_memlist);
        }
    }
    strcat(dialog_member_list, "End");
    ShowPlayerDialog(playerid, 1000, DIALOG_STYLE_TABLIST_HEADERS, "List of organization members online", dialog_member_list, ">>", "<<");
    return 1;
}
func:FuncMakeleader(playerid, orgidss)
{
    Character[playerid][char_OrgID] = orgidss;
    Character[playerid][char_OrgRank] = 1;
    OrgData[orgidss][org_leader] = GetPlayerSQLID(playerid);
}
func:OrgShowWeaponList(playerid, org_idz)
{

    new dialog_weapon_list[1280];
    strcat(dialog_weapon_list, "Weapon\tChuc vu\n");

    for (new i; i < MAX_WEAPON_ORG; i++)
    {
        if (OrgData[org_idz][org_gun][i] != -1)
        {
            new dl_memlist[1280];
            new dl_wplist[1280], weapon_name[128];
            GetWeaponName(OrgData[org_idz][org_gun][i], weapon_name, 128);
            format(dl_memlist, sizeof(dl_memlist), "%s\t%s\n", weapon_name, OrgData[org_idz][org_ammo][i]);
            strcat(dialog_weapon_list, dl_wplist);
        }
    }
    strcat(dialog_weapon_list, "End");
    ShowPlayerDialog(playerid, 1000, DIALOG_STYLE_TABLIST_HEADERS, "List of organization weapon", dialog_weapon_list, ">>", "<<");
    return 1;
}


#define SETTING_ORG_MAIN  140
#define SETTING_ORG_RANK  141
#define SETTING_ORG_NAME  142
#define SETTING_ORG_LEADER 143
#define SETTING_ORG_RANK_INPUT  144
#define SETTING_ORG_SKIN 145
#define SETTING_ORG_SKIN_INPUT 146
func:SettingOrg(playerid, org_idz)
{
    printf("ID:%d\nName: %s\nLeader: %d\nBirth: %s\nLogo: %s",
           OrgData[org_idz][org_id],
           OrgData[org_idz][org_name],
           OrgData[org_idz][org_leader],
           OrgData[org_idz][org_birth],
           OrgData[org_idz][org_logo]
          );
    if (OrgData[org_idz][org_id] == -1) return SendErrorMessage(playerid, "Org nay chua duoc tai hoac khong ton tai !");

    ShowPlayerDialog(playerid, SETTING_ORG_MAIN, DIALOG_STYLE_LIST, "Cai dat org",
                     "Ten\n\
    Leader\n\
    Logo\n\
    Chuc vu\n\
    Skin", ">>", "<<");
    SetPVarInt(playerid, #SettingOrgID, org_idz);
    return 1;
}
func:RankSettingOrg(playerid, org_idz)
{
    if (OrgData[org_idz][org_id] == -1) return SendErrorMessage(playerid, "Org nay chua duoc tai hoac khong ton tai !");
    new dlg_msg[1280];
    for (new i = 0; i < 9; i++)
    {
        new dlg_msg_z[128];
        format(dlg_msg_z, 128, "Chuc vu %d - %s\n", i+1, OrgRank[org_idz][i]);
        strcat(dlg_msg, dlg_msg_z);
    }
    format(dlg_msg, 1280, "%sChuc vu 10 - %s", dlg_msg, OrgRank[org_idz][9]);
    ShowPlayerDialog(playerid, SETTING_ORG_RANK, DIALOG_STYLE_LIST, "Cai dat chuc vu", dlg_msg, ">>", "<<");
    return 1;
}
func:SkinSettingOrg(playerid, org_idz)
{
    if (OrgData[org_idz][org_id] == -1) return SendErrorMessage(playerid, "Org nay chua duoc tai hoac khong ton tai !");
    new dlg_msg[1280];
    for (new i; i < 9; i++)
    {
        new dlg_msg_z[128];
        format(dlg_msg_z, 128, "Skin %d - %d\n", i+1, OrgData[org_idz][org_skin][i]);
        strcat(dlg_msg, dlg_msg_z);
    }
    format(dlg_msg, 1280, "%s Skin 10 - %s", dlg_msg, OrgData[org_idz][org_skin][9]);
    ShowPlayerDialog(playerid, SETTING_ORG_SKIN, DIALOG_STYLE_LIST, "Cai dat Skin", dlg_msg, ">>", "<<");
    return 1;
}
func:SettingOrgDialog(playerid, dialogid, response, listitem, inputtext[])
{
    if (response)
    {
        switch (dialogid)
        {
            case SETTING_ORG_MAIN:
            {
                if (listitem == 0)
                {
                    ShowPlayerDialog(playerid, SETTING_ORG_NAME, DIALOG_STYLE_INPUT, "Cai dat ten", "Vui long nhap ten", ">>", "<<");
                }
                if (listitem == 1)
                {
                    ShowPlayerDialog(playerid, SETTING_ORG_LEADER, DIALOG_STYLE_INPUT, "Cai dat leader", "Vui long nhap ID nguoi choi", ">>", "<<");
                }
                if (listitem == 2)
                {
                    HienTextdraw(playerid, "Chuc nang tam khoa !", 2000);
                }
                if (listitem == 3)
                {
                    RankSettingOrg(playerid, GetPVarInt(playerid, #SettingOrgID));
                }
                if(listitem == 4)
                {
                    SkinSettingOrg(playerid, GetPVarInt(playerid, #SettingOrgID));
                }
            }
            case SETTING_ORG_RANK:
            {
                SetPVarInt(playerid, #RankSettingID, listitem);
                ShowPlayerDialog(playerid, SETTING_ORG_RANK_INPUT, DIALOG_STYLE_INPUT, "Cai dat chuc vu", "Nhap ten cua chuc vu nay", ">>", "<<");
            }
            case SETTING_ORG_SKIN:
            {
                SetPVarInt(playerid, #SkinSettingID, listitem);
                ShowPlayerDialog(playerid, SETTING_ORG_SKIN_INPUT, DIALOG_STYLE_INPUT, "Cai dat skin", "Nhap id skin", ">>", "<<");
            }
            case SETTING_ORG_SKIN_INPUT:
            {
                if (isnull(inputtext)) return ShowPlayerDialog(playerid, SETTING_ORG_RANK_INPUT, DIALOG_STYLE_INPUT, "Cai dat skin", "Nhap ten cua chuc vu nay", ">>", "<<");
                if (!isnumeric(inputtext) && 1 < strval(inputtext) < 312) return ShowPlayerDialog(playerid, SETTING_ORG_RANK_INPUT, DIALOG_STYLE_INPUT, "Cai dat skin", "ID khong hop le", ">>", "<<");
                OrgData[GetPVarInt(playerid, #SettingOrgID)][org_skin][GetPVarInt(playerid, #SkinSettingID)] = strval(inputtext);
                HienTextdraw(playerid, "Cai dat skin thanh cong", 2000);
            }
            case SETTING_ORG_RANK_INPUT:
            {
                if (isnull(inputtext)) return ShowPlayerDialog(playerid, SETTING_ORG_RANK_INPUT, DIALOG_STYLE_INPUT, "Cai dat chuc vu", "Nhap ten cua chuc vu nay", ">>", "<<");
                format(OrgRank[GetPVarInt(playerid, #SettingOrgID)][GetPVarInt(playerid, #RankSettingID)], 255, "%s", inputtext);
                HienTextdraw(playerid, "Cai dat chuc vu thanh cong", 2000);
            }
            case SETTING_ORG_LEADER:
            {
                if (isnull(inputtext)) return ShowPlayerDialog(playerid, SETTING_ORG_LEADER, DIALOG_STYLE_INPUT, "Cai dat leader", "Vui long nhap ID nguoi choi", ">>", "<<");
                if (!isnumeric(inputtext)) return ShowPlayerDialog(playerid, SETTING_ORG_LEADER, DIALOG_STYLE_INPUT, "Cai dat leader", "ID khong hop le !", ">>", "<<");
                FuncMakeleader(strval(inputtext), GetPVarInt(playerid, #SettingOrgID));
                HienTextdraw(playerid, "Cai dat leader thanh cong", 2000);
            }
            case SETTING_ORG_NAME:
            {
                if (isnull(inputtext)) return ShowPlayerDialog(playerid, SETTING_ORG_NAME, DIALOG_STYLE_INPUT, "Cai dat ten", "Vui long nhap ten", ">>", "<<");
                if (strlen(inputtext) > 24) return ShowPlayerDialog(playerid, SETTING_ORG_NAME, DIALOG_STYLE_INPUT, "Cai dat ten", "Ten khong duoc dai hon 24 ki tu !", ">>", "<<");
                format(OrgData[GetPVarInt(playerid, #SettingOrgID)][org_name], 24, "%s", inputtext);
                HienTextdraw(playerid, "Cai dat ten thanh cong", 2000);
            }

        }
    }
    return 1;
}

