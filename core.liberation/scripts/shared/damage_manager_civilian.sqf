params ["_unit", "_selection", "_amountOfDamage", "_killer", "_projectile", "_hitPartIndex", "_instigator"];

if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};

if (!isNull _instigator) then {
	if (isNull (getAssignedCuratorLogic _instigator)) then {
	   	_killer = _instigator;
	};
} else {
	if (!(_killer isKindOf "CAManBase")) then {
		_killer = effectiveCommander _killer;
	};
};

private _ret = 0;
if ( side _killer == GRLIB_side_friendly ) then {
    _ret = _amountOfDamage;
};

if ( side (driver _unit) == GRLIB_side_friendly ) then {
    _ret = _amountOfDamage;
};

_ret;