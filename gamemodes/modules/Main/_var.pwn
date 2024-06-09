#define 		MAX_INVENTORY_PAGE 1
#define 		MAX_INVENTORY_SLOT 20
enum 
{
	dialog_Login = 1,
	dialog_Register,
	dialog_charSelect,
	dialog_charCreate,
}
new PlayerText: LoginPTD[MAX_PLAYERS][15];

new PlayerText: RegisterPTD[MAX_PLAYERS][19];
new PlayerText:scm_PTD[MAX_PLAYERS];
new HienThi[MAX_PLAYERS];

enum character_Info 
{
	char_unique_Id[1280],
	char_account_id,
	char_player_id,
	Float:char_last_Pos[4],
	bool:char_Login,
	char_Skin,
	char_Cash,
	char_Admin,
	Float:char_health,
	Float:char_armour,
	char_tanso,
	char_Interior,
	char_VW,
	char_Birthday[3],
	char_Note[1280],
	char_Nation,
	char_GioiTinh,
	char_Level,
	
	char_Phone,
	char_DanhBa,
	char_Dice,
	char_CanXang,
	char_DayThung,
	char_XiGa,
	char_Drink,
	char_BinhSonXe,
	char_Radio,
	char_MatNa,
	char_OrgID,
	char_OrgRank,
	char_Eat,
	char_Job,
	char_DCID[50],
	char_DC_Code[12],
	char_DC_Auth,
	char_Bank,
	char_BankSaving,
	char_OTP,
	char_HoursSaving,
	char_LastLogin[100],
	char_ChiaKhoaXe,
	char_Email[50],
	char_Email_Code[10],
	char_Email_Status,
	char_Refer[MAX_PLAYER_NAME],
	char_Injured
}

new Character[MAX_PLAYERS][character_Info];
new PlayerText: SpawnLSRP[MAX_PLAYERS][4];
new PlayerSetupping[MAX_PLAYERS];
// new PlayerText:SpawnNewbiePTD[MAX_PLAYERS][7];
new PlayerText: FadeEffect[MAX_PLAYERS][1];
new PlayerText: SelectCharPTD[MAX_PLAYERS][12];
enum Char_Select_E {
	cs_skin,
	cs_lastlogin[24],
	cs_gender,
	cs_level
}
new CharSelectInfo[MAX_PLAYERS][Char_Select_E][3];

// new PlayerText:InfoCharPTD[MAX_PLAYERS][8];

new character_Name_data[MAX_PLAYERS][3][24];

new CharSkinSelect[MAX_PLAYERS] = 1;
enum Inv_Item{
	item_id,
	Float:item_weight,
	item_strtd[32],
	item_name[32],
	item_detail[100],
	item_maxamount
}
enum enum_pInventory
{
    invSlot[MAX_INVENTORY_SLOT],
    invSlotAmount[MAX_INVENTORY_SLOT]
}

new PlayerSelectSlot[MAX_PLAYERS];

new iCreate[MAX_VEHICLES] = -1;

new pSpeedo[MAX_PLAYERS];

// new pCountVeh[MAX_VEHICLES];

new OrgCount;


new Text: InfoTD[3];

new PlayerText: InfoPTD[MAX_PLAYERS][2];

new CountGuide[MAX_PLAYERS];


new PlayerText:
    DeathUI[MAX_PLAYERS][4];