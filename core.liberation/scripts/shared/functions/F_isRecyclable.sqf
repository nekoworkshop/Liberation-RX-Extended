params ["_vehicle"];

private _ret = false;

private _alive = alive _vehicle;
private _onfoot = isNull objectParent player;
private _R3F_move = isNull R3F_LOG_joueur_deplace_objet;
private _noflight = (isTouchingGround player || getPos player select 2 <= 1);
private _notunnel = !(player getVariable ["SOG_player_in_tunnel", false]);
private _r3f_enabled = !(_vehicle getVariable ['R3F_LOG_disabled', false]);
private _grl_isempty = (count (_vehicle getVariable ["GRLIB_ammo_truck_load", []]) == 0);
private _r3f_isempty = (count (_vehicle getVariable ["R3F_LOG_objets_charges", []]) == 0);
private _nearfob = [player, "FOB", GRLIB_fob_range] call F_check_near;
private _far_lhd = (player distance2D lhd > GRLIB_fob_range);
private _manned = _vehicle getVariable ["GRLIB_vehicle_manned", false];
private _empty = (count (crew _vehicle) == 0 || _manned);

if ( _alive && _onfoot && _empty && _R3F_move && _far_lhd && _nearfob && _noflight && _r3f_enabled && _grl_isempty && _r3f_isempty && (isNull attachedTo _vehicle)) then {
	if ([_vehicle, GRLIB_vehicle_whitelist] call F_itemIsInClass) exitWith { _ret = true };
	if ([_vehicle, GRLIB_recycleable_classnames] call F_itemIsInClass) then {
		if ([player, _vehicle] call is_owner) exitWith { _ret = true };
		if ([_vehicle] call F_getBuildPerm && ([player, 4] call fetch_permission)) exitWith { _ret = true };
	};
};

_ret;