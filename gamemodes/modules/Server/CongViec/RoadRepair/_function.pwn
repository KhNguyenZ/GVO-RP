// id veh 552
// 
// GetPosNearVehiclePart
#define IsPlayerRoadRepair(%0) (Character[%0][char_Job] == JOB_ROADREPAIR)
func:StartRoadRepair(playerid)
{
    new dm_point = RandomEx(0,sizeof(DamagePoint));
    SetPlayerCheckpoint(playerid, DamagePoint[dm_point][0], DamagePoint[dm_point][1], DamagePoint[dm_point][2]);
    RepairPoint[playerid] = dm_point;
}

func:ShowDialogCade(playerid)
{
    if (!IsPlayerRoadRepair(playerid)) return SendErrorMessage(playerid, "Ban khong phai nhan vien !");
    new dlg_cade[50 * sizeof(Cade_Var)];
    for (new i; i < sizeof(Cade_Var); i++)
    {
        new subcade[100];
        format(subcade, 100, "%d\tCade %d\n", Cade_Var[i], i + 1);
        strcat(dlg_cade, subcade);
    }
    strcat(dlg_cade, "-1\tEND");
    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_PREVIEW_MODEL, "Cade for Road Repair Job", dlg_cade, "Chon", "Huy");
}