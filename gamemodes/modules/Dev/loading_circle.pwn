#include <YSI\YSI_Coding\y_hooks>
new PlayerText: CircleLoadPTD[MAX_PLAYERS][3];
forward OnFinishLoadCircle(playerid, _load_id);
new CL_Loop[MAX_PLAYERS];
new LoadingTimer[MAX_PLAYERS];
hook OnPlayerConnect(playerid)
{
    CircleLoadPTD[playerid][0] = CreatePlayerTextDraw(playerid, 296.000, 353.000, "mdl-2024:background");
    PlayerTextDrawTextSize(playerid, CircleLoadPTD[playerid][0], 45.000, 52.000);
    PlayerTextDrawAlignment(playerid, CircleLoadPTD[playerid][0], 1);
    PlayerTextDrawColour(playerid, CircleLoadPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, CircleLoadPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, CircleLoadPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, CircleLoadPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, CircleLoadPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, CircleLoadPTD[playerid][0], 1);

    CircleLoadPTD[playerid][1] = CreatePlayerTextDraw(playerid, 295.000, 351.000, "mdl-2024:l1");
    PlayerTextDrawTextSize(playerid, CircleLoadPTD[playerid][1], 48.000, 56.000);
    PlayerTextDrawAlignment(playerid, CircleLoadPTD[playerid][1], 1);
    PlayerTextDrawColour(playerid, CircleLoadPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, CircleLoadPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, CircleLoadPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, CircleLoadPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, CircleLoadPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, CircleLoadPTD[playerid][1], 1);

    CircleLoadPTD[playerid][2] = CreatePlayerTextDraw(playerid, 318.000, 412.000, "");
    PlayerTextDrawLetterSize(playerid, CircleLoadPTD[playerid][2], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, CircleLoadPTD[playerid][2], 2);
    PlayerTextDrawColour(playerid, CircleLoadPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, CircleLoadPTD[playerid][2], 1);
    PlayerTextDrawSetOutline(playerid, CircleLoadPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, CircleLoadPTD[playerid][2], 150);
    PlayerTextDrawFont(playerid, CircleLoadPTD[playerid][2], 2);
    PlayerTextDrawSetProportional(playerid, CircleLoadPTD[playerid][2], 1);
    return 1;
}

func:PlayerLoading(playerid, _time = 5000, _loading_id, const _title[])
{
    // CL_Loop[playerid] = floatround(_time / 5);
    if (GetPVarInt(playerid, #_IsOpenLoadCircle) == 1) return 0;
    SetPVarInt(playerid, #_IsLoadingCircle, 1);
    SetPVarInt(playerid, #_IsOpenLoadCircle, 1);
    SetPVarInt(playerid, #_IsLoadingCircleCount, 1);
    PlayerTextDrawShow(playerid, CircleLoadPTD[playerid][0]);
    PlayerTextDrawSetString(playerid, CircleLoadPTD[playerid][1], "");
    PlayerTextDrawShow(playerid, CircleLoadPTD[playerid][1]);
    PlayerTextDrawSetString(playerid, CircleLoadPTD[playerid][2], _title);
    PlayerTextDrawShow(playerid, CircleLoadPTD[playerid][2]);
    LoadingTimer[playerid] = SetTimerEx("OnLoadingCircle", floatround(_time / 100), 1, "ii", playerid, _loading_id);
    return 1;
}

forward OnLoadingCircle(playerid, _load_id);
public OnLoadingCircle(playerid, _load_id)
{
    if (GetPVarInt(playerid, #_IsLoadingCircle) <= 100)
    {
        if (GetPVarInt(playerid, #_IsLoadingCircleCount) > 5) SetPVarInt(playerid, #_IsLoadingCircleCount, 0);
        PlayerTextDrawSetString(playerid, CircleLoadPTD[playerid][1], sprintf("mdl-2024:l%d", GetPVarInt(playerid, #_IsLoadingCircleCount)));
        SetPVarInt(playerid, #_IsLoadingCircle, GetPVarInt(playerid, #_IsLoadingCircle)+1);
        SetPVarInt(playerid, #_IsLoadingCircleCount, GetPVarInt(playerid, #_IsLoadingCircleCount)+1);
    }
    else
    {
        DeletePVar(playerid, #_IsLoadingCircleCount);
        DeletePVar(playerid, #_IsLoadingCircle);
        DeletePVar(playerid, #_IsOpenLoadCircle);
        PlayerTextDrawHide(playerid, CircleLoadPTD[playerid][0]);
        PlayerTextDrawHide(playerid, CircleLoadPTD[playerid][1]);
        PlayerTextDrawHide(playerid, CircleLoadPTD[playerid][2]);

        CallRemoteFunction("OnFinishLoadCircle", "ii", playerid, _load_id);
        KillTimer(LoadingTimer[playerid]);
    }
}

CMD:loadc(playerid, params[])
{
    PlayerLoading(playerid, strval(params)*1000, 1, "Test Loading Circle - GVO");
    return 1;
}

public OnFinishLoadCircle(playerid, _load_id)
{
    switch(_load_id)
    {
        case 1: SendClientMessage(playerid,-1, "Loading Progress ID 1");
    }
    return 1;
}