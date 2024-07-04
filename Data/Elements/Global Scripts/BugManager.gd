# this is my yandev moment
extends Node

var isInspect: bool = false
var inspectID: int
func load_bug_menu(ID):
	inspectID = ID

## This Dictionary Stores all data related to the bug submissions.
## Author, Name, Desc, and the Authors NG URL are used when loading Inspect menus.
## The number attached is their ID.
var BugData: Dictionary = {
	0 : {
		"Author": "Frosty",
		"Name": "Pluh",
		"Desc": "\"The Pluh bug tends to hide under vending machines feeding on spare quarters and loose change. If startled, it will run away.\"",
		"URL": "https://frosty.newgrounds.com/"
	},
	1 : {
		"Author": "FunnyPlush",
		"Name": "Troublemaker Spider",
		"Desc": "\"The Troublemaker Spider likes to mimic the appearance of ants in order to infiltrate their colonies. Unlike others of its kind, it doesn't hunt the ants, it would rather watch the ants get confused to its own amusement instead.\"",
		"URL": "https://funnyplush.newgrounds.com/"
	},
	2 : {
		"Author": "TechnoCookie",
		"Name": "Mosquicko",
		"Desc": "\"Mosquicko are real pranksters. They have a sharp, retractable nose they use to annoy people. A quick swat will get 'em off your back pretty easily though. That is, if you're quick enough.\"",
		"URL": "https://TechnoCookie.newgrounds.com/"
	},
	3 : {
		"Author": "deebaiscool",
		"Name": "Bugboy",
		"Desc": "\"Bugboy likes to think of himself as a species but he's the only Bugboy. His real name is Keith and he pretends to be a human so he can talk to the cashier at McDonalds he has a crush on. People who know his true identity usually don't care.\"",
		"URL": "https://deebaiscool.newgrounds.com/"
	},
	4 : {
		"Author": "whimsical-wife",
		"Name": "Bubblegum Lovebug",
		"Desc": "\"Bubblegum Lovebugs spend all year eating leftover candy from the holidays. Their eggs incubate for a year and all collectively hatch on Valentine's day. Their favorite food is leftover chocolate hearts.\"",
		"URL": "https://whimsical-wife.newgrounds.com/"
	},
	5 : {
		"Author": "KDT",
		"Name": "Raato",
		"Desc": "\"The rapidly multiplying Raato are usually found nesting and feeding on dead wildlife. The average lifespan of an adult is about a month. Most of this time is spent searching for corpses.\"",
		"URL": "https://KDT.newgrounds.com/"
	},
	6 : {
		"Author": "NamelessComposer",
		"Name": "Seechy and his friend",
		"Desc": "\"Seechy is a bug that loves cheese very much! Rumor has it that it used to be brown like the rest of the bugs, but turned yellow due to a huge pile of cheese eaten!\"",
		"URL": "https://NamelessComposer.newgrounds.com/"
	},
	7 : {
		"Author": "TomDoy",
		"Name": "Eclipse Skull Bug",
		"Desc": "\"This skull-shaped bug shines gold in moonlight. Known to become hostile during an eclipse\"",
		"URL": "https://TomDoy.newgrounds.com/"
	},
	8 : {
		"Author": "BlaznTheKid",
		"Name": "Deaddew Wasp",
		"Desc": "\"The Deaddew Wasp will store part of its prey in the thin membrane sac between its legs. The stored prey bits allows the wasp to seem like an abandoned corpse and the process releases a sweet scent luring in more prey. Should the wasp be threatened by a larger predator or the membrane becomes ruptured, it is able to detach it and build a new one within hours\"",
		"URL": "https://BlaznTheKid.newgrounds.com/"
	},
	9 : {
		"Author": "Noobrapter",
		"Name": "Pip The Spider",
		"Desc": "\"The Self-proclaimed Dreaded Spirate of the Gulf, Pip is a giant spider the size of a child with an intense love of adventure, juice, and frogs. He seems to raid offshore oil rigs and cargo ships for food, and supplies. The term spirate seems to be a combination of the worlds spider and pirate.\"",
		"URL": "https://Noobrapter.newgrounds.com/"
	},
	10 : {
		"Author": "Chdonga",
		"Name": "Jay Kweevil",
		"Desc": "\"A strange little bugaboo discovered within the virtual cyberspace. He's been seen moving his couch around and sliding across the floor without moving his legs. Occasionally red liquid will leak from the walls which he will sip with his horrifying proboscis. We suspect that the hat is the source of his powers.\"",
		"URL": "https://Chdonga.newgrounds.com/"
	},
	11 : {
		"Author": "eeMcCutcheon",
		"Name": "Coleoptera Sapiens",
		"Desc": "\"Coleoptera Sapiens, often colloquially referred to as a Human Beetle. This man's name is Augustus. He is 33 years old, enjoys watching spy movies, and prefers staying indoors, especially when it rains. As a sign of respect, he greets friends and strangers alike by headbutting their feet and attempting to flip them onto their backs with the wide horn on top of his head.\"",
		"URL": "https://eeMcCutcheon.newgrounds.com/"
	},
	12 : {
		"Author": "StormyDew",
		"Name": "Glass Orchid Mantis",
		"Desc": "\"The Glass Orchid Mantis, scientifically known as Cristallomantis florachroma, is a captivating and elusive insect that inhabits humid environments. Encounters with the Mantis are rare, adding an air of mystery to its existence.\"",
		"URL": "https://StormyDew.newgrounds.com/"
	},
	13 : {
		"Author": "LiTenNet",
		"Name": "Ockink",
		"Desc": "\"an bug that adheres to the skin of its victims with its two elastic limbs and with the needle of the center absorbs the blood that it subsequently stores in its head.\"",
		"URL": "https://LiTenNet.newgrounds.com/"
	},
	14 : {
		"Author": "vestik",
		"Name": "Embermasq",
		"Desc": "\"Embermasq lives in a castle, floating above flaming blue fires. The warmth from the fire gives Embermasq the ability to keep living. Embermasq wears a mask to hide its true identity.\"",
		"URL": "https://vestik.newgrounds.com/"
	},
	15 : {
		"Author": "Deoozeter",
		"Name": "Wheelectdae",
		"Desc": "\"Wheelectdaes are somewhat related to the American cockroaches. With their wheel-like feet, they can move at the same speed as most vehicles. Unlike their cousins, these are often more popular with both young and old.\"",
		"URL": "https://deoozeter.newgrounds.com/"
	},
	16 : {
		"Author": "Nebulate",
		"Name": "USBug",
		"Desc": "\"The USBug is a offspring of the Server_BUG that resides inside an USB stick. Tho the USBug does not have their limbs or head in the physical world. We have them plugged in a hardrive to give them an enviroment to be in. They like to be in a synthwave world but generaly enjoys to reside in places with colder coulors. They are compleatly harmless and uses most of their time to play and sleep.\"",
		"URL": "https://Nebulate.newgrounds.com/"
	},
	17 : {
		"Author": "kunishiro",
		"Name": "Lookfat",
		"Desc": "\"C'mon fat look fat you're gettin nervous man, cmon look fat you and me fat lets do pull ups right here right now, cmon man shit\"",
		"URL": "https://kunishiro.newgrounds.com/"
	},
	18 : {
		"Author": "Lizguy74",
		"Name": "Sky Worm",
		"Desc": "\"The “Sky Worm” is known for its gentle nature and telekinetic powers that it uses to lift heavier objects, gather food, or lightly sail across the breeze.
They’re most active in spring time and summer months;
It’s been said that seeing one in the wild, brings good luck and that they can sense emotions.\"",
		"URL": "https://Lizguy74.newgrounds.com/"
	},
	19 : {
		"Author": "kaiakairos",
		"Name": "Liam",
		"Desc": "\"we don't like liam very much so we put him in prison forever. when we caught him he was riding this yellow thing, idk what it is. typical liam move tho :/\"",
		"URL": "https://kaiakairos.newgrounds.com/"
	},
	20 : {
		"Author": "PhonographClock",
		"Name": "Eenomort Glowworm",
		"Desc": "\"Enigmatic, cycloptic relative of the common firefly. Exists in a halted transitory state between larva and maturity, never quite reaching adult stage and causing them to appear lopsided and clumsy. Congregate in mass swarms to areas high in chthonic energy. Thrives on attention and squeaks like a rubber toy when distressed. Very cute please let it out.\"",
		"URL": "https://PhonographClock.newgrounds.com/"
	},
	21 : {
		"Author": "BoiledMilkz",
		"Name": "Curlax",
		"Desc": "\"This bug likes eating snow, ice and hail. Expect it to see lots of it in the winter. Resembles an ice curling. It's mortal enemy is the blob fish.\"",
		"URL": "https://BoiledMilkz.newgrounds.com/"
	},
	22 : {
		"Author": "MikeMaster1",
		"Name": "Alien Cat",
		"Desc": "\"This bug came from an unknown planet. He lives in Mars now and he really enjoys living in there. He likes to explore planets and try out new stuff.\"",
		"URL": "https://MikeMaster1.newgrounds.com/"
	},
	23 : {
		"Author": "SilkCaesar",
		"Name": "Jordanian Router Moth",
		"Desc": "\"The Jordanian Router Moth (Eublemma unda), sometimes the Palestinian Router Moth, is endemic to both banks of the Jordan River and is known for its capacity to replicate and extend Bluetooth and Wi-Fi signals. \"",
		"URL": "https://SilkCaesar.newgrounds.com/"
	},
	24 : {
		"Author": "Tomafokio",
		"Name": "MochiKit",
		"Desc": "\"This bug loves mochi and dango. He steals sweets from shops and brings them to an empty building to eat. He loves rice sweets and an empty large enclosed space for walking. Playing with sticks\"",
		"URL": "https://Tomafokio.newgrounds.com/"
	},
	25 : {
		"Author": "Gribbus07",
		"Name": "Weeblue",
		"Desc": "\"this funny blue weevil thing is the size of a blueberry and people mistake it them for blueberries... (god I never actually expected to give this thing a back story)\"",
		"URL": "https://Gribbus07.newgrounds.com/"
	},
	26 : {
		"Author": "Phaox05",
		"Name": "Volcanic Spiderspine",
		"Desc": "\"A type of spider that lives in volcanic areas, its red skin absorbs energy from heat, their colorful spines from behind are used to catch preys and also for defense from other creatures.\"",
		"URL": "https://Phaox05.newgrounds.com/"
	},
	27 : {
		"Author": "stripedAbstraction",
		"Name": "Shroomhat",
		"Desc": "\"The shroomhat is a larger than average insect that lives in the purple fields of earth and develops a large hat like growth that resembles a mushroom as it ages. This hat like growth is used to protect itself against threats such as rain and flying predators.\"",
		"URL": "https://stripedAbstraction.newgrounds.com/"
	},
	28 : {
		"Author": "Trikholit",
		"Name": "The Balloon Bug 
		(Fulton Abduxit)",
		"Desc": "\"Lives in Costa Rica and hunts other insects similarly to spider by injecting venom. After prey is immobilized, Balloon bug chemically expands second stomach hidden behind scales, suspending itself midair to eat in safety. 
		Were main inspiration behind Fulton surface-to-air recovery system. 
		Due to weird way of securing food, is in IUCN Red List.\"",
		"URL": "https://Trikholit.newgrounds.com/"
	},
	29 : {
		"Author": "lazygeko",
		"Name": "Fomitato 
		(Fortis Imitator)",
		"Desc": "\"They were recently found to mimic the behavior of the Hercules beetle (hence their certain resemblance to the species). The most noticeable difference is that the Fomitato tends to walk with two of its legs, plus its mouth is located between its horns unlike any other insect.\"",
		"URL": "https://lazygeko.newgrounds.com/"
	},
	30 : {
		"Author": "Armadill0h",
		"Name": "Battle Beetle",
		"Desc": "\"Battle Beetles live for nothing but war. The moment they are hatched from their eggs, the Battle Bugs are given a rank in the Bug Battalion, and trained to fight in the Forever War between the Beetles and the Roaches.\"",
		"URL": "https://Armadill0h.newgrounds.com/"
	},
	31 : {
		"Author": "NeoBioHazardus",
		"Name": "Noxitidfly",
		"Desc": "\"Specimen-235, or 'Noxitidfly' is a gigantic mantidfly with glowing green acid. Prone to random bouts of aggression, anything they kill is piled into the rotting mass in the corner, though not eaten. A constant supply of formaldehyde is required for food and to pacify them.\"",
		"URL": "https://NeoBioHazardus.newgrounds.com/"
	},
	32 : {
		"Author": "ScepterDPinoy",
		"Name": "Plantaclysm",
		"Desc": "\"An ant digs it's way to the surface from the earths core mutating humans, plant's ,and animals as food with it's poison substance that spews from it's mouth.\"",
		"URL": "https://ScepterDPinoy.newgrounds.com/"
	},
	33 : {
		"Author": "Aalasteir",
		"Name": "Ku",
		"Desc": "\"Active desert insects with poisonous stingers feed on other insects. Along with making disgustingly loud fart sounds to intimidate their prey.\"",
		"URL": "https://Aalasteir.newgrounds.com/"
	},
	34 : {
		"Author": "MajoraCats",
		"Name": "Circus Mantis",
		"Desc": "\"Circus Mantis mimics the colorful appearence of the clowns for cautivate their preys with their appeareance for later make them laugh and laugh with their curious tricks and games\"",
		"URL": "https://MajoraCats.newgrounds.com/"
	},
	35 : {
		"Author": "MOHD5aqer",
		"Name": "ORC beetle",
		"Desc": "\"despite the name, they're not actually hostile unless they feel threatened, that's when they start injecting mild venom that can stun you in hours, unless treated immediately\"",
		"URL": "https://MOHD5aqer.newgrounds.com/"
	},
	36 : {
		"Author": "Piffy11112",
		"Name": "Ofiem",
		"Desc": "\"Ofiem grow from a tree. Their skin feels like an orange skin and their tail is used for producing ofium jam and polinate flower, with preferred environment such as a mushy green hill with short grass or a swamp. Their big as a single peanut and their diet is consist of little bug like fleas and fly\"",
		"URL": "https://Piffy11112.newgrounds.com/"
	},
	37 : {
		"Author": "SaffRox7650",
		"Name": "Road Shredder",
		"Desc": "\"He's done it all; He tried (and failed) to steal the car from Pole Position, succesfully turn food into a vehicle, start an automobile-based religion, get assassinated, survive the assassination AND have a crappy fighting game right after resurrection! A true role model among bugs.\"",
		"URL": "https://SaffRox7650.newgrounds.com/"
	},
	38 : {
		"Author": "bubblemachine",
		"Name": "Pot Mites",
		"Desc": "\"Pot mites are a plant parasite commonly found feeding on flowers. While these pests can be quite annoying, they can be easily taken care of with soap and water.\"",
		"URL": "https://bubblemachine.newgrounds.com/"
	},
	39 : {
		"Author": "TheFooI",
		"Name": "Squog",
		"Desc": "\"A small frail and timid creature with a nack for interior design and top hats. rumored to be a derivative of a pill bug without the shell, these little insects create elaborate homes to serve themselves without having to go outside and expose themselves to predators. Quick to startle and fast.\"",
		"URL": "https://TheFooI.newgrounds.com/"
	},
	40 : {
		"Author": "SparkyyyBees",
		"Name": "Neobug",
		"Desc": "\"Neil Armstrong whooo? As far as I'm concerned, Neobug was the first to land on the moon. Insects have been experimenting with rocket science for decades, most people don't know this due to their small inconspicuous size. You've probably trampled a lab of theirs and had no idea.\"",
		"URL": "https://SparkyyyBees.newgrounds.com/"
	},
	41 : {
		"Author": "ForgeFrog",
		"Name": "Brog Fugs",
		"Desc": "\"Finglus Enthorps or Brog Fugs (common Fug) are found in northern Telmaddlestan and United Gumates in montane forests. Brog Fugs typically feed on lichen found in the grooves of bark on trees as well as amber ground moss. Eating or handling is highly discouraged due to their pungent odor.\"",
		"URL": "https://ForgeFrog.newgrounds.com/"
	},
	42 : {
		"Author": "sugaphys",
		"Name": "freek",
		"Desc": "\"it's bipedal. it makes noises.\"",
		"URL": "https://sugaphys.newgrounds.com/"
	},
	43 : {
		"Author": "HogGruesome",
		"Name": "Hind-Spotted Puffbug",
		"Desc": "\"Hind spots? Check. Puff? Check. These little bugs usually live in flower fields, using their brightly colored wings and over-the-top headpuffs as camouflage as they go about their lives. \"",
		"URL": "https://HogGruesome.newgrounds.com/"
	},
	44 : {
		"Author": "JJ696969420",
		"Name": "BayBeetle",
		"Desc": "\"This is an invasive house bug from Lake Erie. Its name was given to it because mobs of them would hide in sand by the lake to then kill and eat everything... Also because the top of the beetle looks like a poorly drawn baby. Pretty funny\"",
		"URL": "https://JJ696969420.newgrounds.com/"
	},
	45 : {
		"Author": "Kafkacow",
		"Name": "Funkfly",
		"Desc": "\"An exceptionally rare, bipedal insect infamous for its manic and deranged behavior. Notable for its pronounced gut, distinct face and mammary tissue.\"",
		"URL": "https://Kafkacow.newgrounds.com/"
	},
	46 : {
		"Author": "Megadrivesonic",
		"Name": "QuestHopper",
		"Desc": "\"This little guy is ready for an adventure, Will you join him on his quest? This adventuring bug is eager for anyone to join him on his adventures. You can typically find him wherever there is the smell of adventure and wherever maidens need rescuing from vicious dragonflies.\"",
		"URL": "https://Megadrivesonic.newgrounds.com/"
	},
	47 : {
		"Author": "nenunfar",
		"Name": "Bugren",
		"Desc": "\"Bugren are dedicated to grabbing and carrying shiny things to their nest, precious stones, accessories or anything with enough shine regardless of whether it has any value, it is common to see them fight among themselves over some shiny object\"",
		"URL": "https://nenunfar.newgrounds.com/"
	},
	48 : {
		"Author": "Weircorn2128",
		"Name": "Wargrub",
		"Desc": "\"He's not your ordinary grub, he's been through many unspoken wars throughout the universe. Witnessing his brother's deaths in the battlefield, Wargrub sought vengeance to their enemy.  He's body was retrieved by his comrades  and tried their best to save him, his lower body was then replaced by mechanical wheels for mobility.\"",
		"URL": "https://Weircorn2128.newgrounds.com/"
	},
	49 : {
		"Author": "astey",
		"Name": "Volkswagen Beetle",
		"Desc": "\"4 wheeled perfection. Native to Wolfsburg, Germany.\"",
		"URL": "https://astey.newgrounds.com/"
	},
	50 : {
		"Author": "BigBee.png",
		"Name": "Bite Mite",
		"Desc": "\"A common, gregarious omnivore that is often seen hunting in swarms. They can be found pretty much everywhere, and are sometimes kept as pets.\"",
		"URL": "https://BigBee.newgrounds.com/"
	},
	51 : {
		"Author": "AZ0RZER0",
		"Name": "GR4V3 VV4SP",
		"Desc": "\"Mostly found around graveyards, it's not agressive, or at least not until someone approaches the hive.  It has a sting that carries a lethal glowing yellow poison and loves sugar.\"",
		"URL": "https://AZ0RZER0.newgrounds.com/"
	},
	52 : {
		"Author": "<Anonymous>",
		"Name": "The Butter-Fly",
		"Desc": "\"No way! A stick of butter with wings and everything?! I can’t believe it’s not a butterfly!\"",
		"URL": "https://newgrounds.com/"
	},
	53 : {
		"Author": "Yuri Kadry",
		"Name": "R3D B34T-O",
		"Desc": "\"They are red, they are beatles, are you a jokester?\"",
		"URL": "https://yurikadry.newgrounds.com/"
	},
	54 : {
		"Author": "Beeetelgeuse",
		"Name": "Pancake beetle",
		"Desc": "\"Adapted to modern technology perfectly, evolving to look like two pancakes stacked together, Their antennas even transformed into a mountain of whipped cream with a strawberry on top. They hide in houses and homes, emptying cupboards as their sustenance. Native to Greece and Italy, but now live everywhere.\"",
		"URL": "https://Beeetelgeuse.newgrounds.com/"
	},
	55 : {
		"Author": "Rictastrophe",
		"Name": "Shrimpion",
		"Desc": "\"A shrimp-like arachnid that can be found near natural ponds of cocktail sauce. So far three variants have been discovered, grilled, boiled, and fried. 
\"",
		"URL": "https://Rictastrophe.newgrounds.com/"
	},
	56 : {
		"Author": "SloppyStinko",
		"Name": "Sharon the Snail",
		"Desc": "\"This rare rose colored snail likes to hang around flower bushes. Her diet consists of fruits freshly fallen off of trees and crunchy leaves.\"",
		"URL": "https://SloppyStinko.newgrounds.com/"
	},
	57 : {
		"Author": "glorpus",
		"Name": "Doug the Bug",
		"Desc": "\"Often found on sun-warmed stones, Doug the Bug will use this pose to scare off predators. Little is known of its origin.\"",
		"URL": "https://glorpus.newgrounds.com/"
	},
	58 : {
		"Author": "JPastel",
		"Name": "Calliptamus akrider",
		"Desc": "\"This strange species of grasshopper doesn't spend too much time staying still, preferring to always ride around on its little wheels. If raising these grasshoppers, please note that in great numbers they reek of exhaust fumes, though this isn't much of a problem because they're not real.\"",
		"URL": "https://JPastel.newgrounds.com/"
	},
	59 : {
		"Author": "PaleFreak",
		"Name": "Beapillar",
		"Desc": "\"Bees taste salty, and Caterpillars are a bit sweet, and when you mix them together? Actually it doesn't help their taste much, its almost like eating dimes sprinkled with brown sugar.\"",
		"URL": "https://PaleFreak.newgrounds.com/"
	},
	60 : {
		"Author": "succojones",
		"Name": "Asher",
		"Desc": "\"His species went extinct from chain smoking. Having lost a ten year court battle against big tobacco, he now spends his days working out and maintaining his mental health.\"",
		"URL": "https://succojones.newgrounds.com/"
	},
	61 : {
		"Author": "rosarjc",
		"Name": "Golden Caribbean 
		Beetlestache",
		"Desc": "\"It has shiny brightly colors in its body, plus with a glorious mustache, you can see it on the Caribbean region. Even if the mustache looks fluffy (and it is), don’t touch it, is poisonous\"",
		"URL": "https://rosarjc.newgrounds.com/"
	},
	62 : {
		"Author": "Questtrek",
		"Name": "Spectral Sandstalker",
		"Desc": "\"A hovering creature of unknown origins that wanders desert roads in the twilight. For those without a death wish, do not approach. For those with a death wish, proceed with caution and have interstellar bacon at the ready.\"",
		"URL": "https://Questtrek.newgrounds.com/"
	},
}
