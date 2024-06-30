#define      IsOpenSmartKey(%0)        GetPVarInt(%0, #Open_Smart_Key)
hook OnPlayerConnect(playerid)
{
    CreatePlayerControll(playerid);
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_NO)
    {
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        SmartKey(playerid, vehicleid);
    }
    return 1;
}