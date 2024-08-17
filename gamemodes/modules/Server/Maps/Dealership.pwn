#include <YSI\YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    //Isso no Topo Do Script
    new Pilastra[28];
    new ChaoTerrio[8];
    new VagaCarrosSalao[32];
    new ChaoTeto[20];
    new Rampa[4];
    new TextoConce[4];
    new ChaoExterno[2];

    //ISSO NA OnGameModeInit ou OnFilterScriptInit
    ChaoTerrio[0] = CreateObject(3113, 1802.2002, -1758.7002, 12.1, 0, 284.996, 0, 200.0);
    ChaoTerrio[1] = CreateObject(3113, 1802.2002, -1781.2998, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[2] = CreateObject(3113, 1791, -1758.7002, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[3] = CreateObject(3113, 1779.7998, -1758.7002, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[4] = CreateObject(3113, 1791, -1781.2998, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[5] = CreateObject(3113, 1779.7998, -1781.2998, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[6] = CreateObject(3113, 1768.5996, -1758.7002, 12.1, 0, 284.991, 0, 200.0);
    ChaoTerrio[7] = CreateObject(3113, 1768.5996, -1781.2998, 12.1, 0, 284.991, 0, 200.0);
    for (new TexturizarID; TexturizarID < 8; TexturizarID++)
    {
        SetObjectMaterial(ChaoTerrio[TexturizarID], 0, 2774, "airp_prop", "cj_white_wall2", 0xFFFFFFFF);
    }

    Pilastra[0] = CreateObject(2774, 1790.7002, -1792.7002, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[1] = CreateObject(2774, 1805.9004, -1747.7998, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[2] = CreateObject(2774, 1774.7998, -1792.7002, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[3] = CreateObject(2774, 1761.4004, -1792.7002, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[4] = CreateObject(2774, 1761.4004, -1763.5, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[5] = CreateObject(2774, 1761.4004, -1778.0996, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[6] = CreateObject(2774, 1805.9004, -1792.7002, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[7] = CreateObject(2774, 1790.7002, -1747.7998, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[8] = CreateObject(2774, 1774.7998, -1747.7998, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[9] = CreateObject(2774, 1761.4, -1747.8, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[10] = CreateObject(2774, 1805.9004, -1763.5, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[11] = CreateObject(2774, 1805.9004, -1778.0996, 15.1, 0, 179.995, 0, 200.0);
    Pilastra[12] = CreateObject(2774, 1773.7002, -1747.7998, 19.2, 0, 270, 179.995, 200.0);
    Pilastra[13] = CreateObject(2774, 1793.5996, -1747.9004, 19.2, 0, 270, 359.995, 200.0);
    Pilastra[14] = CreateObject(2774, 1793.5, -1792.5996, 19.2, 0, 270, 359.984, 200.0);
    Pilastra[15] = CreateObject(2774, 1773.7002, -1792.5996, 19.2, 0, 270, 179.995, 200.0);
    Pilastra[16] = CreateObject(2774, 1805.7998, -1780.2998, 19.2, 0, 270, 269.989, 200.0);
    Pilastra[17] = CreateObject(2774, 1805.7998, -1760.0996, 19.2, 0, 270, 89.984, 200.0);
    Pilastra[18] = CreateObject(2774, 1761.5, -1760.0996, 19.2, 0, 270, 89.984, 200.0);
    Pilastra[19] = CreateObject(2774, 1761.4004, -1780.4004, 19.2, 0, 270, 269.989, 200.0);
    Pilastra[20] = CreateObject(2774, 1761.5, -1760.1, 26.7, 0, 270, 89.984, 200.0);
    Pilastra[21] = CreateObject(2774, 1761.4004, -1780.4004, 26.7, 0, 270, 269.989, 200.0);
    Pilastra[22] = CreateObject(2774, 1773.7002, -1792.5996, 26.7, 0, 270, 179.995, 200.0);
    Pilastra[23] = CreateObject(2774, 1793.5, -1792.5996, 26.7, 0, 270, 359.984, 200.0);
    Pilastra[24] = CreateObject(2774, 1805.7998, -1780.2998, 26.7, 0, 270, 269.989, 200.0);
    Pilastra[25] = CreateObject(2774, 1805.7998, -1760.0996, 26.7, 0, 270, 89.984, 200.0);
    Pilastra[26] = CreateObject(2774, 1793.5996, -1747.9004, 26.7, 0, 270, 359.995, 200.0);
    Pilastra[27] = CreateObject(2774, 1773.7002, -1747.7998, 26.7, 0, 270, 179.995, 200.0);
    for (new TexturizarID; TexturizarID < 28; TexturizarID++)
    {
        SetObjectMaterial(Pilastra[TexturizarID], 1, 2774, "airp_prop", "cj_white_wall2", 0xFF000080), SetObjectMaterial(Pilastra[TexturizarID], 2, 2774, "none", "none", 0xFF000080), SetObjectMaterial(Pilastra[TexturizarID], 0, 2774, "none", "none", 0xFF000080);
    }

    ChaoTeto[0] = CreateObject(7191, 1764.2002, -1769.9004, 19.6, 0, 90, 0, 200.0);
    ChaoTeto[1] = CreateObject(7191, 1768.1, -1769.9, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[2] = CreateObject(7191, 1772, -1769.9, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[3] = CreateObject(7191, 1775.9, -1769.9, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[4] = CreateObject(7191, 1779.8, -1769.9, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[5] = CreateObject(7191, 1783.7002, -1769.9004, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[6] = CreateObject(7191, 1787.5996, -1769.7998, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[7] = CreateObject(7191, 1791.5, -1769.7998, 19.6, 0, 89.995, 0, 200.0);
    ChaoTeto[8] = CreateObject(7191, 1804.4, -1770.5, 19.6, 0, 89.995, 180, 200.0);
    ChaoTeto[9] = CreateObject(7191, 1764.2, -1769.9, 26.6, 0, 90, 0, 200.0);
    ChaoTeto[10] = CreateObject(7191, 1768.0996, -1769.9004, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[11] = CreateObject(7191, 1772, -1769.9004, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[12] = CreateObject(7191, 1775.9004, -1769.9004, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[13] = CreateObject(7191, 1779.7998, -1769.9004, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[14] = CreateObject(7191, 1783.7002, -1769.9004, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[15] = CreateObject(7191, 1787.5996, -1769.7998, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[16] = CreateObject(7191, 1791.5, -1769.7998, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[17] = CreateObject(7191, 1803.2, -1770.5, 26.6, 0, 89.995, 179.995, 200.0);
    ChaoTeto[18] = CreateObject(7191, 1795.4, -1769.8, 26.6, 0, 89.995, 0, 200.0);
    ChaoTeto[19] = CreateObject(7191, 1799.3, -1769.8, 26.6, 0, 89.995, 0, 200.0);
    for (new TexturizarID; TexturizarID < 20; TexturizarID++)
    {
        SetObjectMaterial(ChaoTeto[TexturizarID], 0, 2774, "airp_prop", "cj_white_wall2", 0xFFFFFFFF);
    }

    Rampa[0] = CreateObject(3095, 1798, -1787.2998, 19.1, 0, 0, 0, 200.0);
    Rampa[1] = CreateObject(3095, 1798, -1778.6, 18, 345.5, 0, 0, 200.0);
    Rampa[2] = CreateObject(3095, 1798, -1769.9004, 15.75, 345.493, 0, 0, 200.0);
    Rampa[3] = CreateObject(3095, 1798, -1761.2998, 13.25, 341.993, 0, 0, 200.0);
    for (new TexturizarID; TexturizarID < 4; TexturizarID++)
    {
        SetObjectMaterial(Rampa[TexturizarID], 0, 2774, "airp_prop", "cj_white_wall2", 0xFFFFFFFF), SetObjectMaterial(Rampa[TexturizarID], 1, 2774, "airp_prop", "cj_white_wall2", 0xFF000080);
    }

    VagaCarrosSalao[0] = CreateObject(4084, 1767.5, -1752, 12.7, 0, 90.5, 310, 200.0);
    VagaCarrosSalao[1] = CreateObject(4084, 1765.5, -1759.6, 12.7, 0, 90.5, 69.999, 200.0);
    VagaCarrosSalao[2] = CreateObject(4084, 1777.8, -1752.7, 12.7, 0, 90.5, 339.999, 200.0);
    VagaCarrosSalao[3] = CreateObject(4084, 1787, -1753.1, 12.7, 0, 90.494, 29.994, 200.0);
    VagaCarrosSalao[4] = CreateObject(4084, 1766.2, -1782.6, 12.7, 0, 90.494, 119.995, 200.0);
    VagaCarrosSalao[5] = CreateObject(4084, 1769.4, -1787.7, 12.7, 0, 90.489, 159.993, 200.0);
    VagaCarrosSalao[6] = CreateObject(4084, 1778.6, -1788.2, 12.7, 0, 90.483, 199.988, 200.0);
    VagaCarrosSalao[7] = CreateObject(4084, 1786.5, -1788.2, 12.7, 0, 90.478, 159.984, 200.0);
    VagaCarrosSalao[8] = CreateObject(4084, 1793.7, -1788.5, 12.7, 0, 90.472, 199.983, 200.0);
    VagaCarrosSalao[9] = CreateObject(4084, 1800.4, -1788.8, 12.7, 0, 90.467, 149.979, 200.0);
    VagaCarrosSalao[10] = CreateObject(4084, 1802, -1781.7, 12.7, 0, 90.461, 79.977, 200.0);
    VagaCarrosSalao[11] = CreateObject(4084, 1801.2, -1774, 12.7, 0, 90.461, 109.975, 200.0);
    VagaCarrosSalao[12] = CreateObject(4084, 1766, -1759.6, 19.7, 0, 90.244, 101.994, 200.0);
    VagaCarrosSalao[13] = CreateObject(4084, 1769.3, -1753.3, 19.7, 0, 90.242, 19.99, 200.0);
    VagaCarrosSalao[14] = CreateObject(4084, 1779.5, -1753.4, 19.7, 0, 90.236, 19.984, 200.0);
    VagaCarrosSalao[15] = CreateObject(4084, 1786.3, -1752.8, 19.7, 0, 90.236, 349.984, 200.0);
    VagaCarrosSalao[16] = CreateObject(4084, 1766.2, -1766.7, 19.7, 0, 90.242, 101.992, 200.0);
    VagaCarrosSalao[17] = CreateObject(4084, 1766.3, -1773.7, 19.7, 0, 90.242, 71.992, 200.0);
    VagaCarrosSalao[18] = CreateObject(4084, 1766.3, -1781.5, 19.7, 0, 90.236, 101.988, 200.0);
    VagaCarrosSalao[19] = CreateObject(4084, 1766.5, -1787, 19.7, 0, 90.231, 121.986, 200.0);
    VagaCarrosSalao[20] = CreateObject(4084, 1771.9, -1788.2, 19.7, 0, 90.225, 151.981, 200.0);
    VagaCarrosSalao[21] = CreateObject(4084, 1778.4, -1788, 19.7, 0, 90.22, 191.979, 200.0);
    VagaCarrosSalao[22] = CreateObject(4084, 1785.4, -1787.7, 19.7, 0, 90.214, 161.975, 200.0);
    VagaCarrosSalao[23] = CreateObject(4084, 1778.5, -1765.1, 12.7, 0, 90.494, 69.994, 200.0);
    VagaCarrosSalao[24] = CreateObject(4084, 1789.2, -1772.7, 12.7, 0, 90.494, 111.994, 200.0);
    VagaCarrosSalao[25] = CreateObject(4084, 1780.2, -1778.4, 12.7, 0, 90.489, 141.989, 200.0);
    VagaCarrosSalao[26] = CreateObject(4084, 1771, -1771.2, 12.7, 0, 90.483, 71.987, 200.0);
    VagaCarrosSalao[27] = CreateObject(4084, 1776.9, -1763.9, 19.7, 0, 90.242, 71.992, 200.0);
    VagaCarrosSalao[28] = CreateObject(4084, 1777.7, -1771.4, 19.7, 0, 90.236, 111.988, 200.0);
    VagaCarrosSalao[29] = CreateObject(4084, 1778.5, -1778.9, 19.7, 0, 90.231, 111.984, 200.0);
    VagaCarrosSalao[30] = CreateObject(4084, 1788.9, -1766.2, 19.7, 0, 90.231, 151.984, 200.0);
    VagaCarrosSalao[31] = CreateObject(4084, 1789, -1775.1, 19.7, 0, 90.225, 151.979, 200.0);
    for (new TexturizarID; TexturizarID < 32; TexturizarID++)
    {
        SetObjectMaterial(VagaCarrosSalao[TexturizarID], 0, 3113, "carrierxr", "ws_shipmetal1", 0xFFFF0000);
    }

    TextoConce[0] = CreateObject(9527, 1761, -1770.7, 19.2, 0, 0, 270, 200.0);
    TextoConce[1] = CreateObject(9527, 1783, -1793, 19.2, 0, 0, 0, 200.0);
    TextoConce[2] = CreateObject(9527, 1806.2, -1770.5, 19.2, 0, 0, 90, 200.0);
    TextoConce[3] = CreateObject(9527, 1782.1, -1747.3, 19.2, 0, 0, 180, 200.0);
    for (new TexturizarID; TexturizarID < 4; TexturizarID++)
    {
        SetObjectMaterialText(TextoConce[TexturizarID], "DEALERSHIP", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial black", 35, 0, 0xFFFFFFFF, 0xFF0000FF, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
    }

    ChaoExterno[0] = CreateObject(3983, 1722.40002, -1775.5, 14.5370, 0, 0, 0);
    ChaoExterno[1] = CreateObject(4012, 1777.4343, -1782.3, 12.6499, 0, 0, 0);
    SetObjectMaterial(ChaoExterno[0], 1, 10936, "stadiumground_sfse", "ws_shipmetal1", 0xFF1C1C1C);
    SetObjectMaterial(ChaoExterno[1], 2, 10936, "stadiumground_sfse", "ws_shipmetal1", 0xFF1C1C1C);

    CreateObject(3858, 1782.7002, -1792.7002, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1798.5996, -1747.7998, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1767.9004, -1792.7002, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1806.0996, -1755.5, 23, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1806.0996, -1770.0996, 23, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1806.0996, -1785.2998, 23, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1798.5996, -1792.4004, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1782.7002, -1747.7998, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1767.9004, -1747.5996, 23, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1761.5996, -1785.2998, 23, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1761.6, -1755.5, 23, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1767.9004, -1747.5996, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1782.7002, -1747.7998, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1798.5996, -1747.7998, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1806.0996, -1755.5, 15.6, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1806.0996, -1770.0996, 15.6, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1806.0996, -1785.2998, 15.6, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1798.5996, -1792.4004, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1782.7002, -1792.7002, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1767.9004, -1792.7002, 15.6, 0, 0, 44.995, 200.0);
    CreateObject(3858, 1761.5996, -1785.2998, 15.6, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1761.5996, -1755.5, 15.6, 0, 0, 314.995, 200.0);
    CreateObject(3858, 1761.5, -1770.3, 23, 0, 0, 314.995, 200.0);
    CreateObject(996, 1793.2, -1749.4, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1793.2002, -1757.5996, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1793.2, -1765.8, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1793.2, -1774, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1802.6, -1749.4, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1802.6, -1757.6, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1802.6, -1765.8, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1802.6, -1774, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1802.6, -1782.2, 20.3, 0, 0, 270, 200.0);
    CreateObject(996, 1793.7, -1775.3, 18.4, 0, 345.5, 270, 200.0);
    CreateObject(996, 1802.3, -1775.3, 18.4, 0, 345.498, 270, 200.0);
    CreateObject(996, 1802.3, -1767.3, 16.3, 0, 345.498, 270, 200.0);
    CreateObject(996, 1793.7, -1767.4, 16.3, 0, 345.498, 270, 200.0);
    CreateObject(996, 1793.7, -1759.5, 13.9, 0, 342.998, 270, 200.0);
    CreateObject(996, 1802.3, -1759.4, 13.9, 0, 342.993, 270, 200.0);
    CreateObject(1223, 1760.8, -1747.2, 12.5, 0, 0, 140.75, 200.0);
    CreateObject(1223, 1760.8, -1763.5, 12.5, 0, 0, 179.995, 200.0);
    CreateObject(1223, 1760.8, -1778.1, 12.5, 0, 0, 179.995, 200.0);
    CreateObject(1223, 1760.8, -1793.4, 12.5, 0, 0, 217.995, 200.0);
    CreateObject(1223, 1774.8, -1793.3, 12.5, 0, 0, 269.995, 200.0);
    CreateObject(1223, 1790.8, -1793.3, 12.5, 0, 0, 269.989, 200.0);
    CreateObject(1223, 1806.6, -1793.3, 12.5, 0, 0, 309.989, 200.0);
    CreateObject(1223, 1806.5, -1778, 12.5, 0, 0, 359.989, 200.0);
    CreateObject(1223, 1806.5, -1763.5, 12.5, 0, 0, 359.984, 200.0);
    CreateObject(1223, 1806.5, -1747.1, 12.5, 0, 0, 39.984, 200.0);
    CreateObject(1223, 1790.7, -1747.2, 12.5, 0, 0, 89.984, 200.0);
    CreateObject(1223, 1774.8, -1747.2, 12.5, 0, 0, 89.984, 200.0);
    CreateObject(10183, 1725.5, -1765, 12.7, 359.497, 359.995, 224.991, 200.0);
    CreateObject(10183, 1725.5, -1772.8, 12.6, 359.995, 0.492, 44.989, 200.0);
    CreateObject(10183, 1724.3, -1791.9, 12.6, 359.495, 0.234, 224.233, 200.0);
    CreateObject(10183, 1787.1, -1808.9, 12.6, 359.495, 0.484, 224.235, 200.0);
    CreateObject(1232, 1716, -1742.7998, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1726, -1742.7998, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1736.0996, -1742.7998, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1746.0996, -1742.7998, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1706.0996, -1742.7998, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1704.2, -1795.7, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1714.3, -1796, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1724.3, -1796.2, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1734.3, -1796.3, 15.2, 0, 0, 0, 200.0);
    CreateObject(1232, 1744.2, -1796.5, 15.2, 0, 0, 0, 200.0);
    CreateObject(1231, 1705.2002, -1768.7002, 15.5, 0, 0, 90, 200.0);
    CreateObject(1231, 1715.4, -1768.8, 15.5, 0, 0, 90, 200.0);
    CreateObject(1231, 1725.4, -1768.9, 15.5, 0, 0, 90, 200.0);
    CreateObject(1231, 1735.4, -1769, 15.5, 0, 0, 90, 200.0);
    CreateObject(1231, 1745.4, -1769.1, 15.5, 0, 0, 90, 200.0);
    CreateObject(7662, 1709.3, -1743, 13.4, 0, 0, 270, 200.0);
    CreateObject(7662, 1726.6, -1742.9, 13.4, 0, 0, 270, 200.0);
    CreateObject(7662, 1702.8, -1786.3, 13.4, 0, 0, 0, 200.0);
    CreateObject(7662, 1810.4, -1783.2, 13.4, 0, 0, 0, 200.0);
    CreateObject(7662, 1810.3, -1799.8, 13.4, 0, 0, 0, 200.0);
    CreateObject(620, 1795.2, -1742.6, 12.5, 0, 0, 30.234, 200.0);
    CreateObject(620, 1784, -1742.5, 12.5, 0, 0, 30.234, 200.0);
    CreateObject(620, 1773.5, -1742.6, 12.5, 0, 0, 30.234, 200.0);
    CreateObject(620, 1806.5, -1742.5, 12.5, 0, 0, 30.234, 200.0);
    CreateObject(1698, 1749.9, -1748, 13.5, 0, 0, 220, 150.0);
    CreateObject(3440, 1747.7, -1748.4, 11.2, 0, 0, 0, 200.0);
    CreateObject(1698, 1748.4, -1749.3, 13.5, 0, 0, 219.996, 200.0);
    CreateObject(1698, 1750.4, -1751.7, 13, 339.995, 0, 219.996, 200.0);
    CreateObject(3440, 1749.2, -1747, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1750.7, -1748.8, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1749.1, -1750, 11.2, 0, 0, 0, 200.0);
    CreateObject(1698, 1751.9, -1750.4, 13, 339.994, 0, 219.99, 200.0);
    CreateObject(1698, 1738.8, -1748, 13.5, 0, 0, 179.996, 200.0);
    CreateObject(1698, 1736.8, -1748, 13.5, 0, 0, 179.995, 200.0);
    CreateObject(1698, 1738.8, -1751.1, 13, 339.994, 0, 179.99, 200.0);
    CreateObject(1698, 1736.8, -1751.1, 13, 339.988, 0, 179.989, 200.0);
    CreateObject(3440, 1738.9, -1747, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1738.9, -1749, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1736.8, -1747, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1736.9, -1749.3, 11.2, 0, 0, 0, 200.0);
    CreateObject(1698, 1728.6, -1748.4, 13.5, 0, 0, 179.995, 200.0);
    CreateObject(1698, 1726.7, -1748.4, 13.5, 0, 0, 179.995, 200.0);
    CreateObject(1698, 1726.7, -1751.5, 13, 339.988, 0, 179.989, 200.0);
    CreateObject(1698, 1728.6, -1751.5, 13, 339.988, 0, 179.989, 200.0);
    CreateObject(3440, 1728.8, -1747.4, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1726.7, -1747.3, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1726.7, -1749.6, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1728.6, -1749.5, 11.2, 0, 0, 0, 200.0);
    CreateObject(1698, 1716.9, -1748.1, 13.5, 0, 0, 159.995, 200.0);
    CreateObject(1698, 1718.8, -1748.8, 13.5, 0, 0, 159.994, 200.0);
    CreateObject(1698, 1717.7, -1751.7, 13, 339.988, 0, 159.989, 200.0);
    CreateObject(1698, 1715.8, -1751, 13, 339.988, 0, 159.988, 200.0);
    CreateObject(3440, 1717.3, -1747.2, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1719.2, -1747.7, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1718.3, -1750.1, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1716.4, -1749.4, 11.2, 0, 0, 0, 200.0);
    CreateObject(1698, 1706.2, -1749.1, 13.5, 0, 0, 229.994, 200.0);
    CreateObject(1698, 1707.4, -1747.7, 13.5, 0, 0, 229.993, 200.0);
    CreateObject(1698, 1708.6, -1751.2, 13, 339.988, 0, 229.988, 200.0);
    CreateObject(1698, 1709.8, -1749.7, 13, 339.988, 0, 229.988, 200.0);
    CreateObject(3440, 1706.6, -1747, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1705.2, -1748.3, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1707.1, -1750, 11.2, 0, 0, 0, 200.0);
    CreateObject(3440, 1708.2, -1748.4, 11.2, 0, 0, 0, 200.0);
    CreateObject(2185, 1789.1, -1779.7, 12.8, 0, 0, 270, 200.0);
    CreateObject(2185, 1788.5, -1763.9, 12.8, 0, 0, 270, 200.0);
    CreateObject(2185, 1788.2, -1759.4, 19.7, 0, 0, 270, 200.0);
    CreateObject(1714, 1789.6, -1764.5, 12.8, 0, 0, 284, 200.0);
    CreateObject(1714, 1789.5996, -1764.5, 12.8, 0, 0, 283.997, 200.0);
    CreateObject(1714, 1787.3, -1765.1, 12.8, 0, 0, 103.997, 200.0);
    CreateObject(1714, 1787.2, -1764.3, 12.8, 0, 0, 72.497, 200.0);
    CreateObject(1714, 1787.9, -1780, 12.8, 0, 0, 72.493, 200.0);
    CreateObject(1714, 1787.9004, -1781.0996, 12.8, 0, 0, 104.491, 200.0);
    CreateObject(1714, 1789.5, -1760, 19.8, 0, 0, 270.491, 200.0);
    CreateObject(1714, 1786.9, -1760.2, 19.8, 0, 0, 80.489, 200.0);
    CreateObject(1714, 1786.8, -1759.4, 19.8, 0, 0, 80.486, 200.0);
    CreateObject(1714, 1789.9, -1780.5, 12.8, 0, 0, 304.491, 200.0);
    LogConsole("Map Dealership loaded","Map");
    return 1;
}

hook OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 4025, 1777.8359, -1773.9063, 12.5234, 0.25);
    RemoveBuildingForPlayer(playerid, 4070, 1719.7422, -1770.7813, 23.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 1531, 1724.7344, -1741.5000, 14.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 4215, 1777.5547, -1775.0391, 36.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 3986, 1719.7422, -1770.7813, 23.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 4019, 1777.8359, -1773.9063, 12.5234, 0.25);
    return 1;
}