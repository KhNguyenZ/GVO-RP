#define MAX_INTERACTIVE_NPC 1000
#define MAX_INTERACTIVE_NPC_NAME 100

enum InteractiveNPCs_Enum{
    iNPC_ID,
    iNPC_Title,
    iNPC_Content,
    iNPC_Button[4],
    iNPC_Optional[3],
    iNPC_Skin,
    iNPC_Name[MAX_INTERACTIVE_NPC_NAME],
    Float:iNPC_Pos[4],
}

new InteractiveNPCs_Data[MAX_INTERACTIVE_NPC][InteractiveNPCs_Enum];

new Count_InterNPC;
new Iterator:InterNPC<MAX_INTERACTIVE_NPC>;
new PlayerText: iNPC_PTD[MAX_PLAYERS][13];