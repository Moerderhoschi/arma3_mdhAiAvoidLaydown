/////////////////////////////////////////////////////////////////////////////////////////////
// MDH AI AVOID LAYDOWN(by Moerderhoschi) - v2025-03-16
// github: https://github.com/Moerderhoschi/arma3_mdhAiAvoidLaydown
// steam mod version: https://steamcommunity.com/sharedfiles/filedetails/?id=3438379619
/////////////////////////////////////////////////////////////////////////////////////////////
if (missionNameSpace getVariable ["pAvoidAiLayingDown",99] == 99) then
{
	0 spawn
	{
		_valueCheck = 99;
		_defaultValue = 99;
		_path = 'mdhAiAvoidLayDown';
		_env  = isServer;

		_diary  = 0;
		_mdhFnc = 0;		
		
		if (hasInterface) then
		{
			_diary =
			{
				waitUntil {!(isNull player)};
				_c = true;
				_t = "MDH AI Avoid Laydown";
				if (player diarySubjectExists "MDH Mods") then
				{
					{
						if (_x#1 == _t) exitWith {_c = false}
					} forEach (player allDiaryRecords "MDH Mods");
				}
				else
				{
					player createDiarySubject ["MDH Mods","MDH Mods"];
				};
		
				if(_c) then
				{
					player createDiaryRecord
					[
						"MDH Mods",
						[
							_t,
							(
							  '<br/>MDH AI Avoid Laydown is a mod, created by Moerderhoschi for Arma 3.<br/>'
							+ '<br/>'
							+ 'This addon let AI units avoid to laydown on the ground.<br/>'
							+ '<br/>'
							+ 'If you have any question you can contact me at the steam workshop page.<br/>'
							+ '<br/>'
							+ '<img image="'+_path+'\mdhAiAvoidLayDown.paa"/><br/>'
							+ '<br/>'
							+ 'Credits and Thanks:<br/>'
							+ 'Armed-Assault.de Crew - For many great ArmA moments in many years<br/>'
							+ 'BIS - For ArmA3<br/>'
							)
						]
					]
				};
				true
			};
		};

		if (_env) then
		{
			_mdhFnc =
			{
				{
					if (alive _x && {vehicle _x == _x} && {!(_x in allPlayers)}) then
					{
						if (behaviour _x == "COMBAT") then
						{
							if (speed _x < 1) then {_x setUnitPos "MIDDLE"} else {_x setUnitPos "UP"}
						}
						else
						{
							_x setUnitPos "AUTO";
						};
					};
				} foreach allUnits;
			};
		};

		if (hasInterface) then
		{
			uiSleep 2.4;
			call _diary;
		};

		_diaryTimer = 10;
		pAiStayLowInCombat = 0; // deact MDH AI Stay low in Combat Mod/script
		sleep (3 + random 2);
		while {missionNameSpace getVariable ["pAvoidAiLayingDown",_defaultValue] == _valueCheck} do
		{
			if (_env) then {call _mdhFnc};
			sleep 1;
			if (time > _diaryTimer && {hasInterface}) then {call _diary; _diaryTimer = time + 10};
			if (time > _diaryTimer) then {pAiStayLowInCombat = 0};
		};					
	};
};