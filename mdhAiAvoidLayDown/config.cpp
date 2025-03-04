class CfgPatches 
{
	class mdhAiAvoidLayDown
	{
		author = "Moerderhoschi";
		name = "MDH AI Avoid Laydown";
		url = "http://moerderhoschi.bplaced.net";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
		version = "1.20160815";
		versionStr = "1.20160815";
		versionAr[] = {1,20160816};
		authors[] = {};
	};
};

class CfgFunctions
{
	class mdh
	{
		class mdhFunctions
		{
			class mdhAiAvoidLayDown
			{
				file = "mdhAiAvoidLayDown\init.sqf";
				postInit = 1;
			};
		};
	};
};

class CfgMods
{
	class mdhAiAvoidLayDown
	{
		dir = "@mdhAiAvoidLayDown";
		name = "MDH AI Avoid Laydown";
		picture = "mdhAiAvoidLayDown\mdhAiAvoidLayDown.paa";
		hidePicture = "true";
		hideName = "true";
		actionName = "Website";
		action = "http://moerderhoschi.bplaced.net";
	};
};