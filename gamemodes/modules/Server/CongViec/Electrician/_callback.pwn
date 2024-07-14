hook OnPlayerConnect(playerid){
    OnPlayerLoadEclectricianTextdraw(playerid);
    return 1;
}
hook OnPlayerUpdate(playerid)
{
    new playernumber1 = GetPVarInt(playerid, "PlayerNumber1"),
        playernumber2 = GetPVarInt(playerid, "PlayerNumber2"),
        playernumber3 = GetPVarInt(playerid, "PlayerNumber3"),
        playernumber4 = GetPVarInt(playerid, "PlayerNumber4");
    if(playernumber1 != 0 || playernumber2 != 0 || playernumber3 != 0 || playernumber4 != 0)
    {
        new string[128], number[4][128];
        format(string, 128, "%i%i%i%i", playernumber1,playernumber2,playernumber3,playernumber4);
        format(number[0], 128, "%i", playernumber1);
        format(number[1], 128, "%i", playernumber2);
        format(number[2], 128, "%i", playernumber3);
        format(number[3], 128, "%i", playernumber4);
        PlayerTextDrawSetString(playerid, ElectricianTD[playerid][6], string);
        PlayerTextDrawSetString(playerid, ElectricianTD[playerid][1], number[0]);
        PlayerTextDrawSetString(playerid, ElectricianTD[playerid][2], number[1]);
        PlayerTextDrawSetString(playerid, ElectricianTD[playerid][3], number[2]);
        PlayerTextDrawSetString(playerid, ElectricianTD[playerid][4], number[3]);
    }
    
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_NUMBER1)
    {
        if(response)
        {
            if(strval(inputtext) != GetPVarInt(playerid, "Number1"))
            {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x, y, z);
                // Create an explosion at the player's position
                CreateExplosion(x, y, z, 12, 5);
                SetPlayerHealth(playerid, 0);
                for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
                CancelSelectTextDraw(playerid);
                DelPvarE(playerid);
            }
            else
            {
                SetPVarInt(playerid, "PlayerNumber1", strval(inputtext));
                HideElectrician(playerid);
            }
        }
    }
    if(dialogid == DIALOG_NUMBER2)
    {
        if(response)
        {
            if(strval(inputtext) != GetPVarInt(playerid, "Number2"))
            {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x, y, z);
                // Create an explosion at the player's position
                CreateExplosion(x, y, z, 12, 5);
                SetPlayerHealth(playerid, 0);
                for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
                CancelSelectTextDraw(playerid);
                DelPvarE(playerid);
            }
            else
            {
                SetPVarInt(playerid, "PlayerNumber2", strval(inputtext));
                HideElectrician(playerid);
            }
        }
    }
    if(dialogid == DIALOG_NUMBER3)
    {
        if(response)
        {
            if(strval(inputtext) != GetPVarInt(playerid, "Number3"))
            {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x, y, z);
                // Create an explosion at the player's position
                CreateExplosion(x, y, z, 12, 5);
                SetPlayerHealth(playerid, 0);
                for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
                CancelSelectTextDraw(playerid);
                DelPvarE(playerid);
            }
            else
            {
                SetPVarInt(playerid, "PlayerNumber3", strval(inputtext));
                HideElectrician(playerid);
            } 
        }
    }
    if(dialogid == DIALOG_NUMBER4)
    {
        if(response)
        {
            if(strval(inputtext) != GetPVarInt(playerid, "Number4"))
            {
                new Float:x, Float:y, Float:z;
                GetPlayerPos(playerid, x, y, z);
                // Create an explosion at the player's position
                CreateExplosion(x, y, z, 12, 5);
                SetPlayerHealth(playerid, 0);
                for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
                CancelSelectTextDraw(playerid);
                DelPvarE(playerid);
            }
            else
            {
            SetPVarInt(playerid, "PlayerNumber4", strval(inputtext));
            HideElectrician(playerid);
            }
        }
    }
    return 1;
}




CMD:fixelectrician(playerid){
    SelectTextDraw(playerid, COLOR_RED);
    ShowElectrician(playerid);
    return 1;
}