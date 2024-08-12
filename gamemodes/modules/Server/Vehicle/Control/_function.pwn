func:SmartKey(playerid, vehicleid)
{
    if(vehicleid)
    {
        // OpenSmartKey(playerid);
        SetPVarInt(playerid, #Open_Smart_Key, 1);
    }
    return 1;
}
func:CloseSmart(playerid)
{
    SetPVarInt(playerid, #Open_Smart_Key, 0);
    CloseSmartKey(playerid);
    return 1;
}