new GUZZLE_MAX_LOOP = 200;
new PlayerText:PuzzlePTD[MAX_PLAYERS][6];
new PuzzleProgress[MAX_PLAYERS];
new PuzzleProgressL[MAX_PLAYERS];
new PuzzleProgressR[MAX_PLAYERS];
new PuzzleLoop[MAX_PLAYERS];
new Float:PuzzleRealValue[MAX_PLAYERS];
new Float:_value_progress_second = 0.5825;
new Float:Puzzle_Success[MAX_PLAYERS];

forward OnPlayingPuzzle(playerid, _success);

func:CreatePuzzle(playerid, Float:_size = 5.0, _title[], _des[])
{
    /*
    progress :
    start: 255x   | 4y
    end:   371.5x | 4y
    range of success: 270x -> 360x
    */


    SetPVarInt(playerid, #_IsOpenPuzzle, 1);
    new Puzzle_Range = RandomEx(270, 360);
    SetPVarInt(playerid, #G_Range, Puzzle_Range);
    PuzzlePTD[playerid][0] = CreatePlayerTextDraw(playerid, 250.000, 323.000, "mdl-2023:puzzle_bg");
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][0], 128.000, 70.000);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][0], 1);

    PuzzlePTD[playerid][1] = CreatePlayerTextDraw(playerid, 261.000, 332.000, _title);
    PlayerTextDrawLetterSize(playerid, PuzzlePTD[playerid][1], 0.250, 1.098);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][1], 1);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][1], 150);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][1], 1);

    PuzzlePTD[playerid][2] = CreatePlayerTextDraw(playerid, 354.000, 332.000, _des);
    PlayerTextDrawLetterSize(playerid, PuzzlePTD[playerid][2], 0.189, 1.098);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][2], 1);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][2], 150);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][2], 1);

    PuzzlePTD[playerid][3] = CreatePlayerTextDraw(playerid, 314.000, 355.000, "_");
    PlayerTextDrawLetterSize(playerid, PuzzlePTD[playerid][3], 0.119, 1.699);
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][3], 371.000, 115.000);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][3], 2);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][3], -1);
    PlayerTextDrawUseBox(playerid, PuzzlePTD[playerid][3], 1);
    PlayerTextDrawBoxColor(playerid, PuzzlePTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][3], 1);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][3], -1);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][3], 1);

    PuzzlePTD[playerid][4] = CreatePlayerTextDraw(playerid, 256.600, 355.000, "_");
    PlayerTextDrawLetterSize(playerid, PuzzlePTD[playerid][4], 0.190, 1.699);
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][4], 358.000, 5.000);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][4], -1);
    PlayerTextDrawUseBox(playerid, PuzzlePTD[playerid][4], 1);
    PlayerTextDrawBoxColor(playerid, PuzzlePTD[playerid][4], -1515913054);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][4], 1);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][4], 1);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][4], -1);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][4], 1);

    PuzzlePTD[playerid][5] = CreatePlayerTextDraw(playerid, Puzzle_Range, 355.000, "_");
    PlayerTextDrawLetterSize(playerid, PuzzlePTD[playerid][5], 0.119, 1.699);
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][5], 294.000, _size);
    PlayerTextDrawAlignment(playerid, PuzzlePTD[playerid][5], 2);
    PlayerTextDrawColor(playerid, PuzzlePTD[playerid][5], -1);
    PlayerTextDrawUseBox(playerid, PuzzlePTD[playerid][5], 1);
    PlayerTextDrawBoxColor(playerid, PuzzlePTD[playerid][5], -1962934017);
    PlayerTextDrawSetShadow(playerid, PuzzlePTD[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, PuzzlePTD[playerid][5], 1);
    PlayerTextDrawBackgroundColor(playerid, PuzzlePTD[playerid][5], -1);
    PlayerTextDrawFont(playerid, PuzzlePTD[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, PuzzlePTD[playerid][5], 1);

    SetPVarFloat(playerid, #_Puzzle_Size, _size);
    for (new i; i < 6; i++) PlayerTextDrawShow(playerid, PuzzlePTD[playerid][i]);
    PuzzleLoop[playerid] = 0;
    PuzzleProgress[playerid] = SetTimerEx("OnUpdateProgressValues", 25, 1, "i", playerid);
    return 1;
}

func:DestroyPuzzle(playerid)
{
    for (new i; i < 6; i++)
    {
        PlayerTextDrawDestroy(playerid, PuzzlePTD[playerid][i]);
    }
    return 1;
}

forward OnUpdateProgressValues(playerid);
public OnUpdateProgressValues(playerid)
{
    // //printf("%.2f",PuzzleRealValue[playerid]);
    if (Puzzle_Success[playerid] == 1)
    {
        SetPVarInt(playerid, #_IsOpenPuzzle, 0);
        Puzzle_Success[playerid] = 0;
        PuzzleLoop[playerid] = 0;
        PuzzleRealValue[playerid] = 0;

        DestroyPuzzle(playerid);
        CallRemoteFunction("OnPlayingPuzzle", "ii", playerid, 1);
        KillTimer(PuzzleProgress[playerid]);
    }
    else if (Puzzle_Success[playerid] == -1)
    {
        SetPVarInt(playerid, #_IsOpenPuzzle, 0);
        Puzzle_Success[playerid] = 0;
        PuzzleLoop[playerid] = 0;
        PuzzleRealValue[playerid] = 0;

        DestroyPuzzle(playerid);
        CallRemoteFunction("OnPlayingPuzzle", "ii", playerid, 0);
        KillTimer(PuzzleProgress[playerid]);
        KillTimer(PuzzleProgressL[playerid]);
        KillTimer(PuzzleProgressR[playerid]);
    }
    else
    {
        if (PuzzleLoop[playerid] < GUZZLE_MAX_LOOP - 1 && GetPVarInt(playerid, #_MovingToLeft) != 1)
        {
            PuzzleProgressR[playerid] = SetTimerEx("MoveGZProgressToRight", 25, 0, "i", playerid);
        }
        else if(GetPVarInt(playerid, #_MovingToRight) != 1)
        {
            PuzzleProgressL[playerid] = SetTimerEx("MoveGZProgressToLeft", 25, 0, "i", playerid);
        }
    }
    return 1;
}

forward MoveGZProgressToRight(playerid);
public MoveGZProgressToRight(playerid)
{
    if (GetPVarInt(playerid, #_MovingToLeft) == 1) return 1;
    SetPVarInt(playerid, #_MovingToRight, 1);
    //printf("%d | %.2f", PuzzleLoop[playerid], (PuzzleLoop[playerid] * _value_progress_second));
    new Float:_real_Value = 255 + (PuzzleLoop[playerid] * _value_progress_second);
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][4], _real_Value, 5.000);
    PlayerTextDrawHide(playerid, PuzzlePTD[playerid][4]);
    PlayerTextDrawShow(playerid, PuzzlePTD[playerid][4]);
    PuzzleRealValue[playerid] = _real_Value;

    if (PuzzleLoop[playerid] == GUZZLE_MAX_LOOP - 1)
    {
        SetPVarInt(playerid, #_MovingToRight, 0);
        KillTimer(PuzzleProgressR[playerid]);
        return 1;
    }

    PuzzleLoop[playerid]++;
    return 1;
}

forward MoveGZProgressToLeft(playerid);
public MoveGZProgressToLeft(playerid)
{
    if (GetPVarInt(playerid, #_MovingToRight) == 1) return 1;
    SetPVarInt(playerid, #_MovingToLeft, 1);
    new PuzzleLoopL = GUZZLE_MAX_LOOP - 1 - PuzzleLoop[playerid];
    //printf("R | %d | %.2f | Puzzle L: %d", PuzzleLoop[playerid], (PuzzleLoopL * _value_progress_second), PuzzleLoopL);
    new Float:_real_Value = 371.5 - (PuzzleLoopL * _value_progress_second);
    PlayerTextDrawTextSize(playerid, PuzzlePTD[playerid][4], _real_Value, 5.000);
    PlayerTextDrawHide(playerid, PuzzlePTD[playerid][4]);
    PlayerTextDrawShow(playerid, PuzzlePTD[playerid][4]);
    PuzzleRealValue[playerid] = _real_Value;
    if (PuzzleLoop[playerid] == 0)
    {
        SetPVarInt(playerid, #_MovingToLeft, 0);
        KillTimer(PuzzleProgressL[playerid]);
        return 1;
    }
    PuzzleLoop[playerid]--;
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (GetPVarInt(playerid, #_IsOpenPuzzle) == 1)
    {
        if (newkeys == KEY_CTRL_BACK)
        {
            new Float:_size = Float:GetPVarFloat(playerid, #_Puzzle_Size);
            // printf("Range: %.2f - %.2f | Real Value: %.2f", (GetPVarInt(playerid, #G_Range) - _size),(GetPVarInt(playerid, #G_Range) + _size),PuzzleRealValue[playerid]);
            if (PuzzleRealValue[playerid] > (GetPVarInt(playerid, #G_Range) - _size) && PuzzleRealValue[playerid] < (GetPVarInt(playerid, #G_Range) + _size))
            {
                Puzzle_Success[playerid] = 1;
            }
            else
            {
                Puzzle_Success[playerid] = -1;
            }
        }
    }
    return 1;
}

CMD:guzzle(playerid, params[])
{
    SetPVarInt(playerid, #_Guzzle_ID, 1);
    CreatePuzzle(playerid, strval(params), "Puzzle - GVO", "1/10");
    return 1;
}
public OnPlayingPuzzle(playerid, _success)
{
    if(GetPVarInt(playerid, #_Guzzle_ID) == 1)
    {
        switch(_success)
        {
            case 0: // failed
            {
                SendClientMessage(playerid, -1, "That bai mat rui");
            }
            case 1: // success
            {
                SendClientMessage(playerid, -1, "Thanh cong rui");
            }
        }
    }
}
hook OnPlayerDisconnect(playerid, reason)
{
    SetPVarInt(playerid, #_IsOpenPuzzle, 0);
    Puzzle_Success[playerid] = 0;
    PuzzleLoop[playerid] = 0;
    PuzzleRealValue[playerid] = 0;

    KillTimer(PuzzleProgress[playerid]);
    KillTimer(PuzzleProgressL[playerid]);
    KillTimer(PuzzleProgressR[playerid]);
    DestroyPuzzle(playerid);
    return 1;
}