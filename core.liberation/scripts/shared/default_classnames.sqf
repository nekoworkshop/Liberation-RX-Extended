// *** LRX DEFAULT CLASSNAMES ***
FOB_typename = "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";
FOB_boat_typename = "C_Boat_Civil_01_rescue_F";
FOB_outpost = "Land_BagBunker_Tower_F";
FOB_box_outpost = "Land_Cargo10_grey_F";
FOB_sign = "SignAd_Sponsor_F";
Radio_tower = "Land_Communication_F";
Warehouse_typename = "Land_Warehouse_03_F";
Warehouse_desk_typename = "Land_PortableDesk_01_black_F";
Arsenal_typename = "B_supplyCrate_F";
Box_Weapon_typename = "Box_NATO_Wps_F";
Box_Ammo_typename = "Box_NATO_Ammo_F";
Box_Support_typename = "Box_NATO_Support_F";
Box_Launcher_typename = "Box_NATO_WpsLaunch_F";
Box_Special_typename = "Box_NATO_WpsSpecial_F";
Box_Explosives_typename = "Box_NATO_AmmoOrd_F";
Box_Grenades_typename = "Box_NATO_Grenades_F";
Box_Equipment_typename = "Box_NATO_Equip_F";
Respawn_truck_typename = "B_Truck_01_medical_F";
medic_truck_typename = "B_Truck_01_medical_F";
ammo_truck_typename = "B_Truck_01_ammo_F";
fuel_truck_typename = "B_Truck_01_fuel_F";
repair_truck_typename = "B_Truck_01_Repair_F";
repair_sling_typename = "B_Slingload_01_Repair_F";
fuel_sling_typename = "B_Slingload_01_Fuel_F";
ammo_sling_typename = "B_Slingload_01_Ammo_F";
medic_sling_typename = "B_Slingload_01_Medevac_F";
mobile_respawn = "Land_TentDome_F";
mobile_respawn_bag = "B_Kitbag_Base";
medicalbox_typename = "Box_B_UAV_06_medical_F";
helipad_typename = "Land_HelipadSquare_F";
playerbox_typename = "Land_PlasticCase_01_medium_olive_CBRN_F";
playerbox_cargospace = 2500;
ammobox_b_typename = "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";
ammobox_i_typename = "Box_IND_AmmoVeh_F";
waterbarrel_typename = "Land_BarrelWater_F";
fuelbarrel_typename = "Land_MetalBarrel_F";
foodbarrel_typename = "Land_FoodSacks_01_large_brown_idap_F";
opfor_transport_truck = "O_Truck_03_transport_F";
opfor_texture_overide = [];
opfor_statics = [];
opfor_boats = [];
repair_offroad = "C_Offroad_01_repair_F";
commander_classname = "B_officer_F";
crewman_classname = "B_crew_F";
pilot_classname = "B_Helipilot_F";
PAR_Medikit = "Medikit";
PAR_AidKit = "FirstAidKit";
basic_weapon_typename = "Box_East_Wps_F";
land_cutter_typename = "Land_ClutterCutter_large_F";
canister_fuel_typename = "Land_CanisterFuel_Red_F";
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForSmoke";		//"test_EmptyObjectForFireBig";
civilians = ["C_man_1"];
civilian_vehicles = ["C_SUV_01_F"];
SHOP_Man = "C_Man_formal_1_F";
SELL_Man = "C_Story_Mechanic_01_F";
WRHS_Man = "B_RangeMaster_F";
uavs_def = ["UAV_01_base_F","UAV_02_base_F","UAV_03_base_F","UAV_04_base_F","UAV_05_Base_F","UAV_06_base_F","UGV_01_base_F"];
boats_west = [];
ai_resupply_sources = [];
ai_healing_sources = [];
vehicle_rearm_sources = [];
vehicle_big_units = [];
GRLIB_music_startup = "BackgroundTrack02_F";      //"LeadTrack01a_F" (This Is War)
GRLIB_music_endgame = "LeadTrack06_F_Tank";
GRLIB_vehicle_whitelist = [];
GRLIB_vehicle_blacklist = [];
static_vehicles_AI = [];
units_loadout_overide = [];
sticky_bombs_typename = ["SatchelCharge_Remote_Ammo", "DemoCharge_Remote_Ammo"];
LOADOUT_fixed_price = [];
LOADOUT_expensive_items = [];
LOADOUT_free_items = [];

// see https://community.bistudio.com/wiki/nearestTerrainObjects for list
GRLIB_clutter_cutter = ["Tree","Bush","Hide","House","Fence","Ruins","Rock","Rocks","Building"];

// *** LRX DEFAULT BUILDINGS CLASSNAMES ***
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\default_building_classnames.sqf";
