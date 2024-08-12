#include <sampvoice>

new SV_GSTREAM:gstream = SV_NULL;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
new PlayerChannel[MAX_PLAYERS] = 0;

public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid) 
{
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(PlayerChannel[playerid], playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(PlayerChannel[playerid], playerid);
}

hook OnPlayerSpawn(playerid)
{
    PlayerChannel[playerid] = lstream[playerid];
    if((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        if (gstream) SvAttachListenerToStream(gstream, playerid);
        SvAddKey(playerid, 0x42);
    }
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
}

hook OnGameModeInit()
{
    gstream = SvCreateGStream(0xffff0000, "Global");
}

hook OnGameModeExit()
{
    if (gstream) SvDeleteStream(gstream);
}

CMD:voice(playerid, params[])
{
    if(PlayerChannel[playerid] == lstream[playerid])
    {
        PlayerChannel[playerid] = gstream;
        SendClientMessage(playerid, -1, "Ban da chuyen sang kenh Global");
    }
    else {
        PlayerChannel[playerid] = lstream[playerid];
        SendClientMessage(playerid, -1, "Ban da chuyen sang kenh Local");
    }
    return 1;
}