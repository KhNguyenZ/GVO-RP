#include <YSI_Coding\y_hooks>


hook OnPlayerUpdate(playerid)
{
    if(IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_guide[1280], inter_aid = IsPlayerNearInteractiveNPC(playerid);
        format(inter_guide, 1280, "Tuong tac voi ~g~%s", InteractiveNPCs_Data[inter_aid][iNPC_Name]);
        // CreatePlayerGuide(playerid,"E", inter_guide);
        ChangeGuideContent(playerid, "Y",inter_guide);
    }
    else ChangeGuideContent(playerid, "Y","Tuong tac voi ~g~NULL");
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_near = IsPlayerNearInteractiveNPC(playerid);
        if(newkeys == KEY_YES)
        {
            if(inter_near == 0) {
                ShowPlayerInteractive(playerid, 0, "Xin viec", "Nghi Viec", "Thay dong phuc", "Thue xe");
                
            }
            if(inter_near == 1) {
                ShowPlayerInteractive(playerid, 1, "Mua Vat Pham", "Ban Vat Pham", "Doi Ten", "Mua VIP");
            }
        }
    }
    return 1;
}