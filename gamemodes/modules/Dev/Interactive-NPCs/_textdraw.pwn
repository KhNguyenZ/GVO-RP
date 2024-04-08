#include <YSI_Coding\y_hooks>
// #include <actor_plus>

stock CreatePlayerInteractiveNPC(playerid)
{
    new PlayerText: iNPC_PTD[MAX_PLAYERS][13];

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

    iNPC_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 350.000, 315.000, "Optional 1");
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][5], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][5], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][5], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][5], 2);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][5], 1);

    iNPC_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 465.000, 315.000, "Optional 2");
    PlayerTextDrawLetterSize(playerid, iNPC_PTD[playerid][6], 0.300, 1.500);
    PlayerTextDrawAlignment(playerid, iNPC_PTD[playerid][6], 2);
    PlayerTextDrawColor(playerid, iNPC_PTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, iNPC_PTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, iNPC_PTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, iNPC_PTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, iNPC_PTD[playerid][6], 2);
    PlayerTextDrawSetProportional(playerid, iNPC_PTD[playerid][6], 1);

    iNPC_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 581.000, 315.000, "Optional 3");
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
func:IsFreeInteractiveID(inpc_id)
{
    new checkzz = 1;
    for(new i; i < MAX_INTERACTIVE_NPC; i++)
    {
        if(InteractiveNPCs_Data[i][iNPC_ID] == inpc_id)
        {
            checkzz = 0;
            break;
        }
    }
    return checkzz;
}
func:CreateInteractiveNPC(i_id, npcid, a_name[], skin, title[], content[], Float:iNPC_PosX, Float:iNPC_PosY, Float:iNPC_PosZ, Float:iNPC_PosA)
{
    new inter_npc;
    if(IsFreeInteractiveID(i_id)){
        inter_npc = i_id;
    } else{
        printf("[Log-Dev]Interactive NPCs ID: %d was used to", i_id);
        return 1;
    }

    InteractiveNPCs_Data[inter_npc][iNPC_Pos][0] = iNPC_PosX;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][1] = iNPC_PosY;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][2] = iNPC_PosZ;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][3] = iNPC_PosA;

    InteractiveNPCs_Data[inter_npc][iNPC_Skin] = skin;

    InteractiveNPCs_Data[inter_npc][iNPC_ID] = CreateActor(skin, iNPC_PosX, iNPC_PosY, iNPC_PosZ, iNPC_PosA);
    ApplyActorAnimation(InteractiveNPCs_Data[inter_npc][iNPC_ID], "LOWRIDER","prtial_gngtlkB",4.1,1,0,0,0,0);

    //SetActorName(actorid, actor_name[], bool:display, color = DEFAULT_ACTOR_COLOR_NAME, bool:contain_id = false, bool:isdynamic = DEFAULT_IS_DYNAMIC_PARAMETER)
    // SetActorName(InteractiveNPCs_Data[inter_npc][iNPC_ID], a_name, 1, DEFAULT_ACTOR_COLOR_NAME);
    return 1;
}

hook OnGameModeInit()
{
    for(new i; i < MAX_INTERACTIVE_NPC; i++) InteractiveNPCs_Data[i][iNPC_ID] = -1;
    new Inter_NPC_Test;
    CreateInteractiveNPC(0, Inter_NPC_Test, "Test", 2, "title", "Interactive Test", 1808.5581,-1905.7458,13.5741,90.0084);
}