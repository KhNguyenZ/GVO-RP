#include <YSI\YSI_Coding\y_hooks>
hook OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
    if(GetPVarInt(playerid, "placevehicle") == 1)
    {
        if (oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) // Player entered a vehicle as a driver
        {
            // if(IsPlayerValidFixer(playerid))
            // {
                new vehicleid = GetPlayerVehicleID(playerid);
                DisableVehicleObject(vehicleid);
                for(new i; i < MAX_VEHICLE_PART; i++) 
                {
                    Delete3DTextLabel(vtext[i]);
                    DeletePVar(playerid, "placevehicle");
                } 
            // }
            // else RemovePlayerFromVehicle(playerid);
        }
    }
    else if (GetPVarInt(playerid, "placevehicle") == 2)
    {
        if (oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER) // Player entered a vehicle as a driver
        {
            // if(IsPlayerValidFixer(playerid))
            // {
                new vehicleid = GetPlayerVehicleID(playerid);
                DisableVehicleObject(vehicleid);
                DeletePVar(playerid, "placevehicle");
                for(new i; i < MAX_VEHICLE_PART; i++) 
                {
                    Delete3DTextLabel(vtext[i]);
                } 
            // }
            // else RemovePlayerFromVehicle(playerid);
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

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_MECHANIC)
    {
        if (response)
        {
            // Give them the weapon
            switch (listitem)
            {
                case 0:
                {
                    ShowPlayerDialog(playerid, DIALOG_IRON, DIALOG_STYLE_INPUT, "Mechanic Items", "Nhap so luong:", "Deposit", "Withdraws");
                }
                case 1:
                {
                    ShowPlayerDialog(playerid, DIALOG_RUBBER, DIALOG_STYLE_INPUT, "Mechanic Items", "Nhap so luong:", "Deposit", "Withdraws");
                }
                case 2:
                {
                    ShowPlayerDialog(playerid, DIALOG_PLASTIC, DIALOG_STYLE_INPUT, "Mechanic Items", "Nhap so luong:", "Deposit", "Withdraws");
                }
            }
        }
    }
    if (dialogid == DIALOG_IRON)
    {
        if (response)
        {
            
            if(IsNumeric(inputtext))
            {
                PlusMechanicItems(playerid, strval(inputtext), 1);
            }
        }
        else
        {
            
            if(IsNumeric(inputtext))
            {
                MinusMechanicItems(playerid, strval(inputtext), 1);
            }
        }
    }
    if (dialogid == DIALOG_RUBBER)
    {
        if (response)
        {
            
            if(IsNumeric(inputtext))
            {
                PlusMechanicItems(playerid, strval(inputtext), 2);
            }
        }
        else
        {
            
            if(IsNumeric(inputtext))
            {
                MinusMechanicItems(playerid, strval(inputtext), 2);
            }
        }
    }
    if (dialogid == DIALOG_PLASTIC)
    {
        if (response)
        {
            
            if(IsNumeric(inputtext))
            {
                PlusMechanicItems(playerid, strval(inputtext), 3);
            }
        }
        else
        {
            
            if(IsNumeric(inputtext))
            {
                MinusMechanicItems(playerid, strval(inputtext), 3);
            }
        }
    }
    return 1;
}
