#include <sourcemod>
#include <colors>
#include <geoip>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Connect/Disconnect Message", 
	author = "X Matei X, ByDexter", 
	description = "A simple connect/disconnect message for players.", 
	version = "1.1", 
	url = "forums.alliedmods.net", 
};

public void OnPluginStart()
{
	LoadTranslations("connect-disconnect.phrases");
}

public void OnClientPutInServer(int client)
{
	char name[99], IP[99], authid[99], Country[99];
	GetClientAuthId(client, AuthId_Steam2, authid, sizeof(authid));
	GetClientName(client, name, sizeof(name));
	GetClientIP(client, IP, sizeof(IP), true);
	if (!GeoipCountry(IP, Country, sizeof Country))
	{
		Country = "BOT";
	}
	CPrintToChatAll("%t", "Connect", name, authid, Country);
	
}

public void OnClientDisconnect(int client)
{
	char name[99], IP[99], authid[99], Country[99];
	GetClientAuthId(client, AuthId_Steam2, authid, sizeof(authid));
	GetClientName(client, name, sizeof(name));
	GetClientIP(client, IP, sizeof(IP), true);
	if (!GeoipCountry(IP, Country, sizeof Country))
	{
		Country = "BOT";
	}
	CPrintToChatAll("%t", "Disconnect", name, authid, Country);
} 