#define     MAX_HOUSES          (100)
#define     MAX_HOUSE_NAME      (48)
#define     MAX_HOUSE_PASSWORD  (16)
#define     MAX_INT_NAME        (32)
#define     DIALOG_HOUSE        (7500)
#define     INVALID_HOUSE_ID    (-1)
#define     MAX_HOUSE_ADDRESS   (300)

#define     LOCK_MODE_NOLOCK    (0)
#define     LOCK_MODE_PASSWORD  (1)
#define     LOCK_MODE_OWNER     (2)

#define     SELECT_MODE_EDIT    (0)
#define     SELECT_MODE_SELL    (1)

#define INVALID_HANDLE -1

enum e_sazone
{
    SAZONE_NAME[28],
    Float: SAZONE_AREA[6]
};

enum    e_house
{
    Name[MAX_HOUSE_NAME],
    Owner[MAX_PLAYER_NAME],
    Password[MAX_HOUSE_PASSWORD],
    Float: houseX,
    Float: houseY,
    Float: houseZ,
    Price,
    Interior,
    LockMode,
    SafeMoney,
    LastEntered,
    Text3D: HouseLabel,
    HousePickup,
    HouseIcon,
    ExVW,
    InVW,
    ExInterior,
    InInterior,
    SalePrice,
    Address,
    furnitureVW,
    SQL_HOST,
    bool: Save
};

enum    e_interior
{
    IntName[MAX_INT_NAME],
    Float: intX,
    Float: intY,
    Float: intZ,
    intID,
    Text3D: intLabel,
    intPickup
};

enum    e_furnituredata
{
    ModelID,
    Name[32],
    Price
};

enum    e_furniture
{
    SQLID,
    HouseID,
    ArrayID,
    Float: furnitureX,
    Float: furnitureY,
    Float: furnitureZ,
    Float: furnitureRX,
    Float: furnitureRY,
    Float: furnitureRZ
};



new
    SQLHandle,
    HouseTimer,
    HouseData[MAX_HOUSES][e_house],
    Iterator: Houses<MAX_HOUSES>,
    InHouse[MAX_PLAYERS] = {INVALID_HOUSE_ID, ...},
    SelectMode[MAX_PLAYERS] = {SELECT_MODE_EDIT, ...};

new
    HouseInteriors[][e_interior] = {
        {"GVO HOUSE", 2233.4900, -1114.4435, 1050.8828, 5},
        {"GVO HOUSE", 2196.3943, -1204.1359, 1049.0234, 6},
        {"GVO HOUSE", 2318.1616, -1026.3762, 1050.2109, 9},
        {"GVO HOUSE", 421.8333, 2536.9814, 10.0000, 10},
        {"GVO HOUSE", 225.5707, 1240.0643, 1082.1406, 2},
        {"GVO HOUSE", 2496.2087, -1692.3149, 1014.7422, 3},
        {"GVO HOUSE", 226.7545, 1114.4180, 1080.9952, 5},
        {"GVO HOUSE", 2269.9636, -1210.3275, 1047.5625, 10}
    };

new
    HouseFurnitures[][e_furnituredata] = {
        {3111, "Building Plan", 500},
        {2894, "Book", 20},
        {2277, "Cat Picture", 100},
        {1753, "Leather Couch", 150},
        {1703, "Black Couch", 200},
        {1255, "Lounger", 75},
        {19581, "Frying Pan", 10},
        {19584, "Sauce Pan", 12},
        {19590, "Woozie's Sword", 1000},
        {19525, "Wedding Cake", 50},
        {1742, "Bookshelf", 80},
        {1518, "TV 1", 130},
        {19609, "Drum Kit", 500},
        {19787, "Small LCD TV", 2000},
        {19786, "Big LCD TV", 4000},
        {2627, "Treadmill", 130}
    };
    
new
    LockNames[3][32] = {"{2ECC71}Khong Bi Khoa", "{E74C3C}Da Khoa Mat Khau", "{E74C3C}Chi Chu So Huu"};