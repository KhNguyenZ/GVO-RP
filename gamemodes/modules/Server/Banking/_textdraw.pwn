new PlayerText: MainBankPTD[MAX_PLAYERS][8];
new PlayerText:HomeBankPTD[MAX_PLAYERS][16]; // 5-15
new PlayerText:WithdrawsBankPTD[MAX_PLAYERS][11]; // 6-10
new PlayerText:DepositBankPTD[MAX_PLAYERS][11]; // 6-10
new PlayerText:TransferBankPTD[MAX_PLAYERS][12]; // 5-11

#define      IsOpenMainBanking(%0)        GetPVarInt(%0, #Open_Bank_Main)
#define      IsOpenHomeBanking(%0)        GetPVarInt(%0, #Open_Bank_Home)
#define      IsOpenWithdrawsBanking(%0)        GetPVarInt(%0, #Open_Bank_Withdraws)
#define      IsOpenDepositBanking(%0)        GetPVarInt(%0, #Open_Bank_Deposit)
#define      IsOpenTransferBanking(%0)        GetPVarInt(%0, #Open_Bank_Transfer)


func:CreateMainBanking(playerid){
    SetPVarInt(playerid, #Open_Bank_Main, 1);

    MainBankPTD[playerid][0] = CreatePlayerTextDraw(playerid, 71.000, 28.000, "mdl-2016:bg_bank");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][0], 518.000, 440.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][0], 1);

    MainBankPTD[playerid][1] = CreatePlayerTextDraw(playerid, 156.000, 176.000, "mdl-2016:btn_hone");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][1], 73.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][1], 1);

    MainBankPTD[playerid][2] = CreatePlayerTextDraw(playerid, 156.000, 219.000, "mdl-2016:btn_withdraw");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][2], 73.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][2], 1);

    MainBankPTD[playerid][3] = CreatePlayerTextDraw(playerid, 156.000, 260.000, "mdl-2016:btn_deposit");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][3], 73.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][3], 1);

    MainBankPTD[playerid][4] = CreatePlayerTextDraw(playerid, 156.000, 302.000, "mdl-2016:btn_trans");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][4], 73.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][4], 1);

    MainBankPTD[playerid][5] = CreatePlayerTextDraw(playerid, 264.000, 360.000, "");
    PlayerTextDrawLetterSize(playerid, MainBankPTD[playerid][5], 0.250, 1.498);
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][5], 350.000, 15.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][5], -741092353);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][5], -741092353);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][5], 1);

    new main_msg[1280];
    format(main_msg, 1280, "Quy tiet kiem: $%s", FormatMoney(Character[playerid][char_BankSaving]));
    PlayerTextDrawSetString(playerid, MainBankPTD[playerid][5], main_msg);

    MainBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 290.000, 376.000, "mdl-2016:active");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][6], 09.000, 9.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][6], 1);

    MainBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 494.000, 112.000, "mdl-2016:x");
    PlayerTextDrawTextSize(playerid, MainBankPTD[playerid][7], 7.000, 9.000);
    PlayerTextDrawAlignment(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, MainBankPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, MainBankPTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, MainBankPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, MainBankPTD[playerid][7], 255);
    PlayerTextDrawFont(playerid, MainBankPTD[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, MainBankPTD[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, MainBankPTD[playerid][7], 1);

    for(new i; i < 8; i++) PlayerTextDrawShow(playerid, MainBankPTD[playerid][i]);
    return 1;
}
func:CreatePageHomeBanking(playerid)
{
    new Home_msg[1280];
    SetPVarInt(playerid, #Open_Bank_Home, 1);
    HomeBankPTD[playerid][5] = CreatePlayerTextDraw(playerid, 257.000, 138.000, "mdl-2016:home");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][5], 196.000, 91.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][5], 1);

    HomeBankPTD[playerid][6] = CreatePlayerTextDraw(playerid, 299.000, 170.000, "$1.000.000.000");
    PlayerTextDrawLetterSize(playerid, HomeBankPTD[playerid][6], 0.368, 2.299);
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][6], 6.000, 89.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][6], 2);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][6], 2);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][6], 1);

    format(Home_msg, 1280, "$%s", FormatMoney(Character[playerid][char_Cash]));
    PlayerTextDrawSetString(playerid, HomeBankPTD[playerid][6], Home_msg);

    HomeBankPTD[playerid][7] = CreatePlayerTextDraw(playerid, 421.000, 170.000, "$1.000.000.000");
    PlayerTextDrawLetterSize(playerid, HomeBankPTD[playerid][7], 0.368, 2.299);
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][7], 6.000, 89.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][7], 2);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][7], 1);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][7], 150);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][7], 2);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][7], 1);

    format(Home_msg, 1280, "$%s", FormatMoney(Character[playerid][char_Bank]));
    PlayerTextDrawSetString(playerid, HomeBankPTD[playerid][7], Home_msg);

    HomeBankPTD[playerid][8] = CreatePlayerTextDraw(playerid, 259.000, 241.000, "mdl-2016:withdraw_100");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][8], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][8], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][8], 1);

    HomeBankPTD[playerid][9] = CreatePlayerTextDraw(playerid, 341.000, 241.000, "mdl-2016:withdraw_1000");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][9], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][9], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][9], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][9], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][9], 1);

    HomeBankPTD[playerid][10] = CreatePlayerTextDraw(playerid, 422.000, 241.000, "mdl-2016:withdraw_5000");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][10], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][10], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][10], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][10], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][10], 1);

    HomeBankPTD[playerid][11] = CreatePlayerTextDraw(playerid, 259.000, 267.000, "mdl-2016:deposit_100");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][11], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][11], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][11], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][11], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][11], 1);

    HomeBankPTD[playerid][12] = CreatePlayerTextDraw(playerid, 341.000, 267.000, "mdl-2016:deposit_1000");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][12], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][12], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][12], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][12], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][12], 1);

    HomeBankPTD[playerid][13] = CreatePlayerTextDraw(playerid, 422.000, 267.000, "mdl-2016:deposit_5000");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][13], 69.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][13], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][13], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][13], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][13], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][13], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][13], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][13], 1);

    HomeBankPTD[playerid][14] = CreatePlayerTextDraw(playerid, 254.000, 293.000, "mdl-2016:btn_Transfer_home");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][14], 120.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][14], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][14], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][14], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][14], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][14], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][14], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][14], 1);

    HomeBankPTD[playerid][15] = CreatePlayerTextDraw(playerid, 377.000, 293.000, "mdl-2016:btn_Transfer_home1");
    PlayerTextDrawTextSize(playerid, HomeBankPTD[playerid][15], 123.000, 18.000);
    PlayerTextDrawAlignment(playerid, HomeBankPTD[playerid][15], 1);
    PlayerTextDrawColor(playerid, HomeBankPTD[playerid][15], -1);
    PlayerTextDrawSetShadow(playerid, HomeBankPTD[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, HomeBankPTD[playerid][15], 0);
    PlayerTextDrawBackgroundColor(playerid, HomeBankPTD[playerid][15], 255);
    PlayerTextDrawFont(playerid, HomeBankPTD[playerid][15], 4);
    PlayerTextDrawSetProportional(playerid, HomeBankPTD[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, HomeBankPTD[playerid][15], 1);

    for(new i = 5; i < 16; i++) PlayerTextDrawShow(playerid, HomeBankPTD[playerid][i]);
}

func:CreatePageWithdrawsBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Withdraws, 1);
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

    for(new i = 6; i < 11; i++) PlayerTextDrawShow(playerid, WithdrawsBankPTD[playerid][i]);
}

func:CreatePageDepositBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Deposit, 1);
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
    for(new i = 6; i < 11; i++) PlayerTextDrawShow(playerid, DepositBankPTD[playerid][i]);
}

func:CreatePageTransferBanking(playerid)
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
    for(new i = 5; i < 11; i++) PlayerTextDrawShow(playerid, TransferBankPTD[playerid][i]);
}
func:DestroyPageMainBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Main, 0);
    for(new i = 0; i < 8; i++) PlayerTextDrawDestroy(playerid, MainBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageHomeBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Home, 0);
    for(new i = 5; i < 16; i++) PlayerTextDrawDestroy(playerid, HomeBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageWithdrawsBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Withdraws, 0);
    for(new i = 6; i < 11; i++) PlayerTextDrawDestroy(playerid, WithdrawsBankPTD[playerid][i]);
    return 1;
}
func:DestroyPageDepositBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Deposit, 0);
    for(new i = 6; i < 11; i++) PlayerTextDrawDestroy(playerid, DepositBankPTD[playerid][i]);
    return 1;
}
func:OpenBanking(playerid)
{
    if(IsOpenMainBanking(playerid)) {

        DestroyPageMainBanking(playerid);
        DestroyPageHomeBanking(playerid);
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
    DestroyPageHomeBanking(playerid);
    DestroyPageWithdrawsBanking(playerid);
    DestroyPageDepositBanking(playerid);
    DestroyPageTransferBanking(playerid);

    CreateMainBanking(playerid);
    switch(GetPVarInt(playerid, #Open_Page_))
    {
        case 1: CreatePageHomeBanking(playerid);
        case 2: CreatePageWithdrawsBanking(playerid);
        case 3: CreatePageDepositBanking(playerid);
        case 4: CreatePageTransferBanking(playerid);
        default: CreatePageHomeBanking(playerid);
    }
    return 1;
}
func:DestroyPageTransferBanking(playerid)
{
    SetPVarInt(playerid, #Open_Bank_Transfer, 0);
    for(new i = 5; i < 11; i++) PlayerTextDrawDestroy(playerid, TransferBankPTD[playerid][i]);
    return 1;
}

CMD:banking(playerid, params[])
{
    OpenBanking(playerid);
    SelectTextDraw(playerid, 0xFF00FF);
    return 1;
}