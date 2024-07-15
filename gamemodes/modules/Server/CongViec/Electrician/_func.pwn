func:DelPvarE(playerid){
    DeletePVar(playerid, "PlayerNumber1"),
    DeletePVar(playerid, "PlayerNumber2"),
    DeletePVar(playerid, "PlayerNumber3"),
    DeletePVar(playerid, "PlayerNumber4"),
    DeletePVar(playerid, "Number1"),
    DeletePVar(playerid, "Number2"),
    DeletePVar(playerid, "Number3"),
    DeletePVar(playerid, "Number4");
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][6], "0000");
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][1], "0");
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][2], "0");
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][3], "0");
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][4], "0");
    return 1;
}
func:ShowElectrician(playerid){
    UpdateElectrician(playerid);
    for(new i = 0; i < 7; i++) PlayerTextDrawShow(playerid, ElectricianTD[playerid][i]);
    return 1;
}
func:SuccessElectrician(playerid){
    new playernumber1 = GetPVarInt(playerid, "PlayerNumber1"),
        playernumber2 = GetPVarInt(playerid, "PlayerNumber2"),
        playernumber3 = GetPVarInt(playerid, "PlayerNumber3"),
        playernumber4 = GetPVarInt(playerid, "PlayerNumber4"),
        number1 = GetPVarInt(playerid, "Number1"),
        number2 = GetPVarInt(playerid, "Number2"),
        number3 = GetPVarInt(playerid, "Number3"),
        number4 = GetPVarInt(playerid, "Number4");
    if(playernumber1 == number1 && playernumber2 == number2 && playernumber3 == number3 && playernumber4 == number4)
    {
        for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
        CancelSelectTextDraw(playerid);
        DelPvarE(playerid);
    }
    return 1;
}
func:IncorrectElectrician(playerid){
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    // Create an explosion at the player's position
    CreateExplosion(x, y, z, 12, 5);
    SetPlayerHealth(playerid, 0);
    for(new i = 0; i < 7; i++) PlayerTextDrawHide(playerid, ElectricianTD[playerid][i]);
    CancelSelectTextDraw(playerid);
    DelPvarE(playerid);
    return 1;
}
func:UpdateElectrician(playerid){
    new string[128];
    new number1 = random(9),
        number2 = random(9),
        number3 = random(9),
        number4 = random(9);
    SetPVarInt(playerid, "Number1", number1);
    SetPVarInt(playerid, "Number2", number2);
    SetPVarInt(playerid, "Number3", number3);
    SetPVarInt(playerid, "Number4", number4);
    SetPVarInt(playerid, "PlayerNumber1", 0);
    SetPVarInt(playerid, "PlayerNumber2", 0);
    SetPVarInt(playerid, "PlayerNumber3", 0);
    SetPVarInt(playerid, "PlayerNumber4", 0);
    format(string, 128, "%i%i%i%i", number1,number2,number3,number4);
    PlayerTextDrawSetString(playerid, ElectricianTD[playerid][5], string);
    return 1;
}

func:ElectricianClick(playerid, PlayerText:playertextid)
{
    if(playertextid == ElectricianTD[playerid][1])
    {
        ShowPlayerDialog(playerid, DIALOG_NUMBER1, DIALOG_STYLE_INPUT, "Required Code", "Enter Required Code:", "Enter", "Cancel");
    }
    if(playertextid == ElectricianTD[playerid][2])
    {
        ShowPlayerDialog(playerid, DIALOG_NUMBER2, DIALOG_STYLE_INPUT, "Required Code", "Enter Required Code:", "Enter", "Cancel");
    }
    if(playertextid == ElectricianTD[playerid][3])
    {
        ShowPlayerDialog(playerid, DIALOG_NUMBER3, DIALOG_STYLE_INPUT, "Required Code", "Enter Required Code:", "Enter", "Cancel");
    }
    if(playertextid == ElectricianTD[playerid][4])
    {
        ShowPlayerDialog(playerid, DIALOG_NUMBER4, DIALOG_STYLE_INPUT, "Required Code", "Enter Required Code:", "Enter", "Cancel");
    }
    return 1;
}