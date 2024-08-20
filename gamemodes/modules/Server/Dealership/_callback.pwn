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
hook OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, #BuyingInDealer, 0);
    return 1;
}

hook OnPlayerUpdate(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        foreach(new i: Vehicle_Dealership)
        {
            if(vehicleid == i)
            {
                if(GetPVarInt(playerid, #BuyingInDealer) == 1) return 1;
                if(Character[playerid][char_Admin] == 0)
                {
                    SetPVarInt(playerid, #BuyingInDealer, 1);
                    SetPVarInt(playerid, #DealerVehID, i);
                    new _v_arr_id = FindDealerVehByID(i);
                    Dialog_Open(playerid, "OnPlayerBuyVehicle", DIALOG_STYLE_MSGBOX, "Mua xe", 
                    sprintf("Ban co dong y mua \nXe {ffc928}%s{FFFFFF}\nGia: {ffc928}%s{FFFFFF}", GetVehicleName(Dealership[_v_arr_id][d_model]),FormatMoney(Dealership[_v_arr_id][d_price])), ">>", "<<");
                }
            }
        }
    } 
    return 1;
}
