#include <YSI\YSI_Coding\y_hooks>
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(GetPVarInt(playerid, #PutNewVehicles))
    {
        if(newkeys == KEY_NO)
        {
            DealerPutNewVehicle(playerid,GetPVarInt(playerid, #DealerNewVehPrice));
            DeletePVar(playerid, #PutNewVehicles);
            DeletePVar(playerid, #DealerNewVehPrice);
        }
    }
    return 1;
}