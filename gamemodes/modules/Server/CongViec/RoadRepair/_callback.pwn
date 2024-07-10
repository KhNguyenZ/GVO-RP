#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    new RoadRepair_NPC;
    RoadRepair_NPC =  CreateInteractiveNPC(2, "Lands", "Road Repair Worker",2,1797.5756,-1909.0494,13.3979,150.5175);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_near = IsPlayerNearInteractiveNPC(playerid);
        if(newkeys == KEY_YES)
        {
            if(GetPVarInt(playerid, #isOpenInteractive) == 1) return DestroyPlayerInteractive(playerid);
            if(inter_near == 2) {
                ShowPlayerInteractive(playerid, 2, "Cong viec sua duong", "Sua cac con duong bi hu hong", "Xin viec", "Nghi Viec", "Thay dong phuc", "Thue xe");
                
            }
        }
    }
    return 1;
}

hook  OnInteractiveResponse(playerid, inter_id, response, btn_click)
{
    if(inter_id == 2)
    {
        if(response)
        {
            switch(btn_click)
            {
                
            }
        }
    }
    return 1;
}