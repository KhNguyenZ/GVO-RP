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
func:CreateInteractiveNPC(i_id, a_name[], describe[], skin, title[], content[], Float:iNPC_PosX, Float:iNPC_PosY, Float:iNPC_PosZ, Float:iNPC_PosA)
{
    new inter_npc;
    if(IsFreeInteractiveID(i_id)){
        inter_npc = i_id;
    } else{
        printf("[Log-Dev]Interactive NPCs ID: %d was used to", i_id);
        return 1;
    }
    format(InteractiveNPCs_Data[inter_npc][iNPC_Name], MAX_INTERACTIVE_NPC_NAME, "%s", a_name);
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][0] = iNPC_PosX;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][1] = iNPC_PosY;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][2] = iNPC_PosZ;
    InteractiveNPCs_Data[inter_npc][iNPC_Pos][3] = iNPC_PosA;

    InteractiveNPCs_Data[inter_npc][iNPC_Skin] = skin;

    InteractiveNPCs_Data[inter_npc][iNPC_ID] = CreateActor(skin, iNPC_PosX, iNPC_PosY, iNPC_PosZ, iNPC_PosA);

    format(InteractiveNPCs_Data[inter_npc][iNPC_Title], 1280, "%s", title);
    format(InteractiveNPCs_Data[inter_npc][iNPC_Content], 1280, "%s", content);


    new Inter_lbmsg[1280];
    format(Inter_lbmsg, 1280,"{41bcfa}%s (%d)\n{FFFFFF}%s", a_name,inter_npc,describe);
    SetActorName(InteractiveNPCs_Data[inter_npc][iNPC_ID], Inter_lbmsg);
    Count_InterNPC++;

    return InteractiveNPCs_Data[inter_npc][iNPC_ID];
}


func:IsPlayerNearInteractiveNPC(playerid)
{
    new near_npc_id = -1;
    for(new i; i < Count_InterNPC; i++)
    {
        if(IsPlayerInRangeOfActor(playerid, i, 2.0)) {
            near_npc_id = i;
            break;
        }
    }
    return near_npc_id;
}

CMD:inter_hide(playerid)
{
    DestroyPlayerInteractive(playerid);
    return 1;
}