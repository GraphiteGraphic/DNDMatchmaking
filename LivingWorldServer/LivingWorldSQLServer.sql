SET QUOTED_IDENTIFIER OFF

Use master
GO

Drop Database IF EXISTS Living_World_Players
GO

Create Database Living_World_Players
GO

Use Living_World_Players
GO

--Individual Player in Living World--
Create Table LW_User(
	user_id int identity,
	discord_tag nvarchar(64) Not Null,
	last_played Date DEFAULT '2021-03-06',
	staff_status int DEFAULT 0,
	player_status int DEFAULT 1,
	Constraint PK_user Primary Key (user_id),
	--Constraint CHK_staff_status CHECK (staff_status BETWEEN 0 AND ) --FIGURE OUT HOW MANY ROLES WE HAVE
	Constraint CHK_player_status CHECK (player_status BETWEEN 0 AND 3)
)

--Race Table--
Create Table Race(
	race_id int identity,
	name nvarchar(32) Not Null,
	Constraint PK_race Primary Key (race_id)
)

--Sub-Race Table--
Create Table Sub_Race(
	sub_race_id int identity,
	race_id int Not Null,
	name nvarchar(32) Not Null,
	Constraint PK_subrace Primary Key (sub_race_id),
	Constraint FK_subrace_race Foreign Key (race_id) REFERENCES Race(race_id)
)

--Origin Table--
Create Table Origin(
	origin_id int identity,
	name nvarchar(32) Not Null,
	Constraint PK_origin Primary Key (origin_id)
)

--Sub-Origin Table--
Create Table Sub_Origin(
	sub_origin_id int identity,
	origin_id int Not Null,
	name nvarchar(32) Not Null,
	Constraint PK_suborigin Primary Key (sub_origin_id),
	Constraint FK_suborigin_origin Foreign Key (origin_id) REFERENCES Origin(origin_id)
)

--Class Table--
Create Table Class(
	class_id int identity,
	name nvarchar(32) Not Null,
	Constraint PK_class Primary Key (class_id)
)

--Sub-Class Table--
Create Table Sub_Class(
	sub_class_id int identity,
	class_id int Not Null,
	name nvarchar(32) Not Null,
	Constraint PK_subclass Primary Key (sub_class_id),
	Constraint FK_subclass_class Foreign Key (class_id) REFERENCES Class(class_id)
)

--Faction Table--
Create Table Faction(
	faction_id int identity,
	name nvarchar(32) Not Null,
	Constraint PK_faction Primary Key (faction_id)
)

--Deity Table--
Create Table Deity(
	deity_id int identity,
	name nvarchar(32) Not Null,
	Constraint PK_deity Primary Key (deity_id)
)

--Any Characters made in the Living World--
Create Table LW_Character(
	char_id int identity,
	player_id int Not Null,
	name nvarchar(64) Not Null,
	race_id int Not Null,
	sub_race_id int DEFAULT Null,
	origin_id int Not Null,
	sub_origin_id int Not Null,
	faction_id int DEFAULT Null,
	loyalty int DEFAULT 0,
	deity_id int DEFAULT Null,
	mv int DEFAULT 0,
	prestige int DEFAULT 0,
	active bit DEFAULT 1,
	Constraint PK_character Primary Key (char_id),
	Constraint FK_character_player Foreign Key (player_id) References LW_User(user_id),
	Constraint FK_character_race Foreign Key (race_id) References Race(race_id),
	Constraint FK_character_subrace Foreign Key (sub_race_id) References Sub_Race(sub_race_id),
	Constraint FK_character_origin Foreign Key (origin_id) References Origin(origin_id),
	Constraint FK_character_suborigin Foreign Key (sub_origin_id) References Sub_Origin(sub_origin_id),
	Constraint FK_character_faction Foreign Key (faction_id) References Faction(faction_id),
	Constraint FK_character_deity Foreign Key (deity_id) References Deity(deity_id),
)

--Character_Class Associative Table--
Create Table Character_Class(
	char_id int Not Null,
	class_id int Not Null,
	class_lvl int DEFAULT 1,
	sub_class_id int,
	Constraint PK_charclass Primary Key (char_id, class_id),
	Constraint FK_charclass_character Foreign Key (char_id) REFERENCES LW_Character(char_id),
	Constraint FK_charclass_class Foreign Key (class_id) REFERENCES Class(class_id) 
)

--Scheduling Table--
Create Table Missions(
	mission_id int identity,
	mission_title nvarchar(32) Not Null,
	mission_description nvarchar(256) Default Null,
	mission_region int Not Null,
	min_level int Not Null,
	max_level int Not Null,
	mission_date Date Not Null,
	session_total int Default 1,
	session_start Time Not Null,
	session_end Time Not Null,
	prestige int Default 0,
	descriptor nvarchar(256),
	modifier nvarchar(6) Not Null,
	Constraint PK_mission Primary Key (mission_id),
	Constraint FK_region Foreign Key (mission_region) REFERENCES Origin(origin_id),
	Constraint CHK_level CHECK (min_level >= 1 AND max_level <= 20),
	Constraint CHK_session_total CHECK (session_total >= 1),
	Constraint CHK_prestige CHECK (prestige >= 0),
	Constraint CHK_modifer CHECK (modifier in ('minor', 'lesser', 'major'))
)

Create Table Sign_Up(
	sign_up_id int identity,
	player_id int Not Null,
	mission_id int Not Null,
	Constraint PK_sign_up Primary Key (sign_up_id),
	Constraint player_id Foreign Key (player_id) REFERENCES LW_User(user_id),
	Constraint mission_id Foreign Key (mission_id) REFERENCES Missions(mission_id)
)

BEGIN TRANSACTION

--Adding All Classes--
INSERT INTO Class(name)
	Values ('Barbarian'), ('Bard'), ('Cleric'), ('Druid'), ('Fighter'), ('Monk'), ('Paladin'), ('Ranger'), ('Rogue'), 
		('Sorcerer'), ('Warlock'), ('Wizard'), ('Vanguard'), ('Weaver'), ('Fiend') 

--Adding All Sub-Classes--
INSERT INTO Sub_Class(name, class_id)
	VALUES ('Ancestral Guardian', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Battlerager', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Berserker', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Scar Seeker', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Storm Herald', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Totem Warrior', (SELECT class_id FROM Class WHERE name = 'Barbarian')),
		   ('Jester', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('College of Glamour', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('College of Lore', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('College of Swords', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('College of Valor', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('College of Whispers', (SELECT class_id FROM Class WHERE name = 'Bard')),
		   ('Arcana', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Balance', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Chaos', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Coin', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Death', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Dream', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Earth', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Fate', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Forge', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Freedom', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Grave', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Hope', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Knowledge', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Life', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Light', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Love', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Loyalty', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Luck', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Madness', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Nature', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Order', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Rage', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Redemption', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Stars', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Strife', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Tempest', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Time', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Travel', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Trickery', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Tyranny', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Undead', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('War', (SELECT class_id FROM Class WHERE name = 'Cleric')),
		   ('Circle of Dreams', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ('Circle of the Land', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ('Circle of the Moon', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ('Circle of the Shepherd', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ('Circle of Spires', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ('Circle of Storms', (SELECT class_id FROM Class WHERE name = 'Druid')),
		   ("Aden'ka'ael", (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Arcane Archer', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Battle Herald', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Battle Master', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Cavalier', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Champion', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Dancing Blade', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Eldritch Knight', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Samurai', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Sanguine Knight', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Rytherian', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Unbreakable', (SELECT class_id FROM Class WHERE name = 'Fighter')),
		   ('Way of the Drunken Master', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of the Four Elements', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of the Kensei', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of the Long Death', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of the Open Hand', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of Shadow', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Way of the Sun Soul', (SELECT class_id FROM Class WHERE name = 'Monk')),
		   ('Oath of the Ancients', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of Conquest', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of the Crown', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of Devotion', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of the Linnorms', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oathbreaker', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of Redemption', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of the Time Warden', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Oath of Vengeance', (SELECT class_id FROM Class WHERE name = 'Paladin')),
		   ('Beast Conclave', (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ('Gloomstalker', (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ('Horizon Walker', (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ("Hunter's Conclave", (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ('Monster Slayer', (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ('Scalecaller', (SELECT class_id FROM Class WHERE name = 'Ranger')),
		   ('Arcane Trickster', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Assassin', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Gregorian', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Inquisitive', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Mastermind', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Pirate', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Scout', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Swashbuckler', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Thief', (SELECT class_id FROM Class WHERE name = 'Rogue')),
		   ('Divine Soul', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Draconic', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Linnorm', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Shadow', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Storm', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Wild Magic', (SELECT class_id FROM Class WHERE name = 'Sorcerer')),
		   ('Archfey', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Celestial', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Evil Eye', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Fiend', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Great Old One', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Hexblade', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Lunar', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Undying', (SELECT class_id FROM Class WHERE name = 'Warlock')),
		   ('Abjuration', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Bladesinging', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Conjuration', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Cruomancer', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Cyphermage', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Divination', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Enchantment', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Evocation', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Illusion', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Necromancy', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Transmutation', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('War Magic', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Void Mage', (SELECT class_id FROM Class WHERE name = 'Wizard')),
		   ('Captain', (SELECT class_id FROM Class WHERE name = 'Vanguard')),
		   ('Quartermaster', (SELECT class_id FROM Class WHERE name = 'Vanguard'))

--Adding All Origins--
INSERT INTO Origin(name)
	Values ('Badlands'), ('Daborak'), ('Bloodwave Bay'), ('Krazax'), ('Majital'), ('Dolten'), ('Orde'), ('Steton'), ('Khao'), 
		('Imperial Houses'), ('The Rift'), ("Elda'sharkai") 

--Adding All Sub-Origins-
INSERT INTO Sub_Origin(name, origin_id)
	VALUES ('Twice Cursed', (SELECT origin_id FROM Origin WHERE name = 'Badlands')),
		   ('Doomsayer', (SELECT origin_id FROM Origin WHERE name = 'Badlands')),
		   ('Woeful Warrior', (SELECT origin_id FROM Origin WHERE name = 'Badlands')),
		   ('Banshee Born', (SELECT origin_id FROM Origin WHERE name = 'Badlands')),
		   ('Wendigo Soul', (SELECT origin_id FROM Origin WHERE name = 'Badlands')),
		   ('Brutal Coast', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Copper Coveman', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Mage Coast', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Navigator', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Privateer', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Shipwreck Diver', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Spelunker', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Whispering Isles', (SELECT origin_id FROM Origin WHERE name = 'Bloodwave Bay')),
		   ('Bandit of the Rolling Wastes', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Calvaryman', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Courier', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Daborakian Noble', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Plainsrunner', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Riverrunner', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Soldier in Training', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Stablemaster', (SELECT origin_id FROM Origin WHERE name = 'Daborak')),
		   ('Bleak Blessed', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Dark Howler', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Fae-Lost', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Fangs in the Night', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Gambler Born', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Gravewatcher', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Night Guard Aspirant', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('The Skittering', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Ward of Witchtown', (SELECT origin_id FROM Origin WHERE name = 'Dolten')),
		   ('Dark One', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Druid in Training', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Exile', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Forager', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Mender', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Tracker', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ('Enforcer', (SELECT origin_id FROM Origin WHERE name = 'Khao')),
		   ("House of Ad'daire", (SELECT origin_id FROM Origin WHERE name = 'Imperial Houses')),
		   ('House of Malcees', (SELECT origin_id FROM Origin WHERE name = 'Imperial Houses')),
		   ('House of Somoel', (SELECT origin_id FROM Origin WHERE name = 'Imperial Houses')),
		   ('House of Twelve-Stars', (SELECT origin_id FROM Origin WHERE name = 'Imperial Houses')),
		   ('Forgechild', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Greenskin-Bane', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Legionnaire', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Lowlander', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Minesworn', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Peakfolk', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Rangeroamer', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Songport Arrival', (SELECT origin_id FROM Origin WHERE name = 'Krazax')),
		   ('Arcane Student', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Guild Born', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Merchant of Magic', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Mirage Born', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Oasis Native', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Portal Born', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Ruin Dweller', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Sand Strider', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Songport Arrival', (SELECT origin_id FROM Origin WHERE name = 'Majital')),
		   ('Church Child', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Ex-Priest', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('In Plain Sight', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Lineage of Coin', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Lineage of the Barrister', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Paladin in Training', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Wall Born', (SELECT origin_id FROM Origin WHERE name = 'Orde')),
		   ('Bulette Slayer', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Chimera Hunter', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Dragon Slayer', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Floating Nomad', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Giant Slayer', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Hide Flayer', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Manticore Hunter', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Roc Tracker', (SELECT origin_id FROM Origin WHERE name = 'Steton')),
		   ('Divini', (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ("Lu'us", (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ('Envus', (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ('Priend', (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ("Gla'ton", (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ("Gri'id", (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ('Vrath', (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ('Slog', (SELECT origin_id FROM Origin WHERE name = 'The Rift')),
		   ('Path of the Ael', (SELECT origin_id FROM Origin WHERE name = "Elda'sharkai")),
		   ('Path of the Scion', (SELECT origin_id FROM Origin WHERE name = "Elda'sharkai")),
		   ('Path of the Gilded', (SELECT origin_id FROM Origin WHERE name = "Elda'sharkai")),
		   ('Path of the Forsaken', (SELECT origin_id FROM Origin WHERE name = "Elda'sharkai"))

--Adding All Factions--
INSERT INTO Faction(name)
	Values ('Bards College'), ('Collector'), ('Dark Pact'), ('Freemen'), ('Grasping Hand'), ('Great Bazaar'), ('Great Coven'), ('Hikari'), ('Iitanas Imperium'), 
		('Inquisition'), ('Mages Guild'), ('Night Guard'), ('Shackled Legion'), ('Silent Knights'), ('Steel Saints'), ('Steton Striders'), ('Tops'), ('Wall Watch'),
		('World Wanderers'), ('Crowsworn'), ('Ever Eye'), ('Forked Tongue'), ('Last Grove'), ('Linnorm Lords')

--Adding All Deities--
INSERT INTO Deity(name)
	VALUES ('Astaroth'), ('Babylon'), ('Cassius'), ('Crowley'), ('Ezokhine'), ('Falaael'),
		('Gazenaroc'), ('Glory'), ('Gwaina'), ('Iass'), ('Inca'), ('Kaheeli'), ('Lorita'), 
		('Lorn'), ('Matron of Fate'), ('Nero'), ("Oloken'hai"), ('Oun'), ('Raquel'),
		('Runethares'), ('Sekelcuse'), ('Silloway'), ('Talven'), ('The Seven'), ('Tilt'),
		('Vavren'), ('Viderick'), ('Vinsc'), ('Wode'), ('Wondox')
		
--Adding All Races--
INSERT INTO Race(name)
	VALUES ('Aarakocra'), ('Aasimar'), ('Bugbear'), ('Changeling'), ('Dhampir'), ('Dragonborn'),
		('Dwarf'), ('Elf'), ('Firbolg'), ('Genasi'), ('Gnome'), ('Goblin'), ('Goliath'), ('Grippli'),
		('Half-Elf'), ('Half-Orc'), ('Halfling'), ('Hobgoblin'), ('Human'), ('Kenku'), ('Kitsune'),
		('Kobold'), ('Kuo-Toa'), ('Lizardfolk'), ('Minotaur'), ('Nikira'), ('Orc'), ('Ratfolk'),
		('Revenant'), ('Satyr'), ('Scaleheart'), ("Shar'kai"), ('Siren'), ('Sprite'), ('Tabaxi'),
		('Tiefling'), ('Tortle'), ('Triton'), ('Witchwolf'), ('Yuan-Ti')

--Adding All Sub-Races--
INSERT INTO Sub_Race(name, race_id)
	VALUES ('Fallen', (SELECT race_id FROM Race WHERE name = 'Aasimar')), ('Scourge', (SELECT race_id FROM Race WHERE name = 'Aasimar')),
		('Protector', (SELECT race_id FROM Race WHERE name = 'Aasimar')), ('Black', (SELECT race_id FROM Race WHERE name = 'Dragonborn')),
		('Blue', (SELECT race_id FROM Race WHERE name = 'Dragonborn')), ('Brass', (SELECT race_id FROM Race WHERE name = 'Dragonborn')),
		('Bronze', (SELECT race_id FROM Race WHERE name = 'Dragonborn')), ('Copper', (SELECT race_id FROM Race WHERE name = 'Dragonborn')),
		('Gold', (SELECT race_id FROM Race WHERE name = 'Dragonborn')), ('Green', (SELECT race_id FROM Race WHERE name = 'Dragonborn')),
		('Red', (SELECT race_id FROM Race WHERE name = 'Dragonborn')), ('Silver', (SELECT race_id FROM Race WHERE name = 'Dragonborn')),
		('White', (SELECT race_id FROM Race WHERE name = 'Dragonborn')), ('Feral', (SELECT race_id FROM Race WHERE name = 'Dhampir')),
		('Royal', (SELECT race_id FROM Race WHERE name = 'Dhampir')), ('Duergar', (SELECT race_id FROM Race WHERE name = 'Dwarf')),
		('Hill', (SELECT race_id FROM Race WHERE name = 'Dwarf')), ('Mountain', (SELECT race_id FROM Race WHERE name = 'Dwarf')),
		('Dark', (SELECT race_id FROM Race WHERE name = 'Elf')), ('High', (SELECT race_id FROM Race WHERE name = 'Elf')),
		('Sea', (SELECT race_id FROM Race WHERE name = 'Elf')), ('Wood', (SELECT race_id FROM Race WHERE name = 'Elf')),
		('Eladrin', (SELECT race_id FROM Race WHERE name = 'Elf')), ('Air', (SELECT race_id FROM Race WHERE name = 'Genasi')),
		('Earth', (SELECT race_id FROM Race WHERE name = 'Genasi')), ('Fire', (SELECT race_id FROM Race WHERE name = 'Genasi')),
		('Water', (SELECT race_id FROM Race WHERE name = 'Genasi')), ('Forest', (SELECT race_id FROM Race WHERE name = 'Gnome')),
		('Rock', (SELECT race_id FROM Race WHERE name = 'Gnome')), ('Svirfneblin', (SELECT race_id FROM Race WHERE name = 'Gnome')),
		('Ghostwise', (SELECT race_id FROM Race WHERE name = 'Halfling')), ('Lightfoot', (SELECT race_id FROM Race WHERE name = 'Halfling')),
		('Songsworn', (SELECT race_id FROM Race WHERE name = 'Halfling')), ('Stout', (SELECT race_id FROM Race WHERE name = 'Halfling')),
		('Aquatic', (SELECT race_id FROM Race WHERE name = 'Half-Elf')), ('Dark Elf', (SELECT race_id FROM Race WHERE name = 'Half-Elf')),
		('High Elf', (SELECT race_id FROM Race WHERE name = 'Half-Elf')), ('Human', (SELECT race_id FROM Race WHERE name = 'Half-Elf')),
		('Wood Elf', (SELECT race_id FROM Race WHERE name = 'Half-Elf')), ('Illithari', (SELECT race_id FROM Race WHERE name = 'Human')),
		('Default', (SELECT race_id FROM Race WHERE name = 'Human')), ('Variant', (SELECT race_id FROM Race WHERE name = 'Human')),
		('Vulpin', (SELECT race_id FROM Race WHERE name = 'Kitsune')), ('Seishin', (SELECT race_id FROM Race WHERE name = 'Kitsune')),
		('Soprano', (SELECT race_id FROM Race WHERE name = 'Nikira')), ('Alto', (SELECT race_id FROM Race WHERE name = 'Nikira')),
		('Tenor', (SELECT race_id FROM Race WHERE name = 'Nikira')), ('Bass', (SELECT race_id FROM Race WHERE name = 'Nikira')),
		('Diseased', (SELECT race_id FROM Race WHERE name = 'Ratfolk')), ('Cunning', (SELECT race_id FROM Race WHERE name = 'Ratfolk')),
		("Sailor's Bane", (SELECT race_id FROM Race WHERE name = 'Siren')), ('Harpy', (SELECT race_id FROM Race WHERE name = 'Siren')),
		('Medusa', (SELECT race_id FROM Race WHERE name = 'Siren')), ('Goggler', (SELECT race_id FROM Race WHERE name = 'Kuo-Toa')),
		('Whip', (SELECT race_id FROM Race WHERE name = 'Kuo-Toa')), ('Red Tribe', (SELECT race_id FROM Race WHERE name = 'Orc')),
		('Tribeless', (SELECT race_id FROM Race WHERE name = 'Orc')), ('Antler', (SELECT race_id FROM Race WHERE name = 'Satyr')),
		('Crown', (SELECT race_id FROM Race WHERE name = 'Satyr')), ('Dragon', (SELECT race_id FROM Race WHERE name = 'Satyr')),
		('Fel', (SELECT race_id FROM Race WHERE name = 'Satyr')), ('Mountain', (SELECT race_id FROM Race WHERE name = 'Satyr')),
		('Bright Wing', (SELECT race_id FROM Race WHERE name = 'Sprite')), ('Dark Wing', (SELECT race_id FROM Race WHERE name = 'Sprite')),
		('Iron Wing', (SELECT race_id FROM Race WHERE name = 'Sprite')), ('Strong Wing', (SELECT race_id FROM Race WHERE name = 'Sprite')),
		('Quick Wing', (SELECT race_id FROM Race WHERE name = 'Sprite')), ('Asmodeus', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Baalzebul', (SELECT race_id FROM Race WHERE name = 'Tiefling')), ('Dispater', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Fierna', (SELECT race_id FROM Race WHERE name = 'Tiefling')), ('Glasya', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Levistus', (SELECT race_id FROM Race WHERE name = 'Tiefling')), ('Mammon', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Mephistopheles', (SELECT race_id FROM Race WHERE name = 'Tiefling')), ('Winged', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Zariel', (SELECT race_id FROM Race WHERE name = 'Tiefling')), ('Variant', (SELECT race_id FROM Race WHERE name = 'Tiefling')),
		('Hound', (SELECT race_id FROM Race WHERE name = 'Witchwolf')), ('Wolf', (SELECT race_id FROM Race WHERE name = 'Witchwolf'))
		
--Race/Subrace Check--
ALTER Table LW_Character
	ADD Constraint CHK_subrace CHECK (
		race_id NOT IN (2,5,6,7,8,10,11,15,17,19,21,23,26,27,28,30,33,34,36,39)
		OR (race_id = 2 AND sub_race_id IN (1,2,3))
		OR (race_id = 5 AND sub_race_id IN (14,15))
		OR (race_id = 6 AND sub_race_id IN (4,5,6,7,8,9,10,11,12,13))
		OR (race_id = 7 AND sub_race_id IN (16,17,18))
		OR (race_id = 8 AND sub_race_id IN (19,20,21,22,23))	
		OR (race_id = 10 AND sub_race_id IN (24,25,26,27))
		OR (race_id = 11 AND sub_race_id IN (28,29,30))
		OR (race_id = 15 AND sub_race_id IN (35,36,37,38,39))
		OR (race_id = 17 AND sub_race_id IN (31,32,33,34))
		OR (race_id = 19 AND sub_race_id IN (40,41,42))
		OR (race_id = 21 AND sub_race_id IN (43,44))
		OR (race_id = 23 AND sub_race_id IN (54,55))
		OR (race_id = 26 AND sub_race_id IN (45,46,47,48))
		OR (race_id = 27 AND sub_race_id IN (56,57))
		OR (race_id = 28 AND sub_race_id IN (49,50))
		OR (race_id = 30 AND sub_race_id IN (58,59,60,61,62))
		OR (race_id = 33 AND sub_race_id IN (51,52,53))
		OR (race_id = 34 AND sub_race_id IN (63,64,65,66,67))
		OR (race_id = 36 AND sub_race_id IN (68,69,70,71,72,73,74,75,76,77,78))
		OR (race_id = 39 AND sub_race_id IN (79,80))	
		),
--Sharkai/Origin Check-- 
	Constraint CHK_sharkai_origin CHECK (
		(race_id <> 32)
		OR (race_id = 32) 
			AND (origin_id = 12)
			AND (sub_origin_id = 82 OR sub_origin_id = 83 OR sub_origin_id = 84 OR sub_origin_id = 85)
		),
--Sub-Origin Check--
	Constraint CHK_suborigin CHECK (
		(origin_id = 1 AND sub_origin_id IN (1,2,3,4,5))
		OR (origin_id = 2 AND sub_origin_id IN (14,15,16,17,18,19,20,21))
		OR (origin_id = 3 AND sub_origin_id IN (6,7,8,9,10,11,12,13))
		OR (origin_id = 4 AND sub_origin_id IN (42,43,44,45,46,47,48,49))
		OR (origin_id = 5 AND sub_origin_id IN (50,51,52,53,54,55,56,57,58))
		OR (origin_id = 6 AND sub_origin_id IN (22,23,24,25,26,27,28,29,30))
		OR (origin_id = 7 AND sub_origin_id IN (59,60,61,62,63,64,65))
		OR (origin_id = 8 AND sub_origin_id IN (66,67,68,69,70,71,72,73))
		OR (origin_id = 9 AND sub_origin_id IN (31,32,33,34,35,36,37))
		OR (origin_id = 10 AND sub_origin_id IN (38,39,40,41))
		OR (origin_id = 11 AND sub_origin_id IN (74,75,76,77,78,79,80,81))
		)
--Sub-Class Check--
ALTER Table Character_Class
	ADD Constraint CHK_subclass CHECK (
		(class_id IN (1,2,5,6,7,8,9) AND class_lvl < 3)
		OR (class_id IN (4,12) AND class_lvl < 2)
		OR (class_id = 1 AND class_lvl >= 3 AND sub_class_id in (1,2,3,4,5,6))
		OR (class_id = 2 AND class_lvl >= 3 AND sub_class_id in (7,8,9,10,11,12))
		OR (class_id = 3 AND sub_class_id in (13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44))
		OR (class_id = 4 AND class_lvl >= 2 AND sub_class_id in (45,46,47,48,49,50))
		OR (class_id = 5 AND class_lvl >= 3 AND sub_class_id in (51,52,53,54,55,56,57,58,59,60,61,62))
		OR (class_id = 6 AND class_lvl >= 3 AND sub_class_id in (63,64,65,66,67,68,69))
		OR (class_id = 7 AND class_lvl >= 3 AND sub_class_id in (70,71,72,73,74,75,76,77,78))
		OR (class_id = 8 AND class_lvl >= 3 AND sub_class_id in (79,80,81,82,83,84))
		OR (class_id = 9 AND class_lvl >= 3 AND sub_class_id in (85,86,87,88,89,90,91,92,93))
		OR (class_id = 10 AND sub_class_id in (94,95,96,97,98,99))
		OR (class_id = 11 AND sub_class_id in (100,101,102,103,104,105,106,107))
		OR (class_id = 12 AND class_lvl >= 2 AND sub_class_id in (108,109,110,111,112,113,114,115,116,117,118,119,120))
		)

COMMIT TRANSACTION