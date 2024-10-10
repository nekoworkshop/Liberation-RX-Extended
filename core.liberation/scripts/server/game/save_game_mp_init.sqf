if (!isServer) exitWith {};

GRLIB_classnames_to_save = [] + all_buildings_classnames + fob_buildings_classnames;
GRLIB_classnames_to_save_blu = [
	FOB_typename,
	FOB_outpost,
	FOB_carrier,
	FOB_sign,
	huron_typename,
	Warehouse_typename
] + all_friendly_classnames + all_hostile_classnames;
GRLIB_classnames_to_save_blu = GRLIB_classnames_to_save_blu arrayIntersect GRLIB_classnames_to_save_blu;
GRLIB_classnames_to_save_blu = GRLIB_classnames_to_save_blu apply { toLower _x };

GRLIB_classnames_to_save append GRLIB_classnames_to_save_blu;
GRLIB_classnames_to_save = GRLIB_classnames_to_save - GRLIB_disabled_arsenal;
GRLIB_classnames_to_save = GRLIB_classnames_to_save arrayIntersect GRLIB_classnames_to_save;
GRLIB_classnames_to_save = GRLIB_classnames_to_save apply { toLower _x };

GRLIB_vehicles_light = [mobile_respawn] + GRLIB_vehicle_blacklist + list_static_weapons;
{
	if !((_x select 0) isKindOf "AllVehicles") then { GRLIB_vehicles_light pushBackUnique (_x select 0) };
} foreach support_vehicles;
{
	if ([(_x select 0), uavs] call F_itemIsInClass) then { GRLIB_vehicles_light pushBackUnique (_x select 0) };
} foreach light_vehicles + air_vehicles;
GRLIB_vehicles_light = GRLIB_vehicles_light arrayIntersect GRLIB_vehicles_light;

GRLIB_quick_delete = [Arsenal_typename, FOB_box_typename, foodbarrel_typename, waterbarrel_typename, medic_heal_typename];
private _quick_delete = ["Land_MedicalTent_01_base_F", "CargoNet_01_base_F", "Shelter_base_F"];
{
	if ([_x, _quick_delete] call F_itemIsInClass) then {
		GRLIB_quick_delete pushBackUnique _x;
	};
} foreach all_buildings_classnames + fob_buildings_classnames;

GRLIB_no_kill_handler_classnames = [FOB_typename, FOB_outpost, FOB_carrier] + all_buildings_classnames + fob_buildings_classnames;
GRLIB_explo_delete = [ammobox_o_typename, ammobox_b_typename, ammobox_i_typename, fuelbarrel_typename];
