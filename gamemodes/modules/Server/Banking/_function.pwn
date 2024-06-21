#include <YSI_Coding\y_hooks>

func:DepositPlayer(playerid, cash_amount)
{
    if(Character[playerid][char_Cash] < cash_amount) return 0;

    Character[playerid][char_Bank] += cash_amount;
    Character[playerid][char_Cash] -= cash_amount;
    return 1;
}
func:WithdrawsPlayer(playerid, cash_amount)
{
    if(Character[playerid][char_Bank] < cash_amount) return 0;

    Character[playerid][char_Bank] -= cash_amount;
    Character[playerid][char_Cash] += cash_amount;
    return 1;
}
func:BankToTransferPlayer(playerid, cash_amount)
{
    if(Character[playerid][char_Cash] < cash_amount) return 0;

    Character[playerid][char_BankSaving] += cash_amount;
    Character[playerid][char_Cash] -= cash_amount;
    return 1;
}
func:TransferToBankPlayer(playerid, cash_amount)
{
    if(Character[playerid][char_BankSaving] < cash_amount) return 0;

    Character[playerid][char_BankSaving] -= cash_amount;
    Character[playerid][char_Cash] += cash_amount;
    return 1;
}
func:SendLogBank(playerid,famount, ftype = 0)
{
    new logb_disc[1280];
    if(ftype == 0) format(logb_disc, 1280, "[%s] vừa gửi %s vào SSA-Bank", player_get_name(playerid), FormatMoney(famount));
    else if(ftype == 1)format(logb_disc, 1280, "[%s] vừa rút %s từ SSA-Bank", player_get_name(playerid), FormatMoney(famount));
    else if(ftype == 3)format(logb_disc, 1280, "[%s] vừa gửi %s vào sổ tiết kiệm SSA-Bank", player_get_name(playerid), FormatMoney(famount));
    else if(ftype == 4)format(logb_disc, 1280, "[%s] vừa rút %s từ sổ tiết kiệm SSA-Bank", player_get_name(playerid), FormatMoney(famount));
    else format(logb_disc, 1280, "[%s] vừa thao tác %s tại SSA-Bank (GIAO DỊCH KHÔNG XÁC ĐỊNH)", player_get_name(playerid), FormatMoney(famount));

    DISCORD_SendEmbedMsg(LogBank, "Lịch sử giao dịch SSA-Bank", logb_disc);
    printf("Content: %s",logb_disc);
    return 1;
}
func:BankingClick(playerid, PlayerText:playertextid)
{
    if(playertextid == MainBankPTD[playerid][2]) // home
    {
        SetPVarInt(playerid, #Open_Page_, 0);

        if(IsOpenHomeBanking(playerid)) return DestroyPageMainBanking(playerid);

        if(IsOpenWithdrawsBanking(playerid)) DestroyPageWithdrawsBanking(playerid);
        if(IsOpenDepositBanking(playerid)) DestroyPageDepositBanking(playerid);
        if(IsOpenTransferBanking(playerid)) DestroyPageTransferBanking(playerid);

        CreateMainBanking(playerid);
    }
    if(playertextid == MainBankPTD[playerid][11]) // Transaction
    {
        SetPVarInt(playerid, #Open_Page_, 1);
        if(IsOpenWithdrawsBanking(playerid)) return DestroyPageWithdrawsBanking(playerid);
        if(IsOpenHomeBanking(playerid)) DestroyPageMainBanking(playerid);
        if(IsOpenDepositBanking(playerid)) DestroyPageDepositBanking(playerid);
        if(IsOpenTransferBanking(playerid)) DestroyPageTransferBanking(playerid);
        DestroyPageMainBanking(playerid);
        CreatePageTransactionBanking(playerid);
    }
    MenuBankClick(playerid, PlayerText:playertextid);
    HomeBankingClick(playerid, PlayerText:playertextid);
    WithdrawsBankingClick(playerid, PlayerText:playertextid);
    DepositBankingClick(playerid, PlayerText:playertextid);
    if(playertextid == MainBankPTD[playerid][1])
    {
        DestroyAllBanking(playerid);
    }
    return 1;
}

#define SendBankMsg(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{2175b5}NGAN HANG:{FFFFFF}"%1)

func:MenuBankClick(playerid, PlayerText:playertextid)
{
    if(playertextid == MenuBankPTD[playerid][2])
    {
        SetPVarInt(playerid, #Open_Page_, 0);
        DestroyPageMainBanking(playerid);
        DestroyPageTransactionBanking(playerid);
        DestroyPageWithdrawsBanking(playerid);
        DestroyPageDepositBanking(playerid);
        DestroyPageTransferBanking(playerid);
        CreateMainBanking(playerid);
    }
    if(playertextid == MenuBankPTD[playerid][3]) // withdraws
    {
        SetPVarInt(playerid, #Open_Page_, 2);
        DestroyPageMainBanking(playerid);
        DestroyPageTransactionBanking(playerid);
        CreatePageWithdrawsBanking(playerid);
    }
    if(playertextid == MenuBankPTD[playerid][4]) // deposit
    {
        SetPVarInt(playerid, #Open_Page_, 3);
        DestroyPageMainBanking(playerid);
        DestroyPageTransactionBanking(playerid);
        CreatePageDepositBanking(playerid);
    }
    if(playertextid == MenuBankPTD[playerid][5]) // transfer
    {
        SetPVarInt(playerid, #Open_Page_, 4);
        DestroyPageMainBanking(playerid);
        DestroyPageTransactionBanking(playerid);
        CreatePageTransferBanking(playerid);
    }
}
func:HomeBankingClick(playerid, PlayerText:playertextid)
{
        if(playertextid == MainBankPTD[playerid][8]) // WITHDRAWS 100
        {
            if(WithdrawsPlayer(playerid, 100)) {
                SendBankMsg(playerid, "Ban da rut $100 ra khoi tai khoan ngan hang");
                SendLogBank(playerid, 100, 1);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][9]) // WITHDRAWS 1000
        {
            if(WithdrawsPlayer(playerid, 1000)) {
                SendBankMsg(playerid, "Ban da rut $1000 ra khoi tai khoan ngan hang");
                SendLogBank(playerid, 1000, 1);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][10]) // WITHDRAWS 5000
        {
            if(WithdrawsPlayer(playerid, 5000)) {
                SendBankMsg(playerid, "Ban da rut $5000 ra khoi tai khoan ngan hang");
                SendLogBank(playerid, 5000, 1);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][5]) // DEPOSIT 100
        {
            if(DepositPlayer(playerid, 100)) {
                SendBankMsg(playerid, "Ban da gui $100 vao tai khoan ngan hang");
                SendLogBank(playerid, 100, 0);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][6]) // DEPOSIT 1000
        {
            if(DepositPlayer(playerid, 1000)) {
                SendBankMsg(playerid, "Ban da gui $1000 vao tai khoan ngan hang");
                SendLogBank(playerid, 1000, 0);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][7]) // DEPOSIT 5000
        {
            if(DepositPlayer(playerid, 5000)) 
            {
                SendBankMsg(playerid, "Ban da gui $5000 vao tai khoan ngan hang");
                SendLogBank(playerid, 5000, 0);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][3]) // TRANSFER 1000
        {
            if(BankToTransferPlayer(playerid, 1000)) {
                SendBankMsg(playerid, "Ban da gui $5000 vao so tiet kiem");
                SendLogBank(playerid, 1000, 3);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du $1000 trong tai khoan khong du !");
        }
        if(playertextid == MainBankPTD[playerid][4]) // TRANSFER 5000
        {
            if(TransferToBankPlayer(playerid, 1000))  {
                SendBankMsg(playerid, "Ban da rut $5000 ra khoi so tiet kiem");
                SendLogBank(playerid, 1000, 4);
                SetPVarInt(playerid, #Open_Page_, 0);
                ReloadBanking(playerid);
            }
            else SendErrorMessage(playerid, "So du $1000 trong tai khoan khong du !");
        }
        return 1;
}

func:WithdrawsBankingClick(playerid, PlayerText:playertextid)
{
    if(GetPVarInt(playerid, #Open_Page_) == 2)
    {
        
        if(playertextid == WithdrawsBankPTD[playerid][4])
        {
            ShowPlayerDialog(playerid, 5003, DIALOG_STYLE_INPUT, "Rut tien", "Nhap so tien", ">>", "<<");
        }
        if(playertextid == WithdrawsBankPTD[playerid][5])
        {
            ShowPlayerDialog(playerid, 5002, DIALOG_STYLE_INPUT, "Rut tien", "Ma OTP", ">>", "<<");
        }
        if(playertextid == WithdrawsBankPTD[playerid][3])
        {
            if(GetPVarInt(playerid, #Banking_OTP) <= 0) return SendErrorMessage(playerid, "Yeu cau OTP !!!");
            if(GetPVarInt(playerid, #Banking_Amount) <= 0) return SendErrorMessage(playerid, "Yeu cau nhap so tien can rut !!!");
            if(Character[playerid][char_OTP] != GetPVarInt(playerid, #Banking_OTP)) return SendErrorMessage(playerid, "Ma OTP khong hop le");
            if(Character[playerid][char_Bank] < GetPVarInt(playerid, #Banking_Amount)) return SendErrorMessage(playerid,"So du trong tai khoan khong du de thuc hien !");
            new wd_msg[1280];
            format(wd_msg, 1280, "Ban da rut thanh cong $%s ra khoi tai khoan ngan hang", FormatMoney(GetPVarInt(playerid, #Banking_Amount)));
            SendLogBank(playerid, GetPVarInt(playerid, #Banking_Amount), 1);
            SendClientMessage(playerid,-1, wd_msg);
            WithdrawsPlayer(playerid, GetPVarInt(playerid, #Banking_Amount));

            DeletePVar(playerid, #Banking_Amount);
            DeletePVar(playerid, #Banking_OTP);
        }
    }
    return 1;
}
func:DepositBankingClick(playerid, PlayerText:playertextid)
{
    if(GetPVarInt(playerid, #Open_Page_) == 3)
    {
        
        if(playertextid == DepositBankPTD[playerid][4])
        {
            ShowPlayerDialog(playerid, 5005, DIALOG_STYLE_INPUT, "Rut tien", "Nhap so tien", ">>", "<<");
        }
        if(playertextid == DepositBankPTD[playerid][5])
        {
            ShowPlayerDialog(playerid, 5004, DIALOG_STYLE_INPUT, "Rut tien", "Ma OTP", ">>", "<<");
        }
        if(playertextid == DepositBankPTD[playerid][3])
        {
            if(GetPVarInt(playerid, #Banking_OTP) <= 0) return SendErrorMessage(playerid, "Yeu cau OTP !!!");
            if(GetPVarInt(playerid, #Banking_Amount) <= 0) return SendErrorMessage(playerid, "Yeu cau nhap so tien can rut !!!");
            if(Character[playerid][char_OTP] != GetPVarInt(playerid, #Banking_OTP)) return SendErrorMessage(playerid, "Ma OTP khong hop le");
            if(Character[playerid][char_Bank] < GetPVarInt(playerid, #Banking_Amount)) return SendErrorMessage(playerid,"So du trong tai khoan khong du de thuc hien !");
            new wd_msg[1280];
            format(wd_msg, 1280, "Ban da gui thanh cong $%s vao tai khoan ngan hang", FormatMoney(GetPVarInt(playerid, #Banking_Amount)));
            SendLogBank(playerid, GetPVarInt(playerid, #Banking_Amount), 1);
            SendClientMessage(playerid,-1, wd_msg);
            DepositPlayer(playerid, GetPVarInt(playerid, #Banking_Amount));

            DeletePVar(playerid, #Banking_Amount);
            DeletePVar(playerid, #Banking_OTP);
        }
    }
    return 1;
}
func:TransferBankingClick(playerid, PlayerText:playertextid)
{
    if(playertextid == TransferBankPTD[playerid][4]) // amount
    {
        ShowPlayerDialog(playerid, 5006, DIALOG_STYLE_INPUT, "Gui tiet kiem", "Nhap so tien", ">>", "<<");
    }
    if(playertextid == TransferBankPTD[playerid][5]) // otp
    {
        ShowPlayerDialog(playerid, 5007, DIALOG_STYLE_INPUT, "OTP", "Nhap OTP", ">>", "<<");
    }
    if(playertextid == TransferBankPTD[playerid][3]){
        SendErrorMessage(playerid, "Chuc nang dang bao tri !");
        
        /*ShowPlayerDialog(playerid, 5008, DIALOG_STYLE_INPUT, "Thoi gian gui tiet kiem", 
        "Nhap thoi gian (hours)\n\
        Cong thuc tinh lai suat:\n\
        (So tien gui x Lai suat theo gio (0.001) x So gio)\n\
        VD: Gui $10000 trong 24H , ban se nhan duoc $10240", ">>", "<<");*/
    }
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 5008)
    {
        if(strval(inputtext) <= 0) {
            ShowPlayerDialog(playerid, 5008, DIALOG_STYLE_INPUT, "Thoi gian gui tiet kiem", 
            "Nhap thoi gian (hours)\n\
            Cong thuc tinh lai suat:\n\
            (So tien gui x Lai suat theo gio (0.001) x So gio)\n\
            VD: Gui $10000 trong 24H , ban se nhan duoc $10240 \n\
            {FF0000}Luu y: Neu rut truoc thoi gian , ban se bi giam 1/2 lai suat", ">>", "<<");
            SendErrorMessage(playerid, "So gio gui tiet kiem khong hop le !");
            return 1;
        }

    }
    if(dialogid == 5006)
    {
        if(response)
        {
            new wd_msg[1280];

            if(Character[playerid][char_Cash] >= strval(inputtext))
            {
                if(strlen(inputtext) > 10) {
                    SendErrorMessage(playerid, "Giao dich phai be hon $1.000.000.000");
                    ShowPlayerDialog(playerid, 5006, DIALOG_STYLE_INPUT, "Gui tiet kiem", "Nhap so tien", ">>", "<<");
                    return 1;
                }
                SetPVarInt(playerid, #Banking_Amount, strval(inputtext));
                format(wd_msg, 1280, "%s", FormatMoney(strval(inputtext)));
                PlayerTextDrawSetString(playerid, TransferBankPTD[playerid][4], wd_msg);
            }
            else SendErrorMessage(playerid, "So du cua ban khong du !");
        }
    }
    if(dialogid == 5007)
    {
        if(response)
        {
            new wd_msg[1280];
            if(strlen(inputtext) < 5) {
                ShowPlayerDialog(playerid, 5007, DIALOG_STYLE_INPUT, "OTP", "Nhap OTP", ">>", "<<");
                SendErrorMessage(playerid, "OTP khong hop le !!!");
                return 1;
            }
            SetPVarInt(playerid, #Banking_OTP, strval(inputtext));
            format(wd_msg, 1280, "%s", inputtext);
            PlayerTextDrawSetString(playerid, TransferBankPTD[playerid][5], wd_msg);

        }
    }
    if(dialogid == 5002)
    {
        if(response)
        {
            new wd_msg[1280];
            if(strlen(inputtext) < 5) {
                ShowPlayerDialog(playerid, 5003, DIALOG_STYLE_INPUT, "Rut tien", "Ma OTP", ">>", "<<");
                SendErrorMessage(playerid, "OTP khong hop le !!!");
                return 1;
            }
            SetPVarInt(playerid, #Banking_OTP, strval(inputtext));
            format(wd_msg, 1280, "%s", inputtext);
            PlayerTextDrawSetString(playerid, WithdrawsBankPTD[playerid][5], wd_msg);

        }
    }
    if(dialogid == 5003)
    {
        if(response)
        {
            new wd_msg[1280];

            if(Character[playerid][char_Bank] >= strval(inputtext))
            {
                if(strlen(inputtext) > 10) {
                    SendErrorMessage(playerid, "Giao dich phai be hon $1.000.000.000");
                    ShowPlayerDialog(playerid, 5002, DIALOG_STYLE_INPUT, "Rut tien", "Nhap so tien", ">>", "<<");
                    return 1;
                }
                SetPVarInt(playerid, #Banking_Amount, strval(inputtext));
                format(wd_msg, 1280, "%s", FormatMoney(strval(inputtext)));
                PlayerTextDrawSetString(playerid, WithdrawsBankPTD[playerid][4], wd_msg);
            }
            else SendErrorMessage(playerid, "So du cua ban khong du !");
        }
    }

    if(dialogid == 5004)
    {
        if(response)
        {
            new wd_msg[1280];
            if(strlen(inputtext) < 5) {
                ShowPlayerDialog(playerid, 5004, DIALOG_STYLE_INPUT, "Rut tien", "Ma OTP", ">>", "<<");
                SendErrorMessage(playerid, "OTP khong hop le !!!");
                return 1;
            }
            SetPVarInt(playerid, #Banking_OTP, strval(inputtext));
            format(wd_msg, 1280, "%s", inputtext);
            PlayerTextDrawSetString(playerid, DepositBankPTD[playerid][5], wd_msg);

        }
    }
    if(dialogid == 5005)
    {
        if(response)
        {
            new wd_msg[1280];

            if(Character[playerid][char_Cash] >= strval(inputtext))
            {
                if(strlen(inputtext) > 10) {
                    SendErrorMessage(playerid, "Giao dich phai be hon $1.000.000.000");
                    ShowPlayerDialog(playerid, 5005, DIALOG_STYLE_INPUT, "Gui tien", "Nhap so tien", ">>", "<<");
                    return 1;
                }

                SetPVarInt(playerid, #Banking_Amount, strval(inputtext));
                format(wd_msg, 1280, "%s", FormatMoney(strval(inputtext)));
                PlayerTextDrawSetString(playerid, DepositBankPTD[playerid][4], wd_msg);
            }
            else SendErrorMessage(playerid, "So du cua ban khong du !");
        }
    }
    return 1;
}