new PlayerText:
    Text_Player[MAX_PLAYERS][7];
func:CreatePlayerControll(playerid)
{

    Text_Player[playerid][0] = CreatePlayerTextDraw(playerid, 189.000, 211.000, "mdl-2017:car");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][0], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][0], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][0], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][0], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][0], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][0], true);

    Text_Player[playerid][1] = CreatePlayerTextDraw(playerid, 189.000, 232.000, "mdl-2017:trunk");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][1], 74.000, 15.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][1], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][1], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][1], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][1], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][1], true);

    Text_Player[playerid][2] = CreatePlayerTextDraw(playerid, 267.000, 165.000, "mdl-2017:lock");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][2], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][2], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][2], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][2], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][2], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][2], true);

    Text_Player[playerid][3] = CreatePlayerTextDraw(playerid, 267.000, 189.000, "mdl-2017:open");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][3], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][3], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][3], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][3], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][3], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][3], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][3], true);

    Text_Player[playerid][4] = CreatePlayerTextDraw(playerid, 267.000, 255.000, "mdl-2017:seatbelt");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][4], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][4], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][4], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][4], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][4], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][4], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][4], true);

    Text_Player[playerid][5] = CreatePlayerTextDraw(playerid, 267.000, 281.000, "mdl-2017:engine-off");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][5], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][5], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][5], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][5], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][5], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][5], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][5], true);

    Text_Player[playerid][6] = CreatePlayerTextDraw(playerid, 349.000, 211.000, "mdl-2017:put");
    PlayerTextDrawTextSize(playerid, Text_Player[playerid][6], 75.000, 16.000);
    PlayerTextDrawAlignment(playerid, Text_Player[playerid][6], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, Text_Player[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, Text_Player[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, Text_Player[playerid][6], 0);
    PlayerTextDrawBackgroundColour(playerid, Text_Player[playerid][6], 255);
    PlayerTextDrawFont(playerid, Text_Player[playerid][6], TEXT_DRAW_FONT_SPRITE_DRAW);
    PlayerTextDrawSetProportional(playerid, Text_Player[playerid][6], true);
    PlayerTextDrawSetSelectable(playerid, Text_Player[playerid][6], true);
}

func:OpenVehicleControl(playerid)
{
    for (new i; i < 4; i++)
    {
        PlayerTextDrawShow(playerid, VehControllPTD[playerid][i]);
    }
    SelectTextDraw(playerid, COLOR_GREEN);
}
func:OpenVehicleControl(playerid)
{
    for (new i; i < 4; i++)
    {
        PlayerTextDrawHide(playerid, VehControllPTD[playerid][i]);
    }
    SelectTextDraw(playerid, COLOR_GREEN);
}
func:VehicleControlClick(playerid, PlayerText:playertextid)
{
    if (playertextid == VehControllPTD[playerid][1])
    {
        PlayerPlaySound(playerid, 1147, 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
        CloseSmartKey(playerid);
    }
    if (playertextid == VehControllPTD[playerid][2])
    {
        PlayerPlaySound(playerid, 1147, 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
        CloseSmartKey(playerid);
    }
    if (playertextid == VehControllPTD[playerid][3])
    {
        PlayerPlaySound(playerid, 1147, 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        if (boot == VEHICLE_PARAMS_ON)
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
            CloseSmartKey(playerid);
        }
        else
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
            CloseSmartKey(playerid);
        }
    }
}