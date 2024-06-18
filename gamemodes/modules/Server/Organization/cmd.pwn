CMD:orgs(playerid, params[])
{
    new orgidzas;
    if (sscanf(params, "i", orgidzas)) return SendUsageMessage(playerid, "/orgs [ID Org]");

    SettingOrg(playerid, orgidzas);
    return 1;
}

#define DIALOG_MAKELEADER  150

CMD:makeleader(playerid, params[])
{
    if (!CheckAdmin(playerid, 5)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new targetid, ml_orgid;
    for (new i; i < MAX_ORG; i++)
    {
        if (OrgData[i][org_id] != -1 && !isnull(OrgData[i][org_name]))
        {
            new dlg_ml_z[128];
            format(dlg_ml_z, 128, "ID %d: %s", OrgData[i][org_id], OrgData[i][org_name]);
            SendClientMessage(playerid, -1, dlg_ml_z);
        }
    }
    if (sscanf(params, "ii", targetid, ml_orgid)) return SendUsageMessage(playerid, "/makeleader [id] [org]");
    FuncMakeleader(targetid, ml_orgid);

    new ml_msg[1280];
    format(ml_msg, 1280, "Ban da make leader cho %s", player_get_name(targetid));
    SendClientMessage(playerid, COLOR_CYAN, ml_msg);

    format(ml_msg, 1280, "QTV %s da make leader cho %s", player_get_name(playerid), player_get_name(targetid));
    SendClientMessage(targetid, COLOR_CYAN, ml_msg);
    SendOrgMessage(playerid, ml_orgid, ml_msg);
    return 1;
}


CMD:saveorgs(playerid)
{
    if (!CheckAdmin(playerid, 10)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    for (new i; i < MAX_ORG; i++) SaveOrg(i);
    return 1;
}

CMD:createorg(playerid, params[])
{
    new _name_org[1280], _org_type;
    if (sscanf(params, "s[64]i", _name_org, _org_type))
    {
        SendUsageMessage(playerid, "/createorg [Ten Organization] [Type]");
        SendUsageMessage(playerid, "Type 1: Government");
        SendUsageMessage(playerid, "Type 2: Non-Government");
        SendUsageMessage(playerid, "Type 3: LAW Organization");
        SendUsageMessage(playerid, "Type 4: Non-LAW");
        SendUsageMessage(playerid, "Type 5: Criminal");
        SendUsageMessage(playerid, "Type 6: Criminal");
    }
    if(_org_type > 6) return SendErrorMessage(playerid, "Type Org khong hop le");
    new day,month,year, _birth[12];
    getdate(year, month, day);
    format(_birth, 12, "%d-%d-%d", day, month, year);

    new query[1280];
    format(query, 1280, "INSERT INTO `organization` SET \
    `name` = '%s', \
    `leader` = '%d', \
    `birth` = '%s',\
    `type` = '%d'", 
    _name_org,
    GetPlayerSQLID(playerid),
    _birth,
    _org_type
    );
    mysql_tquery(Handle(),query, "OnCreateOrg", "");
    return 1;
}

forward OnCreateOrg();
public OnCreateOrg()
{
    new _org_id = cache_insert_id();

    if(LoadOrg(_org_id)){
        SendServerMessage(playerid, "Ban da tao thanh cong 1 Org");
    }
    else SendErrorMessage(playerid, "Tao Org that bai !");
    return 1;
}