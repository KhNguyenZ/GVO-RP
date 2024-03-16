CMD:makeleader(playerid,params[])
{
    if(!IsPlayerAdmin(playerid)) 
        return SendClientMessage(playerid,-1,"admin!");
    new id, Leader;
    if(sscanf(params,"ui",id,Leader)) 
        return SendClientMessage(playerid,-1, ""RED" [SSA-ORG] "FLAT"/makeleader [ID player] [Team]( | POLICE |)");
    else if(id == INVALID_PLAYER_ID) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT"Nguoi choi khong kha dung");
    if(Leader < 0 || Leader > 2) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT"Invalid Group ID!");
    //

    new ime[MAX_PLAYER_NAME]; 
    GetPlayerName(playerid, ime, sizeof(ime));
    new igrac[MAX_PLAYER_NAME]; 
    GetPlayerName(id, igrac, sizeof(igrac));

    //Set Value
    Organization[id][oClan] = Leader;
    Organization[id][oLeader] = Leader;
    Organization[id][oRank] = 6;
    Organization[id][oSkin] = 271;
    SetPlayerSkin(id, Organization[id][oSkin]);

    //
    ORG_CHAT(id, -1, ""RED" [SSA-ORG] "FLAT" da trao tang danh hieu LEADER cho id %d | Admin %s", Leader, ime);
    return 1;
}
CMD:giverank(playerid,params[])
{
    if(Organization[playerid][oLeader] == 0) return SendClientMessage(playerid,-1,""RED" [SSA-ORG] "FLAT" Ban khong phai la Leader !");
    new id, rank;
    if(sscanf(params,"ui",id,rank))
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" /giverank [ID PLAYER] [Rank]");
    else if(id == INVALID_PLAYER_ID)
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Nguoi choi khong kha dung");
    if(Organization[playerid][oLeader] != Organization[id][oClan])  
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Nguoi choi khong o chung Group voi ban");
    if(rank < 1 || rank > 6) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Cap rank chi tu 1-6");

    //
    new ime[MAX_PLAYER_NAME]; 
    GetPlayerName(playerid, ime, sizeof(ime));
    new igrac[MAX_PLAYER_NAME]; 
    GetPlayerName(id, igrac, sizeof(igrac));

    //
    Organization[id][oRank] = rank;
    Organization[id][oSkin] = 274;
    SetPlayerSkin(id, Organization[id][oSkin]);

    //
    ORG_CHAT(id, -1, ""RED" [SSA-ORG] "FLAT" Gived Rank %d BY Leader %s!", rank, ime);
    return 1;
}
CMD:invite(playerid,params[])
{
    if(Organization[playerid][oLeader] == 0) 
        return SendClientMessage(playerid,-1,""RED" [SSA-ORG] "FLAT" Ban khong phai la Leader!");
    new id;
    if(sscanf(params,"u",id))
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" [/invite] [ID player]");
    else if(id == INVALID_PLAYER_ID) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Nguoi choi khong kha dung");
    if(Organization[id][oClan] != 0) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Nguoi choi da o trong Group !");

    //
    new ime[MAX_PLAYER_NAME]; GetPlayerName(playerid, ime, sizeof(ime));
    new igrac[MAX_PLAYER_NAME]; GetPlayerName(id, igrac, sizeof(igrac));

    //
    SetPlayerSkin(id,273);
    Organization[id][oClan] = Organization[playerid][oLeader];
    Organization[id][oRank] = 1; // postavlja za rank 1
    Organization[id][oSkin] = 273;

    //
    ORG_CHAT(id,-1, ""RED" [SSA-ORG] "FLAT" Da moi ban vao Team (Leader:%s)", ime);
    ORG_CHAT(playerid,-1, ""RED" [SSA-ORG] "FLAT"  SUCCESFULL invited %s!", igrac);
    return 1;
}
CMD:uninvite(playerid,params[])
{
    if(Organization[playerid][oLeader] == 0) 
        return SendClientMessage(playerid,-1,""RED" [SSA-ORG] "FLAT" Ban khong phai la Leader!");
    new id;
    if(sscanf(params,"u",id)) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT"/uninvite [ID player]");
    else if(id == INVALID_PLAYER_ID) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" invalid player id!");
    if(Organization[playerid][oLeader] != Organization[id][oClan])  return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Nguoi choi khong o chung Group voi ban!");
    if(Organization[id][oLeader] > 0) 
        return SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT"Khong the duoi Leader !");
    //

    new ime[MAX_PLAYER_NAME]; GetPlayerName(playerid, ime, sizeof(ime));
    new igrac[MAX_PLAYER_NAME]; GetPlayerName(id, igrac, sizeof(igrac));

    //
    Organization[id][oClan] = 0;
    Organization[id][oRank] = 0;
    SetPlayerSkin(id,2);
    SpawnPlayer(id);

    //
    ORG_CHAT(id, -1, ""RED" [SSA-ORG] "FLAT" Ban da bi kick khoi Group boi: %s", ime);
    ORG_CHAT(playerid, -1, ""RED" [SSA-ORG] "FLAT" %s da bi kick khoi Group !", igrac);
    return 1;
}
 
CMD:quitgroup(playerid,params[])
{
    if(Organization[playerid][oClan] == 0) return SendClientMessage(playerid,-1,""RED" [SSA-ORG] "FLAT" Ban khong o trong Group!");
    {
        Organization[playerid][oClan] = 0;
        Organization[playerid][oRank] = 0;
        SetPlayerSkin(playerid, 2);
        SpawnPlayer(playerid);
        SendClientMessage(playerid, -1, ""RED" [SSA-ORG] "FLAT" Ban da thoat khoi Group !");
        return 1;
    }
    return 1;
}