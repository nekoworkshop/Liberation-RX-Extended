waitUntil {sleep 1; !isNil "GRLIB_player_scores"};
if (!([] call F_getValid)) exitWith {};

private [ "_nextplayer", "_nextplayer_uid", "_newscores", "_knownplayers", "_playerindex", "_score", "_ammo", "_fuel" ];
private _all_players = [];
private _old_count = 0;

while { true } do {
	waitUntil {
		sleep 1;
		_all_players = (AllPlayers - (entities "HeadlessClient_F"));
		(count _all_players != _old_count)
	};
	_old_count = count _all_players;

	_knownplayers = [];
	_newscores = GRLIB_player_scores;
	{ _knownplayers pushback (_x select 0) } foreach GRLIB_player_scores;

	{
		_nextplayer = _x;
		_nextplayer_uid = getPlayerUID _nextplayer;

		if (_nextplayer_uid != "") then {
			if (_nextplayer getVariable ["GRLIB_score_set", 0] == 0) then {
				// player saved score/ammo/fuel
				{
					if ( _nextplayer_uid == (_x select 0) ) then {
						_nextplayer setVariable ["GREUH_score_count", (_x select 1), true];
						_nextplayer setVariable ["GREUH_ammo_count", (_x select 2), true];
						_nextplayer setVariable ["GREUH_fuel_count", (_x select 3), true];
						_nextplayer setVariable ["GREUH_reput_count", (_x select 4), true];
					};
				} foreach GRLIB_player_scores;

				// new player
				if (isNil {_nextplayer getVariable ["GREUH_score_count", nil]}) then {
					_nextplayer setVariable ["GREUH_score_count", 0, true];
					_nextplayer setVariable ["GREUH_ammo_count", GREUH_start_ammo, true];
					_nextplayer setVariable ["GREUH_fuel_count", GREUH_start_fuel, true];
					_nextplayer setVariable ["GREUH_reput_count", 0, true];
				};

				// set player rank
				_score = _nextplayer getVariable ["GREUH_score_count",0];
				_rank = [_score] call get_rank;
				_nextplayer setVariable ["GRLIB_Rank", _rank, true];
				[] remoteExec ["set_rank", owner _nextplayer];

				_nextplayer setVariable ["GRLIB_score_set", 1, true];
			};

			sleep 0.2;
			if (_nextplayer getVariable "GRLIB_score_set" == 1) then {
				_score = _nextplayer getVariable ["GREUH_score_count",0];
				_ammo = _nextplayer getVariable ["GREUH_ammo_count",0];
				_fuel = _nextplayer getVariable ["GREUH_fuel_count",0];
				_reput = _nextplayer getVariable ["GREUH_reput_count",0];

				_playerindex = _knownplayers find _nextplayer_uid;
				if ( _playerindex >= 0 ) then {
					_newscores set [_playerindex, [_nextplayer_uid, _score, _ammo, _fuel, _reput, name _nextplayer]];
				} else {
					_newscores pushback [_nextplayer_uid, _score, _ammo, _fuel, _reput, name _nextplayer];
				};
			};

			_score = _nextplayer getVariable ["GREUH_score_count", 0];
			_nextplayer addScore (_score - score _nextplayer);
		};
	} foreach _all_players;

	GRLIB_player_scores = _newscores;
	publicVariable "GRLIB_player_scores";
	sleep 1;
};