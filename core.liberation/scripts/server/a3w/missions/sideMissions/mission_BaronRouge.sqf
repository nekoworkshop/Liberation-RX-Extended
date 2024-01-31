if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private [ "_citylist", "_leader"];

_setupVars = {
	_missionType = "STR_BARON_ROUGE";
	_citylist = [] call cityList;
	_locationsArray = nil; // locations are generated on the fly from towns
	_missionTimeout = (30 * 60);
};

_setupObjects = {
	_missionPos = markerPos ((selectRandom _citylist) select 0);
	_vehicleClass = "";
	if (count a3w_br_planes == 0) then {
		_vehicleClass = selectRandom (opfor_air select { _x isKindOf "Plane" });
	} else {
		_vehicleClass = selectRandom a3w_br_planes;
	};
	if (isNil "_vehicleClass") exitWith { false };

	_aiGroup = createGroup [GRLIB_side_enemy, true];
	_aiGroup setFormation "WEDGE";
	_aiGroup setBehaviour "COMBAT";
	_aiGroup setCombatMode "RED";
	_aiGroup setSpeedMode "FULL";

	[_aiGroup] call F_deleteWaypoints;
	_path = (_citylist call BIS_fnc_arrayShuffle) select [0,5];
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "FULL";
		_waypoint setWaypointBehaviour "COMBAT";
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointCompletionRadius 500;
		_waypoint setWaypointFormation "WEDGE";
	} forEach _path;

	_last_waypoint = waypointPosition [_aiGroup, count _path];
	_waypoint = _aiGroup addWaypoint [_missionPos, 0];
	_waypoint setWaypointType "CYCLE";

	_vehicles = [];
	for "_i" from 1 to 3 do {
		_plane = [_missionPos, _vehicleClass] call F_libSpawnVehicle;
		_plane addEventHandler ["Fuel",  { (_this select 0) setFuel 1 }];
		_plane addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }];
		_plane flyInHeightASL [600, 600, 600];
		_vehicles pushBack _plane;
		(crew _plane) joinSilent _aiGroup;
		sleep 2;
	};

	_vehicle = (_vehicles select 0);
	_leader = driver _vehicle;
	_leader setSkill 0.70;
	_leader setSkill ["courage", 1];
	_leader allowFleeing 0;
	_aiGroup selectLeader _leader;
	{_x doFollow leader _aiGroup} foreach units _aiGroup;

	_missionPos = getPosATL leader _aiGroup;
	_missionPicture = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "displayName");
	_missionHintText = ["STR_BARON_ROUGE_MESSAGE1", _vehicleName, sideMissionColor];
	true;
};

_waitUntilMarkerPos = { getPosATL _leader };
_waitUntilExec = nil;
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { !alive _vehicle };
_failedExec = nil;

_successExec = {
	// Mission completed
	private _killer = _vehicle getVariable ["GRLIB_last_killer", objNull];
	if (!isNull _killer) then {
		private _rwd_xp = 50;
		private _text = format ["Reward Received: %1 XP", _rwd_xp];
		[_killer, _rwd_xp] call F_addScore;
		[gamelogic, _text] remoteExec ["globalChat", owner _killer];
	};
	_successHintMessage = "STR_BARON_ROUGE_MESSAGE2";
};

_this call sideMissionProcessor;
