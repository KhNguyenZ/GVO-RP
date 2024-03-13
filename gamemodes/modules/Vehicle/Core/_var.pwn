new const VehicleName[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Perennial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch",
	"Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi",
	"Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator",
	"Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit", "Romero",
	"Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed",
	"Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler",
	"ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper",
	"Rancher","FBI Rancher","Virgo","Greenwood","Jetmax","Hotring Racer","Sandking","Blista Compact","Police Maverick",
	"Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT",
	"Elegant","Journey","Bike","Mountain Bike","Beagle","Cropduster","Stuntplane","Tanker","Road Train","Nebula","Majestic",
	"Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV-1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent",
	"Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility",
	"Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger",
	"Flash","Tahoma","Savanna","Bandito","Freight","Trailer","Kart","Mower","Duneride","Sweeper","Broadway",
	"Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer",
	"Euros","Hotdog","Club","Trailer","Trailer","Andromada","Dodo","RCCam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A",
	"Luggage Trailer B","Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};
enum VehicleCustom_Data {
    vc_id,
    vc_name[50]
}
new VehicleCustomName[][VehicleCustom_Data] = {
    {613,"Arac"}, {614,"Hummer"}, {662,"Diavel"}, {663,"Acra"}, {665,"Landcurser"}, 
    {666,"Hotwheel"}, {667,"Mclaren"}, {668,"812Mansory "}, {699,"Bentayga"}, {793,"BMW i7"}, 
    {794,"Canis"}, {795,"Titan"}, {796,"Carrera"}, {797,"Cheeta"}, {798,"Huntleys"}, {799,"Rolls-Royce"},
    {907,"Crossbar"}, {908,"Tmax"}, {909,"Nmax"}, {965,"Xadv"}, {999,"Gwing"}, {1194,"F40"}, 
    {1195,"Nrg 500 Drag"}, {1196,"Gbrabus63"}, {1197," Brabus GLS"}, {1198,"Mercedes-AMG G63"}, 
    {1199,"Scramjet"}, {1200,"S500w223b"}, {1201,"Sl63"}, {1202,"Urusm"}, {1203,"Oneo"}, 
    {1204,"Pegassi"}, {1206,"Tahoe"}, {1326,"Kingtampa"}, {1573,"Iqx"}, {1699,"Harley2"}, 
    {2883,"Harley"}, {2884,"Boatspeed"}, {3136,"Boatwood"}, {3137,"Sunship"}, {3138,"Dream"}, 
    {3139,"Dodge Viper SRT-10"}, {3140,"Nissan GT-R Nismo"}, {3141,"Apollo Intensa Emozione"}, {3142,"Newvo"}, {3143,"Roadz"},
    {3145,"Lamborghini Aventador SVJ Roadster"}, {3146,"Lamborghini Aventador"}, {3147,"Lamborghini Diablo SV"}, {3148,"Lamborghini Gallardo"}, {3149,"Lamborghini Huracan"},
    {3150,"Lamborghini Murcielago"}, {3151,"Lamborghini Reventon"}, {3152,"Tenzo AP.9"}, {3153,"Lamborghini Urus"}, {3154,"Lamborghini Gallardo"}, 
    {3155,"Lamborghini Murcielago.C"}, {3156,"Sh150i"}, {3157,"Yaz125"}, {3158,"Ducati 1299"}, 
    {3159,"Mclaren Lewis Paul"}, {3160,"Vario150"}, {3161,"H2r"}, {3162,"Ducati Hyp"}, 
    {3163,"Yamaha R1"}, {3164,"Z1000"}, {3165,"Nvx 155"}, {3166,"Exciter"}, {3176,"Bugati napu"}, 
    {3177,"GT-R Nismo"}, {3179,"Porche"}, {3181,"Supra"}, {3182,"Camry"}, {3183,"Honda Civic"}, 
    {3184,"Land Cruiser 200"}, {3185,"Lexus LC 500"}, {3186,"Lexis"}, {3188,"Lexus RX 350"}, {3189,"Lexus LX 600"}, 
    {3190,"Toyota 4runner"}, {3191,"Police"}, {3192,"Koemxleo"}, {3194,"BMW S1000RR"}, 
    {3195,"Rolls-Royce Phantom"}, {3196,"Hondakart"}, {3197,"Wchitr"}, {3198,"Ugvcore"}, {3199,"BMW X7"}, 
    {3200,"Trailergo"}, {3201,"Cadilac"}, {3202,"G63"}, {3203,"Hummer"}, {3204,"Lcstrade"}, 
    {3205,"Merc"}, {3206,"Rareovetrade"}, {3207,"Pagani"}, {3208,"Ford Raptor"}, {3209,"BMW M760Li"}, 
    {3210,"Maybach S650"}, {3211,"PRC"}, {3212,"Rolls-Royce Wraith"}, {3213,"Sh350i"}, {3215,"Mergls600"}, {3216,"Maybach S680"}, 
    {3217,"Adv350"}, {3218,"Infnv2"}, {3219,"Chevlewis"}, {3220,"Ctistreet"}, {3222,"Bmw100ct"}, {3223,"Ferri"}, 
    {3224,"Merc G63"}, {3225,"Ufonapo"}, {3226,"Batmannt"}, {3227,"Amtsperleg"}, {3228,"Ford MST"}, {3229,"McLaren 675LT"}, 
    {3230,"McLaren P1 GTR"}, {3231,"Tronlegcynhat"}, {3232,"Rrdawn"}, {4546,"Amgone"}, {4547,"Audir8ct"}, {4548,"Bikeskul"}, 
    {4549,"BMW 5 Series"}, {4763,"BMW X5"}, {4764,"BMX X6"}, {4765,"Brabus G93"}, {4766,"Bugatti Veyron"}, {4767,"Cybtrunk"}, {4768,"Ferrari Monza SP2"}, 
    {4769,"WCT52"}, {4770,"Lamborghini Huracán Tecnica"}, {4771,"Lexus LX570"}, {4772,"Mercedes GLE"}, {4773,"Mg630ct"}, {4774,"Prado"}, {4775,"Prcaynea"}, 
    {4776,"Qadrocypu"}, {4777,"Rptr"}, {4778,"RANGE ROVER SV"}, {4779,"Rrovlbg"}, {4780,"Trunkarocs"}, {4781,"Tundratrd"}, 
    {4782,"Tytlcsgr"}, {4783,"Tytraze"}, {4784,"Zx10r"}, {4785,"Xedapyeu"}, {4786,"Winner"}, {4787,"MSX 125"}, 
    {4788,"Bmw1250gs"}, {4789,"Snow kart"}, {4792,"Mxjack"}
};

enum PlayerVehicle_Data {
    pv_id,
    pv_sqlid,
    pv_model,
    Float:pvPosX,
    Float:pvPosY,
    Float:pvPosZ,
    Float:pvPosR,
    pv_lock,
    pv_paintjob,
    pv_color1,
    pv_color2,
    pv_ticket,
    pv_restricted,
    pv_fuel,
    pv_impound,
    pv_vw,
    pv_int,
    pv_spawned,
    pv_vehid,
    pv_health,
    pv_odo
}

new PlayerVehicle[MAX_PLAYERS][MAX_PLAYER_VEHICLES][PlayerVehicle_Data];


new MaxVehicleFuel[212][] =
{
    70,  45, 40, 298,  40,  40, 200, 80, 60,  40,  40,
    40,  40, 45,  45,  40,  70, 100, 45, 40,  40,  40,
    45,  45, 20, 200,  40,  70,  70, 40, 45,  60,  90,
    100,  35,  0,  40,  50,  40,  40, 45,  5,  40,  50,
    65,  40, 35,  90,  20,  60,   0, 40, 20,  20,  20,
    60,  50, 20,  40,  45,  90,  30, 20, 35,   5,   5,
    40,  40, 20,  90,  90,  20,  20, 20, 40,  40,  40,
    40,  40, 45,  40,   0,  45,  45, 20, 20,  30,  90,
    90,  70, 70,  40,  40,  20,  40, 45, 40,  90,  50,
    50,  40,  5,  40,  40,  40,  50, 40, 40,  50,   0,
    0,  90, 90,  90, 298, 298,  40, 40, 40, 400, 400,
    30,  30, 30,  50,  50,  40,  40, 50, 40,  20,  20,
    60,  40, 40,  40,  40,  50,  50, 20, 40,  40,  40,
    50,  70, 40,  40,  40,  90,  40, 40, 40,  40, 300,
    50,  40, 80,  80,  40,  40,  40, 40, 40,  90,  90,
    40,  45, 45,  20,   0,  50,  10, 20, 50,  20,  40,
    40, 300, 50,  50,  40,  30,  50, 20,  0,  40,  30,
    40,  50, 40,   0,   0, 300, 200,  0, 20,  40,  40,
    40,  50, 40,  60,  40,  40,  40, 45,  0,   0,   0,
    50,   0,  0
};


new PlayerVehicleCount[MAX_PLAYERS];

new Seatbelt[MAX_PLAYERS];

new VehicleFuel[MAX_VEHICLES];