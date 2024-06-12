#include <YSI_Coding\y_hooks>



#define MAX_JOBS 				(13)
#define MAX_JOB_NAME  			(64)
#define MAX_PJOB				(20)


#define MAX_TYPEJOB 8
#define JOB_TRUCKER 1
#define JOB_PIZZA 2
#define JOB_FIREMAN 3
#define JOB_PORTERS 4
#define JOB_MINER   5
#define JOB_LUMBERJACK 6
#define DLG_DIEMGIAOHANG 7
#define DLG_XEMHANG 8


#define         LAYHANG_BOCVAC                  (6311)

enum jInfo {
	jID,			
	jName[MAX_JOB_NAME],		
	jType,
	jLevel,
	Float:jPosX, 	
	Float:jPosY, 	
	Float:jPosZ,
	Float:jPosA,	
	Float:jCarX,
	Float:jCarY,
	Float:jCarZ,
	Float:jCarA,
	jCarModel,
	jCarColor[2],
	Text3D: jLabel,	
	jActor,
	jBonus,
	bool:jCreated,
	jSkin,
	jminMoney,
	jmaxMoney
}

new JobInfo[MAX_JOBS][jInfo];

enum carinfo {
	cjUse,
	cjCar,
	Text3D:cjText,
	cjString[1280]
}

new cJobInfo[MAX_PLAYERS][carinfo];

new GettingJob[MAX_PLAYERS];

new i_job;



//#include "./includes/NewJob/Pizza/pizza.pwn"
//#include "./includes/NewJob/Trucker/t_main.pwn"
//#include "./includes/NewJob/FireMan/fire.pwn"
//#include "./includes/NewJob/BocVac/bocvac.pwn"
//#include "./includes/job/CauCa/cauca.pwn"
//#include "./includes/job/CanSa/cs_main.pwn"
//#include "./includes/job/Farmer/FarmJob.pwn"

CMD:editjob(playerid, params[]) {
	if (Character[playerid][char_Admin] < 1)
	    return SendErrorMessage(playerid,"Ban khong co quyen su dung lenh nay.");
	new string[456];
	format(string,sizeof(string), "STT\tNPC Name\tTrang Thai");
	for(new i=1;i<MAX_JOBS;i++){
		format(string, sizeof(string), "%s\n%d\t%s\t%s", string, i, JobInfo[i][jName], (JobInfo[i][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua");
	}
	return Dialog_Show(playerid, DIALOG_EDITJOB, DIALOG_STYLE_TABLIST_HEADERS, "Edit Job", string, "Ok", "Thoat");
}
/*
CMD:taojob(playerid, params[])
{
	static
	    namejob[MAX_JOB_NAME],
		type,
        Float:x,
        Float:y,
        Float:z,
        Float:ang,
        level,
        bonus,
		minmoney,
		maxmoney,
        skin;

    if (PlayerInfo[playerid][pAdmin] < 1338)
	    return SendClientMessage(playerid, COLOR_GRAD2,"Ban khong co quyen su dung lenh nay.");

	if (sscanf(params, "s[64]dddddd", namejob, type, level, bonus, minmoney, maxmoney, skin))
	{
	    SendClientMessage(playerid, COLOR_GREY, "/taojob [name] [Type] [level] [bonus] [minmoney] [maxmoney] [skin]");
		return 1;
	}
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, ang);
    CreateJob(namejob, type, Float:x, Float:y, Float:z, Float:ang,skin, level, minmoney, maxmoney, bonus);

	new string[128];
	format(string, sizeof(string), "[MAY CHU]:{FFFFFF} Ban da thanh cong tao job");
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}
*/
CMD:xoajob(playerid, params[])
{
	static
	    id = 0;

	if (Character[playerid][char_Admin] < 1)
	    return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay.");

	if (sscanf(params, "d", id))
	    return  SendClientMessage(playerid, COLOR_GREY, "/xoajob [job id]");
	if ((id < 0 || id >= MAX_JOBS) || !JobInfo[id][jCreated])
	    return  SendClientMessage(playerid, COLOR_GREY, "ID npc khong ton tai.");

	DeleteJob(id);
	new string[128];
	format(string, sizeof(string), "[MAY CHU]:{FFFFFF} Ban da thanh cong xoa job ID: %d.", id);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:timduong(playerid){
	return 1;
}

CMD:timvieclam(playerid) {
	return 1;
}

/* ------------------------- Function ---------------------*/

hook OnGameModeInit() {
	// LoadPizza();
	// Load_Porters();
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    cJobInfo[playerid][cjUse] = 0;
    DisablePlayerCheckpoint(playerid);
    TraXeJob(playerid);

    RemovePlayerAttachedObject(playerid,0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES) {
		for(new i=1;i<=MAX_JOBS;i++){
			if(JobInfo[i][jCreated] == true) {
				if(RangeJob(playerid, i)){
					new playerjob = Character[playerid][char_Job];
					SetPVarInt(playerid, "JobID", i);
					new str[2460], name[1280], playername[34];
				    GetPlayerName(playerid, playername, 34);
					format(str, sizeof(str), sprintf("{FFFFFF}%s :{10ff94}Xin chao %s, Ban muon xin viec chu?", JobInfo[i][jName], playername));
					strcat(str, "\n{FFFFFF}---------> {10ff94}THONG TIN{FFFFFF} <-----------");
					strcat(str, sprintf("\n{FFFFFF}Type : %s", GetNameTypeJob(JobInfo[i][jType])));
					strcat(str, sprintf("\n{FFFFFF}Level : %d", JobInfo[i][jLevel]));
					strcat(str, sprintf("\n{FFFFFF}So luong nguoi choi: %d/%d", 1, MAX_PJOB));
					strcat(str, "\n{FFFFFF}----------------------------------");	
					strcat(str, "\n{00ffff}>{ffffff}   Xin viec.");
					strcat(str, "\n{00ffff}>{ffffff}  Nghi Viec.");
		    		format(name, sizeof(name), "{FFFFFF}Cong Viec");

					if(i == playerjob){
						strcat(str, "\n{00ffff}>{ffffff}  Lay Phuong Tien");
						strcat(str, "\n{00ffff}>{ffffff}  Tra Phuong Tien");
					}
					if(JobInfo[playerjob][jType] == JOB_FIREMAN) {
						strcat(str, "\n{00ffff}>{ffffff}  Lay Binh Cuu Hoa");
					}
					if(JobInfo[playerjob][jType] == JOB_TRUCKER) {
						strcat(str, "\n{00ffff}>{ffffff}  Xem Hang");
					}
					if(JobInfo[playerjob][jType] == JOB_MINER) {
						strcat(str, "\n{00ffff}>{ffffff}  Mua Xeng");
					}
					return Dialog_Show(playerid, DIALOG_GETJOB, DIALOG_STYLE_LIST, name, str, "Ok", "Thoat");
				}
			}
		}
	}
	return 1;
}

Dialog:DIALOG_EDITJOB(playerid, response, listitem, inputtext[]){
	if(!response)	return 1;
	if(Character[playerid][char_Admin] < 1) return 1;
	new szTitle[64], szDialog[256];
	new jobid = listitem + 1;
	SetPVarInt(playerid,"EditJob", jobid);
	format(szDialog, sizeof(szDialog), "Ten NPC\tValue\nTen Job\t%s\nMin Money\t%d\nMax Money\t%d\nBonus\t%d\nLevel\t%d\nToa Do NPC\nType \t%s\nID Phuong Tien\t%d\nToa Do Phuong Tien\nMau Xe\t %d - %d\nTrang Thai\t %s", JobInfo[jobid][jName], JobInfo[jobid][jminMoney], JobInfo[jobid][jmaxMoney],JobInfo[jobid][jBonus], JobInfo[jobid][jLevel]
	, GetNameTypeJob(JobInfo[jobid][jType]), JobInfo[jobid][jCarModel], JobInfo[jobid][jCarColor][0], JobInfo[jobid][jCarColor][1], (JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua");
	format(szTitle, sizeof(szTitle), "Chinh Sua %s", JobInfo[jobid][jName]);
	Dialog_Show(playerid, DIALOG_EDITJOB1, DIALOG_STYLE_TABLIST_HEADERS, szTitle, szDialog, "Ok", "Thoat");

	return 1;
}

Dialog:DIALOG_EDITJOB1(playerid, response, listitem, inputtext[]){
	if(!response)	return 1;

	if(Character[playerid][char_Admin] < 1) return 1;
	new jobid = GetPVarInt(playerid, "EditJob");
	SetPVarInt(playerid, "JobChoose", listitem);
	new szTitle[64];
	format(szTitle, sizeof(szTitle), "Chinh Sua Job %s", JobInfo[jobid][jName]);
	switch(listitem) {
		case 0: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap ten moi cua %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 1: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien toi thieu cua Job %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 2: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien toi da cua Job %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 3: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien bonus (VIP) cua Job %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 4: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Level cua Job %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 5: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Position NPC cho Job %s\n Theo Dang [x] [y] [z] [a]", JobInfo[jobid][jName]), "Ok", "Thoat");
				// Pos NPC
		}
		case 6: {
			new string[128];
			for(new i = 1; i <= MAX_TYPEJOB; i++) {
				format(string,sizeof(string), "%s\n%s", string, GetNameTypeJob(i));
			}
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_LIST, sprintf("Chon Type cua Job: %s", JobInfo[jobid][jName]), string, "Ok", "Thoat");
		}
		case 7: {
				// Model Car
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Car Model cho Job %s", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 8: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Position Car cho Job %s\n Theo Dang [x] [y] [z] [a]", JobInfo[jobid][jName]), "Ok", "Thoat");
				// Pos Car
		}
		case 9: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Mau Xe cho Job %s\n Theo Dang [Color 1] [Color 2]", JobInfo[jobid][jName]), "Ok", "Thoat");
		}
		case 10: {
			Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_MSGBOX, szTitle, sprintf("Hien tai job dang %s{FFFFFF}, ban co muon %s{FFFFFF} khong?", (JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua", (!JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua"), "Ok", "Thoat");
		}
	}
	return 1;
}

Dialog:DIALOG_EDITJOB2(playerid, response, listitem, inputtext[]){
	if(!response)	return 1;
	if(Character[playerid][char_Admin] < 1) return 1;
	new jobid = GetPVarInt(playerid, "EditJob");
	new jobchoose = GetPVarInt(playerid, "JobChoose");
	new szTitle[64];
	format(szTitle, sizeof(szTitle), "Chinh Sua Job %s", JobInfo[jobid][jName]);
	switch(jobchoose) {
		case 0: {
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong ten cua NPC %s thanh %s", JobInfo[jobid][jName], inputtext));
			new jobname[MAX_JOB_NAME];
			format(jobname, sizeof(jobname), "%s", inputtext);
			JobInfo[jobid][jName] = jobname;
		}
		case 1: {
			if(!IsNumeric(inputtext) || strval(inputtext) < 1) return Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien toi thieu cua job %s\nError, So tien cua ban nhap khong hop le!!", JobInfo[jobid][jName]), "Select", "Cancel");
			JobInfo[jobid][jminMoney] = strval(inputtext);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong so tien toi thieu cua NPC Job %s thanh %s", JobInfo[jobid][jName], inputtext));
		}
		case 2: {
			if(!IsNumeric(inputtext) || strval(inputtext) < 1) return Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien toi da cua job %s\nError, So tien cua ban nhap khong hop le!!", JobInfo[jobid][jName]), "Select", "Cancel");
			JobInfo[jobid][jmaxMoney] = strval(inputtext);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong so tien toi da cua  NPC Job %s thanh %s", JobInfo[jobid][jName], inputtext));
		}
		case 3: {
			if(!IsNumeric(inputtext) || strval(inputtext) < 1) return Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so tien bonus (VIP) cua job %s\nError, So tien cua ban nhap khong hop le!!", JobInfo[jobid][jName]), "Select", "Cancel");
			JobInfo[jobid][jmaxMoney] = strval(inputtext);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong so tien bonus (VIP) cua NPC Job %s thanh %s", JobInfo[jobid][jName], inputtext));
		}
		case 4: {
			if(!IsNumeric(inputtext) || strval(inputtext) < 1) return Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so Level cua job %s\nError, So tien cua ban nhap khong hop le!!", JobInfo[jobid][jName]), "Select", "Cancel");
			JobInfo[jobid][jLevel] = strval(inputtext);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Level cua NPC Job %s thanh %s", JobInfo[jobid][jName], inputtext));
		}
		case 5: {
			if (sscanf(inputtext, "ffff", JobInfo[jobid][jPosX], JobInfo[jobid][jPosY], JobInfo[jobid][jPosZ] ,JobInfo[jobid][jPosA]))
			{
				Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Position NPC cho NPC Job %s\n Theo Dang [x] [y] [z] [a]", JobInfo[jobid][jName]), "Ok", "Thoat");
				return 1;
			}
			if (IsValidActor(JobInfo[jobid][jActor]))
				DestroyActor(JobInfo[jobid][jActor]);

			JobInfo[jobid][jActor] = CreateActor(JobInfo[jobid][jSkin], JobInfo[jobid][jPosX], JobInfo[jobid][jPosY], JobInfo[jobid][jPosZ], JobInfo[jobid][jPosA]);
			SetActorVirtualWorld(JobInfo[jobid][jActor], 0);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Toa Do Job %s thanh %f %f %f %f", JobInfo[jobid][jName], JobInfo[jobid][jPosX], JobInfo[jobid][jPosY], JobInfo[jobid][jPosZ], JobInfo[jobid][jPosA]));
		}
		case 6: {
			JobInfo[jobid][jType] = listitem+1;
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Type cua NPC Job %s thanh %s", JobInfo[jobid][jName], GetNameTypeJob(listitem+1)));
		}
		case 7: {
			if(!IsNumeric(inputtext) || strval(inputtext) < 1) return Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap so Level cua job %s\nError, So tien cua ban nhap khong hop le!!", JobInfo[jobid][jName]), "Select", "Cancel");
			JobInfo[jobid][jCarModel] = strval(inputtext);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Car Model cua NPC Job %s thanh %s", JobInfo[jobid][jName], inputtext));
		}
		case 8: {
			if (sscanf(inputtext, "ffff", JobInfo[jobid][jCarX], JobInfo[jobid][jCarY], JobInfo[jobid][jCarZ] ,JobInfo[jobid][jCarA]))
			{
				Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Position Car cho Job %s\n Theo Dang [x] [y] [z] [a]", JobInfo[jobid][jName]), "Ok", "Thoat");
				return 1;
			}
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Toa Do cua xe Job %s thanh %f %f %f %f", JobInfo[jobid][jName], JobInfo[jobid][jCarX], JobInfo[jobid][jCarY], JobInfo[jobid][jCarZ], JobInfo[jobid][jCarA]));
		}
		case 9: {
			if (sscanf(inputtext, "dd", JobInfo[jobid][jCarColor][0], JobInfo[jobid][jCarColor][1]))
			{
				Dialog_Show(playerid, DIALOG_EDITJOB2, DIALOG_STYLE_INPUT, szTitle, sprintf("Nhap Mau xe cho NPC Job %s\nTheo Dang [Color 1] [Color 2]", JobInfo[jobid][jName]), "Ok", "Thoat");
				return 1;
			}
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh sua thanh cong Mau xe cua NPC Job %s thanh %d - %d", JobInfo[jobid][jName], JobInfo[jobid][jCarColor][0], JobInfo[jobid][jCarColor][1]));
		}
		case 10: {
			JobInfo[jobid][jCreated] = !JobInfo[jobid][jCreated];
			static
				string[256];
			format(string, sizeof(string), "{FFFFFF}NPC: {FFFF00}%s{FFFFFF} - [ID %d]\nBam {1FBDFF}[Y]{FFFFFF} de tuong tac\nTinh Trang: %s", JobInfo[jobid][jName], jobid, (JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua");
			UpdateDynamic3DTextLabelText(JobInfo[jobid][jLabel], COLOR_YELLOW, string);
			SendClientMessage(playerid, COLOR_WHITE, sprintf("Ban da chinh trang thai cua NPC %s{FFFFFF} thanh %d", JobInfo[jobid][jName], (JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua"));
		}
	}
	DeletePVar(playerid, "EditJob");
	DeletePVar(playerid, "JobChoose");
	Job_Save(jobid);
	RefreshJob(jobid);

	return 1;
}

Dialog:FIND_JOB_LS(playerid, response, listitem, inputtext[]){
	if(!response)	return 1;

	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	SetPlayerCheckpoint(playerid, JobInfo[listitem+1][jPosX], JobInfo[listitem+1][jPosY], JobInfo[listitem+1][jPosZ], 3.0);
	// CP[playerid] = 252000;

	return 1;
}


Dialog:DIALOG_NGHIVIEC2(playerid, response, listitem, inputtext[]) {
	if(response) {
		if(strval(inputtext) > 2)
		{
			SendClientMessage(playerid,COLOR_WHITE, "{FF0000}[!]{FFFFFF} So thu tu cong viec khong the lon hon 2.");
		}
		if(!IsNumeric(inputtext))
		{
			SendClientMessage(playerid,COLOR_WHITE, "{FF0000}[!]{FFFFFF} So thu tu cong viec phai la so.");
		}
		new idcongviec = strval(inputtext);
		if(idcongviec == 0)
		{
			SendClientMessage(playerid,COLOR_WHITE, "{FF0000}[!]{FFFFFF} So thu tu cong viec khong the la 0.");
		}
		if(idcongviec == 1)
		{
			SendClientMessage(playerid, COLOR_WHITE, " {FF0000}[!]{FFFFFF}Ban da thoat cong viec chinh thanh cong.");
			Character[playerid][char_Job] = 0;
		}
		if(GetPlayerJobType(playerid) == JOB_PORTERS) {
			// Reset_PlayerPorters(playerid);
		}
    	DisablePlayerCheckpoint(playerid);
    	TraXeJob(playerid);
	}
}


Dialog:DIALOG_GETJOB(playerid, response, listitem, inputtext[])
{
	if(!response)	return 1;
	new jobid = GetPVarInt(playerid, "JobID");
	new playerjob = Character[playerid][char_Job];
	switch(listitem) {
		case 1: {
			switch(JobInfo[jobid][jType]) {
				case JOB_TRUCKER: return 1;
				case JOB_FIREMAN: return 1;
				case JOB_PIZZA: return 1;	
				case JOB_PORTERS: return 1;
			} // tro giup cong viec			
		}
		case 6: {
			if(Character[playerid][char_Job] > 0) return SendClientMessage(playerid, COLOR_GRAD1, "Ban hien dang co cong viec hay su dung /nghiviec , de bat dau cong viec moi.");
			//if(PlayerInfo[playerid][pCMND] == 0) return SendClientMessage(playerid, COLOR_GRAD1, "Ban Chua Co Can Cuoc Cong Dan Khong The Xin Viec");
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAD1, "Ban khong the xin viec trong mot chiec xe.");
			if(GetPlayerState(playerid) == 1 && Character[playerid][char_Job] == 0) {
				if(JobInfo[jobid][jCreated] == true) {
					GettingJob[playerid] = jobid;
					AcceptJob(playerid);
				}
				else {
					SendClientMessage(playerid, COLOR_GRAD1, sprintf("Job %s cua NPC %s hien tai dang duoc bao tri", GetNameTypeJob(jobid), JobInfo[jobid][jName]));
				}
			} // Nhan cong viec
		}
		case 7: {
			ShowNghiViec(playerid);
		}
		case 8: {
			if(JobInfo[playerjob][jCarModel] != 0 && RangeJob(playerid, jobid)) {
				LayXeJob(playerid);
			}
			else {
				SendClientMessage(playerid, COLOR_GRAD1, "> Cong viec nay khong can phuong tien.");
			}
		}
		case 9: {
			if(JobInfo[playerjob][jCarModel] != 0 && RangeJob(playerid, jobid)) {
				TraXeJob(playerid);
				SendClientMessage(playerid, COLOR_GRAD1, "> Ban da tra phuong tien thanh cong.");
			}
			else {
				SendClientMessage(playerid, COLOR_GRAD1, "> Cong viec nay khong can phuong tien.");
			}
		}
		case 10: {
			new playerjob = Character[playerid][char_Job];
			if(JobInfo[playerjob][jType] == JOB_TRUCKER) {
				//return cmd_diemgiaohang(playerid, "");
			}
			if(JobInfo[playerjob][jType] == JOB_FIREMAN) {
				//return givefire(playerid);
			}
			if(JobInfo[playerjob][jType] == JOB_MINER) {
				//return giveShovel(playerid);
			}
		}
		/*case 5: {
			switch(Character[playerid][char_Job]) {
				case 1: {
					PlayerInfo[playerid][pFireExtin] = 5000;
					SendClientMessage(playerid, COLOR_GRAD1, "Ban da nap day binh cuu hoa.");
					givefire(playerid);
				}
				case 2: {
					return cmd_layxetruck(playerid, "");
				}
			}
		}
		case 6: {
			switch(Character[playerid][char_Job]) {
				case 2: {
					return cmd_diemgiaohang(playerid, "");
				}
			}
		}*/
	}
	DeletePVar(playerid, "JobID");
	return 1;
}

/*----------------------- Stock -----------------------*/

task UpdateReloadCar[300000] ()
{
	foreach(new playerid: Player) 
	{ 
		new jobid = Character[playerid][char_Job];
	    if(JobInfo[jobid][jCarModel] != 0) 
		{
			if(cJobInfo[playerid][cjUse] == 1) 
			{
				if(!IsPlayerInRangeOfVehicle(playerid, cJobInfo[playerid][cjCar], 50)) 
				{
					cJobInfo[playerid][cjUse] = 0;
					DestroyVehicle(cJobInfo[playerid][cjCar]);
					Delete3DTextLabel(cJobInfo[playerid][cjText]);
				}
			}
		}
	}
}



stock TraXeJob(playerid) { 
	if(cJobInfo[playerid][cjUse] == 1) 
	{
		cJobInfo[playerid][cjUse] = 0;
		DestroyVehicle(cJobInfo[playerid][cjCar]);
	    Delete3DTextLabel(cJobInfo[playerid][cjText]);
	}
	return 1;
}

stock LayXeJob(playerid)
{
	new jobid = Character[playerid][char_Job];
	if(JobInfo[jobid][jCarModel] != 0) {
		if(cJobInfo[playerid][cjUse] == 0) 
		{
			cJobInfo[playerid][cjCar] = CreateVehicle(JobInfo[jobid][jCarModel], JobInfo[jobid][jCarX], JobInfo[jobid][jCarY], JobInfo[jobid][jCarZ], JobInfo[jobid][jCarA], JobInfo[jobid][jCarColor][0], JobInfo[jobid][jCarColor][1], 1000);
			PutPlayerInVehicle(playerid, cJobInfo[playerid][cjCar] ,0);

			format(cJobInfo[playerid][cjString], 1280, "{%s}%s{FFFFFF}\nPhuong tien cua {FFFF00}%s{FFFFFF}.", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType]), GetPlayerNameEx(playerid));
			cJobInfo[playerid][cjText] = Create3DTextLabel(cJobInfo[playerid][cjString], COLOR_WHITE, 0.0, 0.0, 0.0, 50.0, 0, 1);
			Attach3DTextLabelToVehicle(cJobInfo[playerid][cjText], cJobInfo[playerid][cjCar], 0.0, 0.0, 0.0);

			cJobInfo[playerid][cjUse] = 1;
			SendClientMessage(playerid, -1, sprintf("{%s}%s{FFFFFF}: Ban da nhan phuong tien cua Job thanh cong.", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType])));
			return 1;
		}
		else SendClientMessage(playerid, -1, sprintf("{%s}%s{FFFFFF}: Ban da lay phuong tien truoc do roi, khong the lay tiep tuc.", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType])));
	}
	return 1;
}



stock GiveJobSalary(playerid) {
	new string[128];
	new jobid = Character[playerid][char_Job];
	new rand = randomEx(JobInfo[1][jminMoney], JobInfo[1][jmaxMoney]);
	switch(JobInfo[jobid][jType]) {
		case JOB_PIZZA: {
			GivePlayerCash(playerid, rand);
			PlayerInfo[playerid][pXP] += 10;
		}
		case JOB_PORTERS: {
			GivePlayerCash(playerid, rand);
			new randd = random(100);
			if(randd >= 0 && randd <= 30) {
				PlayerInfo[playerid][pXP] += 10;
			}
		}
	}
	format(string, sizeof(string), "{%s}%s{FFFFFF}: Ban da hoan thanh cong viec va nhan duoc ($%s).", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType]), number_format(rand));
	SendClientMessage(playerid, -1, string);
}

stock AcceptJob(playerid){
	if(GettingJob[playerid] > 0) {
		Character[playerid][char_Job] = GettingJob[playerid];
		new jobid = Character[playerid][char_Job];
        new name[1280];
    	format(name, sizeof(name), "{ffff00}Ban da nhan cong viec {%s}%s (1){ffff00} thanh cong!.", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType]));
    	SendClientMessage(playerid, -1, name);

		if(JobInfo[GettingJob[playerid]][jType] == JOB_FIREMAN) {
			Character[playerid][char_Skin] = 277;
			SetPlayerSkin(playerid, 277);
		}
		if(JobInfo[GettingJob[playerid]][jType] == JOB_PIZZA) {
			SetPlayerSkin(playerid, 155);
			Character[playerid][char_Skin] = 155;
		}
    	GettingJob[playerid] = 0;
		return 1;
	}
    else {
        SendClientMessage(playerid, COLOR_GREY, " Ban chua den noi lam viec !");
    }
	return 1;
}

stock GetColorTypeJob(type) {
	new string[128];
	switch(type) {
		case JOB_FIREMAN: format(string, sizeof(string), "990000");
		case JOB_TRUCKER: format(string, sizeof(string), "b7eced");
		case JOB_PIZZA: format(string, sizeof(string), "99cc00");
		case JOB_PORTERS: format(string, sizeof(string), "d6eec4");
		case JOB_MINER: format(string, sizeof(string), "fbba00");
		case JOB_LUMBERJACK: format(string, sizeof(string), "cd864c");
	}
	return string;
}

stock GetNameTypeJob(type) {
	new string[128];
	switch(type) {
		case JOB_FIREMAN: format(string, sizeof(string), "Cuu Hoa");
		case JOB_TRUCKER: format(string, sizeof(string), "Trucker Delivery");
		case JOB_PIZZA: format(string, sizeof(string), "Pizza Delivery");
		case JOB_PORTERS: format(string, sizeof(string), "Boc Vac");
		case JOB_MINER: format(string, sizeof(string), "Miner");
		case JOB_LUMBERJACK: format(string, sizeof(string), "LumberJack");
	}
	return string;
}


stock GetJobLevel(playerid, job)
{
	return 1;
}

stock ShowNghiViec(playerid) {
	if(Character[playerid][char_Job] == 0 ) return SendClientMessage(playerid, COLOR_GREY, "{FF0000}[!]{FFFFFF} Ban hien tai dang that nghiep.");
	{
        new jobid = Character[playerid][char_Job];
        new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], str5[1280], str6[1280], name[1280];
        format(str1, sizeof(str), "{FFFFFF}#Tinh trang cong viec cua {10ff94}%s", GetPlayerNameEx(playerid));
        format(str2, sizeof(str), "{FFFFFF}----------------------------------");
        format(str3, sizeof(str), "{FFFFFF}Cong viec : {%s}%s", GetColorTypeJob(JobInfo[jobid][jType]), GetNameTypeJob(JobInfo[jobid][jType]));
        format(str5, sizeof(str), "{FFFFFF}----------------------------------");
        format(str6, sizeof(str), "{FFFFFF}Vui long nhap (1) vao o ben duoi de tien hanh nghi viec: ");
        format(str, sizeof(str), "%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n%s", str1,str2,str3,str4,str5,str6);
        format(name, sizeof(name), "{FFFFFF}Ban muon nghi viec ?");
        Dialog_Show(playerid, DIALOG_NGHIVIEC2, DIALOG_STYLE_INPUT, name, str, "Dong Y", "Huy Bo");
	}
	return 1;
}




stock GetPlayerJobType(playerid) {return JobInfo[Character[playerid][char_Job]][jType];}





/*----------------------- SQL -----------------------------*/



stock Job_Save(jobid)
{
	static
	    query[1280];

	format(query, sizeof(query), "UPDATE `Job` SET `jobName` = '%s', `jobType` = '%d',`jobX` = '%.4f', `jobY` = '%.4f', `jobZ` = '%.4f', `jobA` = '%.4f', `CarX` = '%.4f', `CarY` = '%.4f', `CarZ` = '%.4f', `CarA` = '%.4f', `CarModel` = '%d', `CarColor1` = '%d', `CarColor2` = '%d',`jobLevel` = '%d', `jobSkin` = '%d', `jobBonus` = '%d', `jobminMoney` = '%d', `jobmaxMoney` = '%d', `jobCreated` = '%d' WHERE `jobID` = '%d'",
        JobInfo[jobid][jName],
		JobInfo[jobid][jType],
        JobInfo[jobid][jPosX],
        JobInfo[jobid][jPosY],
        JobInfo[jobid][jPosZ],
        JobInfo[jobid][jPosA],
		JobInfo[jobid][jCarX],
        JobInfo[jobid][jCarY],
        JobInfo[jobid][jCarZ],
        JobInfo[jobid][jCarA],
		JobInfo[jobid][jCarModel],
		JobInfo[jobid][jCarColor][0],
		JobInfo[jobid][jCarColor][1],
        JobInfo[jobid][jLevel], 
        JobInfo[jobid][jSkin],
        JobInfo[jobid][jBonus],
		JobInfo[jobid][jminMoney],
		JobInfo[jobid][jmaxMoney],
		JobInfo[jobid][jCreated],
        JobInfo[jobid][jID]
	);
	return mysql_tquery(Handle(), query, "OnQueryFinish", "");
}


stock LoadJob()
{
	printf("[LoadJob] Loading Job from the database, please wait...");
	mysql_tquery(Handle(), "SELECT * FROM `Job`", "OnLoadJob", "");
}


forward OnLoadJob();
public OnLoadJob()
{
	if(cache_num_rows() > 0)
	{

		for(new i = 0; i < cache_num_rows(); i++) if(i < MAX_JOBS)
		{
            new jobid = i + 1;
            cache_get_value_name(i, "jobName", JobInfo[jobid][jName]);
            cache_get_value_name_int(i, "jobSkin", JobInfo[jobid][jSkin]); 
            cache_get_value_name_float(i, "jobX", JobInfo[jobid][jPosX]); 
            cache_get_value_name_float(i, "jobY", JobInfo[jobid][jPosY]); 
            cache_get_value_name_float(i, "jobZ", JobInfo[jobid][jPosZ]); 
            cache_get_value_name_float(i, "jobA", JobInfo[jobid][jPosA]); 

            JobInfo[jobid][jActor] = CreateActor(JobInfo[jobid][jSkin] , JobInfo[jobid][jPosX], JobInfo[jobid][jPosZ], JobInfo[jobid][jPosZ], JobInfo[jobid][jPosA]);

            cache_get_value_name_int(i, "jobType", JobInfo[jobid][jType]); 
            cache_get_value_name_int(i, "jobLevel", JobInfo[jobid][jLevel]); 
            cache_get_value_name_int(i, "jobBonus", JobInfo[jobid][jBonus]);
            cache_get_value_name_int(i, "jobminMoney", JobInfo[jobid][jminMoney]); 
            cache_get_value_name_int(i, "jobmaxMoney", JobInfo[jobid][jmaxMoney]);
            cache_get_value_name_int(i, "jobCreated", JobInfo[jobid][jCreated]); 
            cache_get_value_name_int(i, "jobID", JobInfo[jobid][jID]);
            SetActorVirtualWorld(JobInfo[jobid][jActor], 0);
            RefreshJob(jobid);
            i_job++;
        }
    }
	return 1;
}


stock RefreshJob(jobid)
{
	if (jobid != -1 && JobInfo[jobid][jCreated])
	{
	    if (IsValidDynamic3DTextLabel(JobInfo[jobid][jLabel]))
	        DestroyDynamic3DTextLabel(JobInfo[jobid][jLabel]);

		static
			string[256];
		format(string, sizeof(string), "{FFFFFF}NPC: {FFFF00}%s{FFFFFF} - [ID %d]\nBam {1FBDFF}[Y]{FFFFFF} de tuong tac\nTinh Trang: %s", JobInfo[jobid][jName], jobid, (JobInfo[jobid][jCreated]) ? "{228b22}Hoat Dong" : "{800020}Dong Cua");
		JobInfo[jobid][jLabel] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, JobInfo[jobid][jPosX], JobInfo[jobid][jPosY], JobInfo[jobid][jPosZ] + 0.3, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	}
	return 1;
}

stock GetJobID(id) {
	for(new i=1;i<MAX_JOBS;i++) {
		if(JobInfo[i][jID] == id) return i;
	}
	return -1;
}



stock RangeJob(playerid, jobid, Float:radius = 3.0)
{
    return IsPlayerInRangeOfPoint(playerid, radius, JobInfo[jobid][jPosX], JobInfo[jobid][jPosY], JobInfo[jobid][jPosZ]);
}
stock DeleteJob(id)
{
	new jobid = id;
	if (jobid != -1 && JobInfo[jobid][jCreated])
	{

        if (IsValidDynamic3DTextLabel(JobInfo[jobid][jLabel]))
	        DestroyDynamic3DTextLabel(JobInfo[jobid][jLabel]);

        DestroyActor(JobInfo[jobid][jActor]);
		JobInfo[jobid][jName] = 0;
		JobInfo[jobid][jType] = 0;
		JobInfo[jobid][jSkin] = 0;
		JobInfo[jobid][jPosX] = 0;
		JobInfo[jobid][jPosY] = 0;
		JobInfo[jobid][jPosZ] = 0;
		JobInfo[jobid][jPosA] = 0;
		JobInfo[jobid][jBonus] = 0;
		JobInfo[jobid][jLevel] = 0;
		JobInfo[jobid][jminMoney] = 0;
		JobInfo[jobid][jmaxMoney] = 0;
	    JobInfo[jobid][jCreated] = false;
		JobInfo[jobid][jCarX] = 0;
		JobInfo[jobid][jCarY] = 0;
		JobInfo[jobid][jCarZ] = 0;
		JobInfo[jobid][jCarA] = 0;
		JobInfo[jobid][jCarModel] = 0;
		JobInfo[jobid][jCarColor][0] = 0;
		JobInfo[jobid][jCarColor][1] = 0;

	    Job_Save(jobid);
	}
	return 1;
}


stock CreateJob(name[MAX_JOB_NAME], type,Float:x, Float:y, Float:z, Float:ang, skinid, level = 1, minmoney = 200, maxmoney = 300, bonus = 0) {
	for(new i = 1;i<=MAX_JOBS; i++) {
		if(JobInfo[i][jCreated] == false) {
			JobInfo[i][jName] = name;
			JobInfo[i][jType] = type;
			JobInfo[i][jCreated] = true;
			JobInfo[i][jSkin] = skinid;
			JobInfo[i][jPosX] = x;
			JobInfo[i][jPosY] = y;
			JobInfo[i][jPosZ] = z;
			JobInfo[i][jPosA] = ang;
			JobInfo[i][jBonus] = bonus;
			JobInfo[i][jLevel] = level;
			JobInfo[i][jminMoney] = minmoney;
			JobInfo[i][jmaxMoney] = maxmoney;

			JobInfo[i][jActor] = CreateActor(JobInfo[i][jSkin], JobInfo[i][jPosX], JobInfo[i][jPosY], JobInfo[i][jPosZ], JobInfo[i][jPosA]);
			SetActorVirtualWorld(JobInfo[i][jActor], 0);

			JobInfo[i][jCarX] = 0;
			JobInfo[i][jCarY] = 0;
			JobInfo[i][jCarZ] = 0;
			JobInfo[i][jCarA] = 0;
			JobInfo[i][jCarModel] = 0;
			JobInfo[i][jCarColor][0] = 0;
			JobInfo[i][jCarColor][1] = 0;
			RefreshJob(i);
			Job_Save(i);

			return i;
		}
	}
	return 1;
}
/* ------------------------------ Dialog -------------------------*/

/*
Dialog:GOTOJOB(playerid, response, listitem, inputtext[])
{
	new string[100];
	if(!response) return 1;
	new j = listitem + 1; 

	SetPlayerPosEx(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ]);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0); 

	format(string, sizeof(string), "AdmCmd: %s vua dich chuyen den job %s (%d).", GetName(playerid), JobInfo[j][jName], j);
	//SendAdminMessage(COLOR_LOGS, string, 1);
	return 1;
}
*/

/*
Dialog:DIALOG_JOBS(playerid, response, listitem, inputtext[]) 
{
	if(!response) return 1;
	SetPVarInt(playerid, "jListitem", listitem);
	Dialog_Show(playerid, DIALOG_JOBS1, DIALOG_STYLE_LIST, "Cong viec", "Xem huong dan\nDinh vi", "Select", "Cancel");
	return 1;
}
Dialog:DIALOG_JOBS1(playerid, response, listitem, inputtext[]) 
{
	if(!response) return callcmd::jobs(playerid, "");
	new string[200];
	if(listitem == 0) {
		switch(GetPVarInt(playerid, "jListitem")) {
			// case 0: {
			// 	strcat(string, "Job ID 1: Nong Dan\n");
			// strcat(string, "*Chao mung ban den voi cong viec Nong dan. Ban co the bat dau lam viec bang lenh </startwork>, de ket thuc cong viec su dung lenh <stopwork>. Chuc ban choi game vui ve!");
			// }	
			default: strcat(string, "Huong dan dang duoc cap nhat hoac chua co.");
		}				
		Dialog_Show(playerid, 0, DIALOG_STYLE_MSGBOX, "Huong dan cong viec", string, "Ok", "Exit");
	} else {
		if(CP[playerid] != 0) return Dialog_Show(playerid, DIALOG_CHECKPOINT, DIALOG_STYLE_MSGBOX, "Checkpoint", "Mot cham do dang hoat dong.\nBan co muon xoa no khong? Neu muon, hay chon 'Ok'.", "Ok", "Exit");
		new j = GetPVarInt(playerid, "jListitem") + 1;
		format(string, sizeof(string), "Mot diem mau do da duoc dat tai job %s. Khoang cach: %0.2fm", JobInfo[j][jName], GetPlayerDistanceFromPoint(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ]));
		SCM(playerid, COLOR_YELLOW, string);
		SetPlayerCheckpoint(playerid, JobInfo[j][jPosX], JobInfo[j][jPosY], JobInfo[j][jPosZ], 1);
		CP[playerid] = 252000;				
	}
	return 1;
}*/

