hook OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
    if(GetPVarInt(playerid, "placevehicle") == 1)
    {
        if (oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) // Player entered a vehicle as a driver
        {
            DisableVehicleObject(playerid);
            for(new i; i < MAX_VEHICLE_PART; i++) 
            {
                Delete3DTextLabel(vtext[i]);
                DeletePVar(playerid, "placevehicle");
            } 
        }
    }
    
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (PRESSED(KEY_YES))
    {
        return cmd_fixvehicle(playerid);
    }
    return 1;
}