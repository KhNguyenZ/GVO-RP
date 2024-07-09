CMD:banking(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, -2666.7080,796.2833,1500.9688) && !IsPlayerInRangeOfPoint(playerid, 5.0, 1102.346679, -1429.463378, 15.436881) && !IsPlayerInRangeOfPoint(playerid, 5.0, 1928.636230, -1766.932739, 13.136870) && !IsPlayerInRangeOfPoint(playerid, 5.0, 1495.875854, -1749.788452, 15.085303)) return SendErrorMessage(playerid, "Ban khong dung gan cay atm nao ca!");
    if(Character[playerid][char_OTP] != EOS)
    {
        OpenBanking(playerid);
        SelectTextDraw(playerid, 0xFF00FF);
        
    }
    else 
    {
        SendClientMessage(playerid, COLOR_WHITE, "Ban chua cap nhat ma OTP [ {ff0000}/otp{ffffff} ] de cap nhat");    
    }
    
    return 1;
}