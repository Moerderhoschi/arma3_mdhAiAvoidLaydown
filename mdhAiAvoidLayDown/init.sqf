///////////////////////////////////////////////////////////////////////////////////////////////////
// MDH AI AVOID LAYDOWN
// MADE BY MOERDERHOSCHI
// ARMED-ASSAULT.DE
// 03.2025
///////////////////////////////////////////////////////////////////////////////////////////////////
0 = [] spawn
{
	if (isDedicated) exitWith {};
	waitUntil {sleep 1; !(isNull player)};
	waitUntil {sleep 1; player == player};

	///////////////////////////////////////////////////////////////////////////////////////////////////
	// DIARYRECORD
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_diary =
	{
		if (isNull player) exitWith {false};
		if(!(player diarySubjectExists "mdhAiAvoidLayDown")) then
		{
			player createDiarySubject ["mdhAiAvoidLayDown","MDH AI Avoid Laydown"];
			player createDiaryRecord
			[
				"mdhAiAvoidLayDown",
				[
					"MDH AI Avoid Laydown by Moerderhoschi",
					(
						'<br/>MDH AI Avoid Laydown is a mod, created by Moerderhoschi for Arma 3.<br/>'
					  + '<br/>'
					  + 'This addon let AI units avoid to laydown on the ground.<br/>'
					  + '<br/>'
					  + 'If you have any question you can contact me at the official Bohemia Interactive Forum: forums.bistudio.com<br/>'
					  + '<br/>'
					  + '<img image="mdhAiAvoidLayDown\mdhAiAvoidLayDown.paa"/><br/>'
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
	
	///////////////////////////////////////////////////////
	// set function
	///////////////////////////////////////////////////////
	_mdhFunction =
	{
		if (isServer) then
		{
			if (missionNameSpace getVariable ["pAvoidAiLayingDown",99] == 99) then
			{
				//systemChat ("start: "+str(time));
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
					//sleep 0.01;
				} foreach allUnits;
				//systemChat ("end: "+str(time));
			};
		};		
	};

	///////////////////////////////////////////////////////
	// loop
	///////////////////////////////////////////////////////
	sleep 1;

	while {sleep 1; true} do
	{
		waitUntil {sleep 0.01; !(isNull player)};
		waitUntil {sleep 0.01; player==player};
		0 = [] call _diary;
		0 = [] call _mdhFunction;
	};
};