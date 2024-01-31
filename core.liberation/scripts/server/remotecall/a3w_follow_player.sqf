if (!isServer && hasInterface) exitWith {};
params ["_unit", "_follow", "_second"];

// start
_unit setVariable ["GRLIB_can_speak", false, true];
_unit stop false;
_unit setUnitPos "AUTO";
_unit enableAI "ANIM";
_unit enableAI "MOVE";
// _anim = "AmovPercMwlkSrasWrflDf";
// _unit switchMove _anim;
// _unit playMoveNow _anim;
_unit setDamage 0.50;

// follow
private _timer = time + _second;
waitUntil {
    _unit doMove (getPos _follow);
    sleep 5;
    (time > _timer)
};

// stop
_unit stop true;
_unit disableAI "ANIM";
_unit disableAI "MOVE";
_anim = "AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground";
_unit switchMove _anim;
_unit playMoveNow _anim;
_unit setDamage 0.50;
_unit setVariable ["GRLIB_can_speak", true, true];

if (count (_unit nearobjects ["Land_MedicalTent_01_white_IDAP_open_F", 10]) > 0) then {
    _unit setDamage 0;
    _unit setVariable ["GRLIB_can_speak", false, true];
    _unit setVariable ["GRLIB_A3W_Mission_HC2", nil, true];
    [_follow, 5] call F_addReput;
};
