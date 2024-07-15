#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    new RoadRepair_NPC;
    RoadRepair_NPC = CreateInteractiveNPC(2, "Lands", "Road Repair Worker", 260, -73.1041, -1585.2783, 2.6172, 233.3594);
    printf("Load road repair");
    ApplyActorAnimation(RoadRepair_NPC, "LOWRIDER", "prtial_gngtlkB", 4.1, 1, 0, 0, 0, 0);

    for(new i; i < sizeof(DamagePoint); i++)
    {
        ResetDamagePoint(i);
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (IsPlayerNearInteractiveNPC(playerid) != -1)
    {
        new inter_near = IsPlayerNearInteractiveNPC(playerid);
        if (newkeys == KEY_YES)
        {
            if (inter_near == 2)
            {
                ShowPlayerInteractive(playerid, 2, "Cong viec sua duong", "Sua cac con duong bi hu hong", "Xin viec", "Nghi Viec", "Thay dong phuc", "Thue xe");
            }
        }
    }
    if(newkeys == KEY_WALK)
    {
        new _rr_veh = GetNeraestVehicle(playerid, 1.0),
        _vh_id = VehRR_Renter[playerid];
        if(_rr_veh == _vh_id)
        {
            if(IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Ban can phai xuong xe de thao tac");
            ShowDialogCade(playerid);
        }
    }
    return 1;
}

hook OnInteractiveResponse(playerid, inter_id, response, btn_click)
{
    if (inter_id == 2)
    {
        if (response)
        {
            switch (btn_click)
            {
                case 0:
                {
                    if (Character[playerid][char_Job] != 0) return SendErrorMessage(playerid, "Ban dang co 1 cong viec khac , hay nghi viec truoc nhe !");
                    SetPlayerJob(playerid, JOB_ROADREPAIR);
                }
                case 1:
                {
                    if (Character[playerid][char_Job] == 0) return SendErrorMessage(playerid, "Ban khong co 1 cong viec!");
                    SetPlayerJob(playerid, 0);
                    SendJobMessage(playerid, "Ban da nghi viec thanh cong");
                }
                case 2:
                {
                    if (Character[playerid][char_Job] != JOB_ROADREPAIR) return SendErrorMessage(playerid, "Ban khong phai nhan vien");
                    Character[playerid][char_Skin] = SKIN_ROADREPAIR;
                    SetPlayerSkin(playerid, Character[playerid][char_Skin]);
                    SendJobMessage(playerid, "Ban da thay trang phuc thanh cong");
                }
                case 3:
                {
                    new p_rent = RentJobCar(playerid, JOB_ROADREPAIR, RR_VEHMODEL, RR_VEHCOLOR),
                    Float:_TrunkPos[3];
                    GetVehiclePartPos(p_rent, VEH_PART_TRUNK, _TrunkPos[0], _TrunkPos[1], _TrunkPos[2]);


                    new Text3D:Label_rent;
                    Label_rent = Create3DTextLabel("{ff0000}ALT{ffffff} de lay rao chan", COLOR_RED, 0,0,0, 5.0, 0);
                    Attach3DTextLabelToVehicle(Label_rent, p_rent, _TrunkPos[0], _TrunkPos[1], _TrunkPos[2]);
                    VehRR_Renter[playerid] = p_rent;
                }
            }
        }
    }
    return 1;
}


hook OnPlayerEnterCheckpoint(playerid)
{
    if(RepairPoint[playerid] != 0)
    {
        RepairPoint[playerid] = 0;
        DisablePlayerCheckpoint(playerid);
    }
}