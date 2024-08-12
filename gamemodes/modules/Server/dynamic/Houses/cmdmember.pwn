#include <a_samp>
#include <YSI\YSI_Coding\y_hooks>

#define DIALOG_HOUSE 1

public OnPlayerEnterCheckpoint(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1500.0, 1500.0, 10.0)) // Kiểm tra xem người chơi có gần NPC không
    {
        new houseList[1024];
        new tempStr[128];
        
        for (new i = 0; i < MAX_DYNAMIC_HOUSES; i++)
        {
            if (IsHouseCreated(i) && HouseInfo[i][house_ownerid] == -1) // Nếu nhà đã tạo và chưa có chủ
            {
                format(tempStr, sizeof(tempStr), "Nhà %d (Giá: $%d)\n", i+1, HouseInfo[i][house_pickup]);
                strcat(houseList, tempStr);
            }
        }
        
        ShowPlayerDialog(playerid, DIALOG_HOUSE, DIALOG_STYLE_LIST, "Danh Sách Nhà", houseList, "Chọn", "Thoát");
    }
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_HOUSE && response)
    {
        if (IsHouseCreated(listitem) && HouseInfo[listitem][house_ownerid] == -1) // Kiểm tra nhà có trống không
        {
            if(GetPlayerMoney(playerid) >= HouseInfo[listitem][house_pickup]) // Kiểm tra số tiền
            {
                GivePlayerMoney(playerid, -HouseInfo[listitem][house_pickup]);
                HouseInfo[listitem][house_ownerid] = playerid;
                SendClientMessage(playerid, COLOR_GREEN, "Bạn đã mua nhà thành công!");
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "Bạn không đủ tiền để mua nhà này.");
            }
        }
        else
        {
            SendClientMessage(playerid, COLOR_RED, "Nhà này đã có chủ hoặc không hợp lệ.");
        }
    }
}
