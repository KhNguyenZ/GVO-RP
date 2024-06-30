CMD:createorgveh(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");

    new _corg_id, _cmodelid, _ccolor1, _ccolor2, _csiren;
    if(sscanf(params, "iiiii",_corg_id, _cmodelid, _ccolor1, _ccolor2,_csiren)) return SendUsageMessage(playerid, "/createorgveh [Org ID] [Model ID] [Color 1] [Color 2] [Siren]");

    if(CreateOrgVehicle(playerid,_corg_id, _cmodelid, 0, 0 , _ccolor1, _ccolor2,_csiren)) return SendServerMessage(playerid, "Tao thanh cong xe cho Organization");
    return 1;
}