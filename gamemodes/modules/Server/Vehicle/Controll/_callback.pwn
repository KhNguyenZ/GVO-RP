#define      IsOpenSmartKey(%0)        GetPVarInt(%0, #OpenSmartKey)

hook OnPlayerConnect(playerid)
{
    CreatePlayerControll(playerid);
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    /*new vehicleid = GetNeraestVehicle(playerid, 10.0);
    if(vehicleid != 0)
    {
    if(newkeys == KEY_NO)
    {
        SmartKey(playerid, vehicleid);
    }
    }*/
    return 1;
}
CMD:smartkey(playerid)
{
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    SmartKey(playerid, vehicleid);    
}