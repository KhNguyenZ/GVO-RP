#include <YSI_Coding\y_hooks>
// #include <actor_plus>

func:CreatePlayerInteractiveNPC(playerid)
{
    iNPC_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 2.000, 313.000, ""); // title
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][0], 0.479, 2.299);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][0], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][0], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][0], 1);

    iNPC_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 0.000, 305.000, "mdl-2011:main");
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][1], 641.000, 145.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][1], 1);

    iNPC_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 298.000, 310.000, "mdl-2011:optional");
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][2], 109.000, 24.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][2], 1);

    iNPC_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 412.000, 310.000, "mdl-2011:optional");
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][3], 109.000, 24.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][3], 1);

    iNPC_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 526.000, 310.000, "mdl-2011:optional");
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][4], 109.000, 24.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][4], 1);

    iNPC_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 350.000, 315.000, ""); //Optional 1
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][5], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][5], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][5], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][5], 2);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][5], 1);

    iNPC_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 465.000, 315.000, "");
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][6], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][6], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][6], 2);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][6], 1);

    iNPC_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 581.000, 315.000, "");
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][7], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][7], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][7], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][7], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][7], 2);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][7], 1);

    iNPC_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 10.000, 341.000, ""); //content
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][8], 0.270, 1.299);
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][8], 633.000, 40.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][8], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][8], 1);

    iNPC_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 585.000, 417.000, ""); // btn1
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][9], 0.270, 1.299);
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][9], 633.000, 67.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][9], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][9], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][9], 1);

    iNPC_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 511.000, 417.000, ""); // btn2
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][10], 0.270, 1.299);
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][10], 633.000, 67.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][10], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][10], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][10], 1);

    iNPC_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 437.000, 417.000, ""); // Button3
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][11], 0.270, 1.299);
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][11], 633.000, 67.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][11], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][11], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][11], 1);

    iNPC_PTD[playerid][12] = CreatePlayerTextDraw(playerid, 362.000, 417.000, ""); //Button4
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][12], 0.270, 1.299);
    PlayerTextDrawTextSize(playerid, iNPC_PTD[playerid][12], 633.000, 67.000);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][12], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][12], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, iNPC_PTD[playerid][12], 1);
    return 1;
}
// InteractiveNPCs_Data[MAX_INTERACTIVE_NPC][InteractiveNPCs_Enum];
func:ShowPlayerInteractive(playerid, inter_ids, title[], content[], i_btn1[] = "", i_btn2[] = "", i_btn3[] = "",i_btn4[] = "")
{
    if(GetPVarInt(playerid, #isOpenInteractive)) return DestroyPlayerInteractive(playerid);
    SetPVarInt(playerid, #Interactive_Open_ID, inter_ids);
    new Float:Int_Pos[3];
    GetPlayerPos(playerid, Int_Pos[0], Int_Pos[1], Int_Pos[2]);

    /*SetPlayerCameraLookAt(playerid, Int_Pos[0], Int_Pos[1]-1, Int_Pos[2]);
    SetPlayerCameraPos(playerid,InteractiveNPCs_Data[inter_ids][iNPC_Pos][0],
    InteractiveNPCs_Data[inter_ids][iNPC_Pos][1],
    InteractiveNPCs_Data[inter_ids][iNPC_Pos][2]);*/
    TogglePlayerControllable(playerid, 0);

    SetPVarInt(playerid, #isOpenInteractive, 1);
    CreatePlayerInteractiveNPC(playerid);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][0], title);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][8], content);

    new btnF[128];
    format(btnF, 128, "%s", i_btn1);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][9], btnF);
    format(btnF, 128, "%s", i_btn2);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][10], btnF);
    format(btnF, 128, "%s", i_btn3);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][11], btnF);
    format(btnF, 128, "%s", i_btn4);
    PlayerTextDrawSetString(playerid, iNPC_PTD[playerid][12], btnF);

    for(new i; i < 13; i++) PlayerTextDrawShow(playerid, iNPC_PTD[playerid][i]);
    SelectTextDraw(playerid, -1);
    return 1;
}

func:DestroyPlayerInteractive(playerid)
{
    CancelSelectTextDraw(playerid);
    for(new i; i < 13; i++) PlayerTextDrawDestroy(playerid, iNPC_PTD[playerid][i]);
    DeletePVar(playerid, #isOpenInteractive);

    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(playerid, 1);
    return 1;
}

hook OnGameModeInit()
{
    for(new i; i < MAX_INTERACTIVE_NPC; i++) InteractiveNPCs_Data[i][iNPC_ID] = -1;
    new Inter_NPC_Test;
    Inter_NPC_Test = CreateInteractiveNPC(0, "Test", "Interactive Test",2, 1808.5581,-1905.7458,13.5741,90.0084);

    Inter_NPC_Test = CreateInteractiveNPC(1, "KhNguyen_Z", "Interactive Test Actor",2,1797.5756,-1909.0494,13.3979,150.5175);
     Inter_NPC_Test = CreateInteractiveNPC(1, "KhNguyen_Z", "Interactive Test Actor",2,1797.5756,-1909.0494,13.3979,150.5175);
    ApplyActorAnimation(Inter_NPC_Test, "LOWRIDER","prtial_gngtlkB",4.1,1,0,0,0,0);
}