new PlayerText:
MainBankPTD[MAX_PLAYERS][15];
new PlayerText:HomeBankPTD[MAX_PLAYERS][16]; // 5-15
new PlayerText:MenuBankPTD[MAX_PLAYERS][6];
new PlayerText:WithdrawsBankPTD[MAX_PLAYERS][11]; // 6-10
new PlayerText:DepositBankPTD[MAX_PLAYERS][11]; // 6-10
new PlayerText:TransferBankPTD[MAX_PLAYERS][12]; // 5-11
#include <YSI_Coding\y_hooks>
#define      IsOpenMainBanking(%0)        GetPVarInt(%0, #Open_Bank_Main)
#define      IsOpenHomeBanking(%0)        GetPVarInt(%0, #Open_Bank_Home)
#define      IsOpenWithdrawsBanking(%0)        GetPVarInt(%0, #Open_Bank_Withdraws)
#define      IsOpenDepositBanking(%0)        GetPVarInt(%0, #Open_Bank_Deposit)
#define      IsOpenTransferBanking(%0)        GetPVarInt(%0, #Open_Bank_Transfer)


func:CreateMainBankingUI(playerid)
{
    new Home_msg[1280];
    MainBankPTD[playerid][0] = CreatePlayerTextDraw(playerid, 83.000000, 60.000000, "mdl-2020:main_bg");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][0], 463.500000, 344.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][0], 0);

    MainBankPTD[playerid][1] = CreatePlayerTextDraw(playerid, 477.000000, 104.000000, "mdl-2020:x");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][1], 15.000000, 18.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][1], 1);

    MainBankPTD[playerid][2] = CreatePlayerTextDraw(playerid, 138.000000, 198.000000, "mdl-2020:overview");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][2], 91.000000, 35.500000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][2], 1);

    MainBankPTD[playerid][3] = CreatePlayerTextDraw(playerid, 348.000000, 338.000000, "mdl-2020:btn_transfer_saving");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][3], 73.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][3], 1);

    MainBankPTD[playerid][4] = CreatePlayerTextDraw(playerid, 421.000000, 338.000000, "mdl-2020:btn_transfer_bank");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][4], 73.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][4], 1);

    MainBankPTD[playerid][5] = CreatePlayerTextDraw(playerid, 359.000000, 157.000000, "mdl-2020:deposit_100");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][5], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][5], 1);

    MainBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 359.000000, 177.000000, "mdl-2020:deposit_1000");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][6], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][6], 1);

    MainBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 359.000000, 197.000000, "mdl-2020:deposit_5000");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][7], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][7], 1);

    MainBankPTD[playerid][8] = CreatePlayerTextDraw(playerid, 359.000000, 259.000000, "mdl-2020:withdraw_100");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][8], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][8], 1);

    MainBankPTD[playerid][9] = CreatePlayerTextDraw(playerid, 359.000000, 279.000000, "mdl-2020:withdraw_1000");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][9], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][9], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][9], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][9], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][9], 1);

    MainBankPTD[playerid][10] = CreatePlayerTextDraw(playerid, 359.000000, 299.000000, "mdl-2020:withdraw_5000");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][10], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][10], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][10], 128.500000, 21.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][10], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][10], 1);

    MainBankPTD[playerid][11] = CreatePlayerTextDraw(playerid, 266.000000, 331.000000, "mdl-2020:newtransaction");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][11], 4);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][11], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][11], 53.500000, 22.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][11], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][11], 1);

    MainBankPTD[playerid][12] = CreatePlayerTextDraw(playerid, 252.000000, 304.000000, "100.000.000$");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][12], 1);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][12], 0.266665, 1.599998);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][12], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][12], 0);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][12], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][12], 0);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][12], 0);

    format(Home_msg, 1280, "%s$", FormatMoney(Character[playerid][char_Cash]));
    PlayerTextDrawSetString(playerid, MainBankPTD[playerid][12], Home_msg);

    MainBankPTD[playerid][13] = CreatePlayerTextDraw(playerid, 252.000000, 276.000000, "100.000.000$");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][13], 1);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][13], 0.266665, 1.599998);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][13], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][13], 0);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][13], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][13], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][13], 0);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][13], 0);

    format(Home_msg, 1280, "%s$", FormatMoney(Character[playerid][char_Bank]));
    PlayerTextDrawSetString(playerid, MainBankPTD[playerid][13], Home_msg);


    MainBankPTD[playerid][14] = CreatePlayerTextDraw(playerid, 164.000000, 166.000000, "Charles_Walter");
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][14], 1);
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][14], 0.237498, 1.349998);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][14], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][14], 0);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][14], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][14], -1);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, MainBankPTD[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, MainBankPTD[playerid][14], 0);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][14], 0);
    format(Home_msg, 1280, "%s", player_get_name(playerid));
    PlayerTextDrawSetString(playerid, MainBankPTD[playerid][14], Home_msg);

    return 1;
}
func:CreatePageTransactionBankingUI(playerid)
{
    MenuBankPTD[playerid][0] = CreatePlayerTextDraw(playerid, 0.000000, 0.000000, "mdl-2021:bg_tab");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][0], 640.000000, 447.500000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][0], 0);

    MenuBankPTD[playerid][1] = CreatePlayerTextDraw(playerid, 234.000000, 159.000000, "mdl-2021:main_transaction");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][1], 167.000000, 132.000000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][1], 0);

    MenuBankPTD[playerid][2] = CreatePlayerTextDraw(playerid, 242.000000, 165.000000, "mdl-2021:back");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][2], 42.000000, 20.500000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][2], 1);

    MenuBankPTD[playerid][3] = CreatePlayerTextDraw(playerid, 264.000000, 218.000000, "mdl-2021:enter_withdraws");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][3], 110.000000, 30.500000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][3], 1);

    MenuBankPTD[playerid][4] = CreatePlayerTextDraw(playerid, 264.000000, 189.000000, "mdl-2021:enter_deposit");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][4], 110.000000, 30.500000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][4], 1);

    MenuBankPTD[playerid][5] = CreatePlayerTextDraw(playerid, 264.000000, 248.000000, "mdl-2021:enter_transfer");
    PlayerTextDrawFont(playerid, MenuBankPTD[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, MenuBankPTD[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, MenuBankPTD[playerid][5], 110.000000, 30.500000);
    PlayerTextDrawSetOutline(playerid, MenuBankPTD[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, MenuBankPTD[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, MenuBankPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, MenuBankPTD[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, MenuBankPTD[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, MenuBankPTD[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, MenuBankPTD[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, MenuBankPTD[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, MenuBankPTD[playerid][5], 1);

    return 1;
}

func:CreatePageWithdrawsBankingUI(playerid)
{

    WithdrawsBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 259.000, 128.000, "mdl-2016:withdraws");
    PlayerTextDrawTextSize(playerid, WithdrawsBankPTD[playerid][6], 230.000, 140.000);
    PlayerTextDrawAlignment(playerid, WithdrawsBankPTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, WithdrawsBankPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, WithdrawsBankPTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, WithdrawsBankPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, WithdrawsBankPTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, WithdrawsBankPTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, WithdrawsBankPTD[playerid][6], 1);

    WithdrawsBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 305.000, 295.000, "mdl-2016:Btn_withdraws_system");
    PlayerTextDrawTextSize(playerid, WithdrawsBankPTD[playerid][7], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, WithdrawsBankPTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, WithdrawsBankPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, WithdrawsBankPTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, WithdrawsBankPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, WithdrawsBankPTD[playerid][7], 255);
    PlayerTextDrawFont(playerid, WithdrawsBankPTD[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, WithdrawsBankPTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, WithdrawsBankPTD[playerid][7], 1);

    WithdrawsBankPTD[playerid][8] = CreatePlayerTextDraw(playerid, 305.000, 313.000, "mdl-2016:Btn_c");
    PlayerTextDrawTextSize(playerid, WithdrawsBankPTD[playerid][8], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, WithdrawsBankPTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, WithdrawsBankPTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, WithdrawsBankPTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, WithdrawsBankPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, WithdrawsBankPTD[playerid][8], 255);
    PlayerTextDrawFont(playerid, WithdrawsBankPTD[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, WithdrawsBankPTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, WithdrawsBankPTD[playerid][8], 1);

    WithdrawsBankPTD[playerid][9] = CreatePlayerTextDraw(playerid, 305.000, 209.000, "Nhap so tien"); // amount
    PlayerTextDrawLetterSize(playerid, WithdrawsBankPTD[playerid][9], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, WithdrawsBankPTD[playerid][9], 488.000, 10.000);
    PlayerTextDrawAlignment(playerid, WithdrawsBankPTD[playerid][9], 1);
    PlayerTextDrawColor(playerid, WithdrawsBankPTD[playerid][9], 255);
    PlayerTextDrawSetShadow(playerid, WithdrawsBankPTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, WithdrawsBankPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, WithdrawsBankPTD[playerid][9], 150);
    PlayerTextDrawFont(playerid, WithdrawsBankPTD[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, WithdrawsBankPTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, WithdrawsBankPTD[playerid][9], 1);

    WithdrawsBankPTD[playerid][10] = CreatePlayerTextDraw(playerid, 307.000, 250.000, "xxxxxx");
    PlayerTextDrawLetterSize(playerid, WithdrawsBankPTD[playerid][10], 0.300, 1.498);
    PlayerTextDrawTextSize(playerid, WithdrawsBankPTD[playerid][10], 332.000, 15.000);
    PlayerTextDrawAlignment(playerid, WithdrawsBankPTD[playerid][10], 1);
    PlayerTextDrawColor(playerid, WithdrawsBankPTD[playerid][10], 255);
    PlayerTextDrawSetShadow(playerid, WithdrawsBankPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, WithdrawsBankPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, WithdrawsBankPTD[playerid][10], 150);
    PlayerTextDrawFont(playerid, WithdrawsBankPTD[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, WithdrawsBankPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, WithdrawsBankPTD[playerid][10], 1);

}

func:CreatePageDepositBankingUI(playerid)
{

    DepositBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 259.000, 128.000, "mdl-2016:Deposit");
    PlayerTextDrawTextSize(playerid, DepositBankPTD[playerid][6], 230.000, 140.000);
    PlayerTextDrawAlignment(playerid, DepositBankPTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, DepositBankPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, DepositBankPTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, DepositBankPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, DepositBankPTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, DepositBankPTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, DepositBankPTD[playerid][6], 1);

    DepositBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 305.000, 295.000, "mdl-2016:Btn_deposit_system");
    PlayerTextDrawTextSize(playerid, DepositBankPTD[playerid][7], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, DepositBankPTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, DepositBankPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, DepositBankPTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, DepositBankPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, DepositBankPTD[playerid][7], 255);
    PlayerTextDrawFont(playerid, DepositBankPTD[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, DepositBankPTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, DepositBankPTD[playerid][7], 1);

    DepositBankPTD[playerid][8] = CreatePlayerTextDraw(playerid, 305.000, 313.000, "mdl-2016:Btn_c");
    PlayerTextDrawTextSize(playerid, DepositBankPTD[playerid][8], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, DepositBankPTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, DepositBankPTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, DepositBankPTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, DepositBankPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, DepositBankPTD[playerid][8], 255);
    PlayerTextDrawFont(playerid, DepositBankPTD[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, DepositBankPTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, DepositBankPTD[playerid][8], 1);

    DepositBankPTD[playerid][9] = CreatePlayerTextDraw(playerid, 305.000, 209.000, "Nhap so tien"); // amount
    PlayerTextDrawLetterSize(playerid, DepositBankPTD[playerid][9], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, DepositBankPTD[playerid][9], 488.000, 10.000);
    PlayerTextDrawAlignment(playerid, DepositBankPTD[playerid][9], 1);
    PlayerTextDrawColor(playerid, DepositBankPTD[playerid][9], 255);
    PlayerTextDrawSetShadow(playerid, DepositBankPTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, DepositBankPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, DepositBankPTD[playerid][9], 150);
    PlayerTextDrawFont(playerid, DepositBankPTD[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, DepositBankPTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, DepositBankPTD[playerid][9], 1);

    DepositBankPTD[playerid][10] = CreatePlayerTextDraw(playerid, 307.000, 250.000, "xxxxxx");
    PlayerTextDrawLetterSize(playerid, DepositBankPTD[playerid][10], 0.300, 1.498);
    PlayerTextDrawTextSize(playerid, DepositBankPTD[playerid][10], 332.000, 15.000);
    PlayerTextDrawAlignment(playerid, DepositBankPTD[playerid][10], 1);
    PlayerTextDrawColor(playerid, DepositBankPTD[playerid][10], 255);
    PlayerTextDrawSetShadow(playerid, DepositBankPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, DepositBankPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, DepositBankPTD[playerid][10], 150);
    PlayerTextDrawFont(playerid, DepositBankPTD[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, DepositBankPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, DepositBankPTD[playerid][10], 1);
}

func:CreatePageTransferBankingUI(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Transfer, 1);
    TransferBankPTD[playerid][5] = CreatePlayerTextDraw(playerid, 259.000, 134.000, "mdl-2016:transfer");
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][5], 230.000, 140.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][5], 1);

    TransferBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 305.000, 295.000, "mdl-2016:Btn_transfer_system");
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][6], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, TransferBankPTD[playerid][6], 1);

    TransferBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 305.000, 313.000, "mdl-2016:Btn_c");
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][7], 140.000, 14.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][7], 255);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, TransferBankPTD[playerid][7], 1);

    TransferBankPTD[playerid][8] = CreatePlayerTextDraw(playerid, 305.000, 209.000, "Nhap so tien");
    PlayerTextDrawLetterSize(playerid, TransferBankPTD[playerid][8], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][8], 488.000, 10.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][8], 255);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][8], 150);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, TransferBankPTD[playerid][8], 1);

    TransferBankPTD[playerid][9] = CreatePlayerTextDraw(playerid, 305.000, 256.000, "xxxxxx");
    PlayerTextDrawLetterSize(playerid, TransferBankPTD[playerid][9], 0.300, 1.498);
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][9], 332.000, 15.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][9], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][9], 255);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][9], 150);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, TransferBankPTD[playerid][9], 1);

    TransferBankPTD[playerid][10] = CreatePlayerTextDraw(playerid, 296.000, 231.000, "Time");
    PlayerTextDrawLetterSize(playerid, TransferBankPTD[playerid][10], 0.270, 1.399);
    PlayerTextDrawTextSize(playerid, TransferBankPTD[playerid][10], 342.000, 15.000);
    PlayerTextDrawAlignment(playerid, TransferBankPTD[playerid][10], 1);
    PlayerTextDrawColor(playerid, TransferBankPTD[playerid][10], 255);
    PlayerTextDrawSetShadow(playerid, TransferBankPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, TransferBankPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, TransferBankPTD[playerid][10], 150);
    PlayerTextDrawFont(playerid, TransferBankPTD[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, TransferBankPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, TransferBankPTD[playerid][10], 1);
}
hook OnPlayerConnect(playerid)
{
    CreateMainBankingUI(playerid);
    CreatePageTransactionBankingUI(playerid);
    CreatePageWithdrawsBankingUI(playerid);
    CreatePageDepositBankingUI(playerid);
    CreatePageTransferBankingUI(playerid);

    DestroyPageMainBanking(playerid);
    DestroyPageTransactionBanking(playerid);
    DestroyPageWithdrawsBanking(playerid);
    DestroyPageDepositBanking(playerid);
    DestroyPageTransferBanking(playerid);
}
func:CreateMainBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Main, 1);
    for (new i; i < 15; i++) PlayerTextDrawShow(playerid, MainBankPTD[playerid][i]);
}

func:CreatePageTransactionBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Home, 1);
    for (new i = 0; i < 6; i++) PlayerTextDrawShow(playerid, MenuBankPTD[playerid][i]);
}

func:CreatePageWithdrawsBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Withdraws, 1);
    for (new i = 6; i < 11; i++) PlayerTextDrawShow(playerid, WithdrawsBankPTD[playerid][i]);
}

func:CreatePageDepositBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Deposit, 1);
    for (new i = 6; i < 11; i++) PlayerTextDrawShow(playerid, DepositBankPTD[playerid][i]);
}

func:CreatePageTransferBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Transfer, 1);
    for (new i = 5; i < 11; i++) PlayerTextDrawShow(playerid, TransferBankPTD[playerid][i]);
}
func:DestroyAllBanking(playerid)
{
    DestroyPageMainBanking(playerid);
    DestroyPageTransactionBanking(playerid);
    DestroyPageWithdrawsBanking(playerid);
    DestroyPageDepositBanking(playerid);
}
func:DestroyPageMainBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Main, 0);
    for (new i = 0; i < 15; i++) PlayerTextDrawHide(playerid, MainBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageTransactionBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Home, 0);
    for (new i = 0; i < 6; i++) PlayerTextDrawHide(playerid, MenuBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageWithdrawsBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Withdraws, 0);
    for (new i = 6; i < 11; i++) PlayerTextDrawHide(playerid, WithdrawsBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageDepositBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Deposit, 0);
    for (new i = 6; i < 11; i++) PlayerTextDrawHide(playerid, DepositBankPTD[playerid][i]);
    return 1;
}
func:OpenBanking(playerid)
{
    if (IsOpenMainBanking(playerid))
    {

        DestroyPageMainBanking(playerid);
        DestroyPageTransactionBanking(playerid);
        DestroyPageWithdrawsBanking(playerid);
        DestroyPageDepositBanking(playerid);
        DestroyPageTransferBanking(playerid);
    }
    CreateMainBanking(playerid);
    return 1;
}
func:ReloadBanking(playerid)
{
    DestroyPageMainBanking(playerid);
    DestroyPageTransactionBanking(playerid);
    DestroyPageWithdrawsBanking(playerid);
    DestroyPageDepositBanking(playerid);
    DestroyPageTransferBanking(playerid);

    switch (GetPVarInt(playerid, #Open_Page_))
    {
        case 1: CreatePageTransactionBanking(playerid);
        case 2: CreatePageWithdrawsBanking(playerid);
        case 3: CreatePageDepositBanking(playerid);
        case 4: CreatePageTransferBanking(playerid);
        default:
            CreateMainBanking(playerid);
    }
    return 1;
}
func:DestroyPageTransferBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Transfer, 0);
    for (new i = 5; i < 11; i++) PlayerTextDrawHide(playerid, TransferBankPTD[playerid][i]);
    return 1;
}

CMD:banking(playerid, params[])
{
    OpenBanking(playerid);
    SelectTextDraw(playerid, 0xFF00FF);
    return 1;
}