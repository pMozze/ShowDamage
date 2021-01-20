public Plugin myinfo =  {
	name = "Show Damage",
	author = "Mozze", 
	description = "",
	version = "1.1", 
	url = "t.me/pMozze"
};

public void OnPluginStart() {
	LoadTranslations("showdamage.phrases");
	HookEvent("player_hurt", onPlayerHurt);
	HookEvent("player_death", onPlayerDeath);
}

public void onPlayerHurt(Event hEvent, const char[] szName, bool bDontBroadCast) {
	int iAttacker = GetClientOfUserId(hEvent.GetInt("attacker"));

	if (iAttacker && iAttacker != GetClientOfUserId(hEvent.GetInt("userid"))) {
		SetHudTextParams(GetRandomFloat(0.25, 0.5), GetRandomFloat(0.25, 0.5), 1.5, 255, 0, 0, 255, 0, 0.0, 0.0, 1.0);
		ShowHudText(iAttacker, -1, "%t", "Damage", hEvent.GetInt("dmg_health"));
	}
}

public void onPlayerDeath(Event hEvent, const char[] szName, bool bDontBroadCast) {
	int iAttacker = GetClientOfUserId(hEvent.GetInt("attacker"));

	if (iAttacker && iAttacker != GetClientOfUserId(hEvent.GetInt("userid"))) {
		SetHudTextParams(GetRandomFloat(0.25, 0.5), GetRandomFloat(0.25, 0.5), 1.5, 255, 0, 0, 255, 0, 0.0, 0.0, 1.0);
		ShowHudText(iAttacker, -1, "%t", "Kill");
	}
}
