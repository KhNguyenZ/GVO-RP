#include <YSI_Coding\y_hooks>


hook OnPlayerUpdate(playerid)
{
    if(!IsPlayerSpawned(playerid)) return 1;
    if(IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_guide[1280], inter_aid = IsPlayerNearInteractiveNPC(playerid);
        format(inter_guide, 1280, "Tuong tac voi %s", GetActorName(InteractiveNPCs_Data[inter_aid][iNPC_ID]));
        ChangeGuideContent(playerid, "Y",inter_guide);
    }
    else ChangeGuideContent(playerid, "Y","Tuong tac voi NULL");
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
            if(inter_near == 0) {
                ShowPlayerInteractive(playerid, 0, "Dcm ao lon that day", "day la test thoi hahahaah", "Xin viec", "Nghi Viec", "Thay dong phuc", "Thue xe");
                
            }
            if(inter_near == 1) {
                ShowPlayerInteractive(playerid, 1, "Actor so 2", "khoi nguyen dep trai so 1 the gioi", "Mua Vat Pham", "Ban Vat Pham", "Doi Ten", "Mua VIP");
            }
        }
    }
    return 1;
}


InteractiveNPCs_Click(playerid, PlayerText:playertextid)
{
    for(new i = 9; i < 13; i++)
    {
        if(playertextid == iNPC_PTD[playerid][i])
        {
            new response = 1,
            inter_open_id = GetPVarInt(playerid, #Interactive_Open_ID),
            btn_click = (i-9);
            CallRemoteFunction("OnInteractiveResponse", "iiii", playerid, inter_open_id, response, btn_click);
        }
    }
    return 1;
}

forward OnInteractiveResponse(playerid, inter_id, response, btn_click);
public OnInteractiveResponse(playerid, inter_id, response, btn_click)
{
    if(inter_id == 0)
    {
        if(response)
        {
            if(btn_click == 0) return SendClientMessage(playerid, -1, "ID 0 | Btn 1");
            if(btn_click == 1) return SendClientMessage(playerid, -1, "ID 0 | Btn 2");
            if(btn_click == 2) return SendClientMessage(playerid, -1, "ID 0 | Btn 3");
            if(btn_click == 3) return SendClientMessage(playerid, -1, "ID 0 | Btn 4");
        }
    }

    if(inter_id == 1)
    {
        if(response)
        {
            if(btn_click == 0) return SendClientMessage(playerid, -1, "ID 1 | Btn 1");
            if(btn_click == 1) return SendClientMessage(playerid, -1, "ID 1 | Btn 2");
            if(btn_click == 2) return SendClientMessage(playerid, -1, "ID 1 | Btn 3");
            if(btn_click == 3) return SendClientMessage(playerid, -1, "ID 1 | Btn 4");
        }
    }
    return 1;
}