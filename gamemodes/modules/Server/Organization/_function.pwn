#include <YSI_Coding\y_hooks>


func:LoadOrg(org_idzzz)
{
    new query[1280];
    format(query, sizeof(query), "SELECT * FROM `organization` WHERE `id` = '%d'",org_idzzz);
    return mysql_tquery(Handle(),query, "OnLoadOrganization", "i", org_idzzz);
}
func:OrgGetTotalMember(orgid)
{
    new query[1280], total_member, total_member_str[123];
    format(query, sizeof(query), "SELECT * FROM `players` WHERE `OrgID` = '%d'",orgid);
    new Cache:OrgGetTotal;
    OrgGetTotal = mysql_query(Handle(),query);

    total_member = cache_num_rows();
    cache_delete(OrgGetTotal);
    return valstr(total_member_str, total_member);
}

func:OrgGetType(org_type)
{
    new type[256];
    switch(org_type)
    {
        case 0: type = "Government";
        case 1: type = "Non-Government";
        case 2: type = "LAW Organization";
        case 3: type = "Non-LAW";
        case 4: type = "Criminal";
        case 5: type = "Non-Criminal";
        default:type = "Non-Type";
    }
    return type;
}

func:OrgShowMemberList(playerid, org_idz){
    new dialog_member_list[1280];
    strcat(dialog_member_list, "Ten\tChuc vu\n");

    foreach(new i:Player)
    {
        if(Character[i][char_OrgID] == org_idz)
        {
            new dl_memlist[1280];
            format(dl_memlist, sizeof(dl_memlist),"%s\t%s\n", player_get_name(i), OrgRank[org_idz][Character[i][char_OrgRank]-1]);
            strcat(dialog_member_list, dl_memlist);
        }
    }
    strcat(dialog_member_list, "End");
    ShowPlayerDialog(playerid,1000, DIALOG_STYLE_TABLIST_HEADERS,"List of organization members online",dialog_member_list, ">>", "<<");
    return 1;
}

func:OrgShowWeaponList(playerid, org_idz){

    new dialog_weapon_list[1280];
    strcat(dialog_weapon_list, "Weapon\tChuc vu\n");

    for(new i; i < MAX_WEAPON_ORG; i++)
    {
        if(OrgData[org_idz][org_gun][i] != -1)
        {
            new dl_memlist[1280];
            new dl_wplist[1280], weapon_name[128];
            GetWeaponName(OrgData[org_idz][org_gun][i], weapon_name, 128);
            format(dl_memlist, sizeof(dl_memlist),"%s\t%s\n", weapon_name,OrgData[org_idz][org_ammo][i]);
            strcat(dialog_weapon_list, dl_wplist);
        }
    }
    strcat(dialog_member_list, "End");
    ShowPlayerDialog(playerid,1000, DIALOG_STYLE_TABLIST_HEADERS,"List of organization weapon",dialog_weapon_list, ">>", "<<");
    return 1;
}
