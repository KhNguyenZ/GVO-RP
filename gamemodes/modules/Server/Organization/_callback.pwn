forward OnLoadOrganization(org_idzz);
public OnLoadOrganization(org_idzz)
{
    if(cache_num_rows() > 0)
	{
        OrgCount ++;

		cache_get_value_name_int(0,  "id", OrgData[org_idzz][org_idzz]);
        cache_get_value_name(0, "name", OrgData[org_idzz][org_name]);
		cache_get_value_name_int(0,  "leader", OrgData[org_idzz][org_leader]);
        cache_get_value_name(0, "birth", OrgData[org_idzz][org_birth]);
        cache_get_value_name(0, "logo", OrgData[org_idzz][org_logo]);

        cache_get_value_name_int(0,  "safe", OrgData[org_idzz][org_safe]);
        cache_get_value_name_int(0,  "safedirty", OrgData[org_idzz][org_safedirty]);
        cache_get_value_name_int(0,  "type", OrgData[org_idzz][org_type]);

        for(new i; i < 10; i++)
        {
            new forg[128];
            format(forg, sizeof(forg), "rank%d", i+1);
            cache_get_value_name(0, forg, OrgRank[org_idzz][i]);

        }

        new query[1280];
        format(query, sizeof(query), "SELECT * FROM `organization_safe_gun` WHERE `org_id` = '%d'",org_idzz);
        mysql_tquery(Handle(),query, "OnLoadOrganizationGun", "i", org_idzz);
	}
    // else printf("%d is no data", org_idzz);
    return 1;
}

forward OnLoadOrganizationGun(org_idzz);
public OnLoadOrganizationGun(org_idzz)
{
    if(cache_num_rows() > 0)
	{
        for(new i; i < cache_num_rows(); i++)
        {
            cache_get_value_name_int(0,  "weapon", OrgData[org_idzz][org_gun][i]);
            cache_get_value_name_int(0,  "ammo", OrgData[org_idzz][org_ammo][i]);
        }
    }
    return 1;
}


func:Org_Click(playerid, PlayerText:playertextid)
{
    if(playertextid == OrgPTD[playerid][1])
    {
        OrgShowMemberList(playerid, Character[playerid][char_OrgID]);
    }
    return 1;
}