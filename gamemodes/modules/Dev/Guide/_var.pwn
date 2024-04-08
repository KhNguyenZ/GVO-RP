new PlayerText:Guide_BG_PTD[MAX_PLAYERS][10];
new PlayerText:Guide_Key_PTD[MAX_PLAYERS][10];
new PlayerText:Guide_Suggest_PTD[MAX_PLAYERS][10];
new CountGuide[MAX_PLAYERS];


enum GuideTXD_Enum{
    g_id,
    g_key,
    g_content[1280]
}

new GuideTXD_Info[10][GuideTXD_Enum];