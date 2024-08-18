forward OnLoadOrganization(org_idzz);
public OnLoadOrganization(org_idzz)
{
    if (cache_num_rows() > 0)
    {
        OrgCount += 1;
        printf("Loaded Org %d", org_idzz);
        cache_get_value_name_int(0,  "id", OrgData[org_idzz][org_id]);
        cache_get_value_name(0, "name", OrgData[org_idzz][org_name]);
        cache_get_value_name_int(0,  "leader", OrgData[org_idzz][org_leader]);
        cache_get_value_name(0, "birth", OrgData[org_idzz][org_birth]);
        cache_get_value_name(0, "logo", OrgData[org_idzz][org_logo]);


        cache_get_value_name_int(0,  "safe", OrgData[org_idzz][org_safe]);
        cache_get_value_name_int(0,  "safe_dirty", OrgData[org_idzz][org_safedirty]);
        cache_get_value_name_int(0,  "type", OrgData[org_idzz][org_type]);
        for (new i; i < 10; i++)
        {
            new forg[128];
            format(forg, sizeof(forg), "rank%d", i + 1);
            cache_get_value_name(0, forg, OrgRank[org_idzz][i]);

        }
        for (new i; i < 10; i++)
        {
            new forg[128];
            format(forg, sizeof(forg), "skin%d", i + 1);
            cache_get_value_name_int(0, forg, OrgData[org_idzz][org_skin][i]);

        }

        new query[1280];
        format(query, sizeof(query), "SELECT * FROM `organization_safe_gun` WHERE `org_id` = '%d'", org_idzz);
        mysql_tquery(Handle(), query, "OnLoadOrganizationGun", "i", org_idzz);

        LoadOrgVehicle(org_idzz);
        return 1;
    }
    return 0;
}

forward OnLoadOrganizationGun(org_idzz);
public OnLoadOrganizationGun(org_idzz)
{
    for (new i; i < 100; i++)
    {
        OrgData[org_idzz][org_gun][i] = INVALID_NUMBER;
        OrgData[org_idzz][org_ammo][i] = 0;
    }
    if (cache_num_rows() > 0)
    {
        for (new i; i < cache_num_rows(); i++)
        {
            cache_get_value_name_int(0,  "weapon", OrgData[org_idzz][org_gun][i]);
            cache_get_value_name_int(0,  "ammo", OrgData[org_idzz][org_ammo][i]);
        }
    }
    return 1;
}


func:Org_Click(playerid, PlayerText:playertextid)
{
    if (GetPVarInt(playerid, #open_org_mng) == 1)
    {
        if (playertextid == OrgPTD[playerid][1])
        {
            OrgShowMemberList(playerid, Character[playerid][char_OrgID]);
        }
        if (playertextid == OrgPTD[playerid][2])
        {
            OrgShowWeaponList(playerid, Character[playerid][char_OrgID]);
        }
    }
    return 1;
}
