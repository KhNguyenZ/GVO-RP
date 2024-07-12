#include <YSI_Coding\y_hooks>
#define IsPlayerRoadRepair(%0) (Character[%0][char_Job] == JOB_ROADREPAIR)
hook OnGameModeInit()
{
    new RoadRepair_NPC;
    RoadRepair_NPC = CreateInteractiveNPC(2, "Lands", "Road Repair Worker",260,-73.1041,-1585.2783,2.6172,233.3594);
    ApplyActorAnimation(RoadRepair_NPC, "LOWRIDER","prtial_gngtlkB",4.1,1,0,0,0,0);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_near = IsPlayerNearInteractiveNPC(playerid);
        if(newkeys == KEY_YES)
        {
            if(inter_near == 2) {
                ShowPlayerInteractive(playerid, 2, "Cong viec sua duong", "Sua cac con duong bi hu hong", "Xin viec", "Nghi Viec", "Thay dong phuc", "Thue xe");
                
            }
        }
    }
    return 1;
}

hook OnInteractiveResponse(playerid, inter_id, response, btn_click)
{
    if(inter_id == 2)
    {
        if(response)
        {
            switch(btn_click)
            {
                case 0: {
                    if(Character[playerid][char_Job] != 0) return SendErrorMessage(playerid, "Ban dang co 1 cong viec khac , hay nghi viec truoc nhe !");
                    SetPlayerJob(playerid, JOB_ROADREPAIR);
                }
                case 1:{
                    if(Character[playerid][char_Job] == 0) return SendErrorMessage(playerid, "Ban khong co 1 cong viec!");
                    SetPlayerJob(playerid, 0);
                    SendJobMessage(playerid, "Ban da nghi viec thanh cong");
                }
                case 2:{
                    if(Character[playerid][char_Job] != JOB_ROADREPAIR) return SendErrorMessage(playerid, "Ban khong phai nhan vien");
                    Character[playerid][char_Skin] = SKIN_ROADREPAIR;
                    SetPlayerSkin(playerid, Character[playerid][char_Skin]);
                    SendJobMessage(playerid, "Ban da thay trang phuc thanh cong");
                }
                case 3:{
                    RentJobCar(playerid, JOB_ROADREPAIR, RR_VEHMODEL, RR_VEHCOLOR);
                }
            }
        }
    }
    return 1;
}

CMD:placecade(playerid, params[])
{
    if(!IsPlayerRoadRepair(playerid)) return SendErrorMessage(playerid, "Ban khong phai nhan vien !");
    new dlg_cade[50*sizeof(Cade_Var)];
    for(new i; i < sizeof(Cade_Var); i++)
    {
        new subcade[100];
        format(subcade, 100, "%d\tCade %d\n", Cade_Var[i], i+1);
        strcat(dlg_cade, subcade);
    }
    strcat(dlg_cade, "-1\tEND");
    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_PREVIEW_MODEL, "Cade for Road Repair Job", dlg_cade, "Chon", "Huy");
}