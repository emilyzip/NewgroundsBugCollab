extends Node

var text_queue = []
var isTalky = false
var canMove = true
var time = Time.get_time_dict_from_system()

var read_NPC: String

## Global Function that can be called to queue up text into the Dialouge Window.
func queue_text(next_text):
	text_queue.push_back(next_text)
	
func get_talky_text(index):
	# These are the available Dialouge Stacks.
	match index:
		"Default": 
			queue_text(tr("Default"))
		# -\-\-\- Scientist Lines -/-/-/- #
		"Scientist_Specimen":
			queue_text(tr("TALKY_SCIENTIST_SPECIMEN"))
		"Scientist_Lost":
			queue_text(tr("TALKY_SCIENTIST_LOST"))
		"Scientist_Shoulder":
			queue_text(tr("TALKY_SCIENTIST_SHOULDER_1"))
			queue_text(tr("TALKY_SCIENTIST_SHOULDER_2"))
		"Scientist_Math":
			queue_text(tr("TALKY_SCIENTIST_MATH"))
		"Scientist_Dickhead":
			queue_text(tr("TALKY_SCIENTIST_DICKHEAD"))
		"Scientist_Balls":
			queue_text(tr("TALKY_SCIENTIST_BALLS_1"))
			queue_text(tr("TALKY_SCIENTIST_BALLS_2"))
			queue_text(tr("TALKY_SCIENTIST_BALLS_3"))
		"Scientist_Dogs":
			queue_text(tr("TALKY_SCIENTIST_DOGS"))
		"Scientist_Eastern":
			queue_text(tr("TALKY_SCIENTIST_EASTERN_1"))
			queue_text(tr("TALKY_SCIENTIST_EASTERN_2"))
		"Scientist_Familar":
			queue_text(tr("TALKY_SCIENTIST_FAMILAR"))
		"Scientist_Squirrels":
			queue_text(tr("TALKY_SCIENTIST_SQUIRRELS"))
		# -\-\-\- Generic Lines -/-/-/- #
		"Shorts":
			queue_text(tr("TALKY_GENERIC_SHORTS"))
		"Technology":
			queue_text(tr("TALKY_GENERIC_TECHNOLOGY"))
		"Water2":
			queue_text(tr("TALKY_GENERIC_WATER2"))
		"Pickup":
			queue_text(tr("TALKY_GENERIC_PICKUP"))
		"Cold":
			queue_text(tr("TALKY_GENERIC_COLD"))
		"Witch":
			queue_text(tr("TALKY_GENERIC_WITCH"))
		"Witch2":
			queue_text(tr("TALKY_GENERIC_WITCHAGAIN"))
		"Doll":
			queue_text(tr("TALKY_GENERIC_DOLL"))
		"Happy":
			queue_text(tr("TALKY_GENERIC_HAPPY"))
		"Employee":
			queue_text(tr("TALKY_GENERIC_EMPLOYEE"))
		"Legs":
			queue_text(tr("TALKY_GENERIC_LEGS"))
		"Funding":
			queue_text(tr("TALKY_GENERIC_FUNDING"))
		"Funnyhouse":
			queue_text(tr("TALKY_FUNNYHOUSE_1"))
			queue_text(tr("TALKY_FUNNYHOUSE_2"))
		# -\-\-\- Unique NPC Lines -/-/-/- #
		"Slug":
			queue_text(tr("TALKY_SLUG_1"))
			queue_text(tr("TALKY_SLUG_2"))
		"Dracula":
			queue_text(tr("TALKY_DRACULA_1"))
			queue_text(tr("TALKY_DRACULA_2"))
		"GiantRat":
			queue_text(tr("TALKY_GIANTRAT"))
		"Toji":
			queue_text(tr("TALKY_TOJI_1"))
			queue_text(tr("TALKY_TOJI_2"))
		"Frosty":
			queue_text(tr("TALKY_FROSTY_1"))
			queue_text(tr("TALKY_FROSTY_2"))
		"Haro":
			queue_text(tr("TALKY_HARO_HELLYEAH"))
		"Mardigras":
			queue_text(tr("TALKY_MARDIGRAS_TIME"))
		"Mclcl":
			queue_text(tr("TALKY_MCLCL_1"))
			queue_text(tr("TALKY_MCLCL_2"))
		"Funnyrig":
			queue_text(tr("TALKY_FUNNYRIG_PURG"))
		"Marathon":
			queue_text(tr("TALKY_MARATHON_MAYBE"))
		"Martian_M":
			queue_text(tr("TALKY_MARTIAN_M"))
		"Martian_F":
			queue_text(tr("TALKY_MARTIAN_F"))
		"Skeleton":
			queue_text(tr("TALKY_SKELETON"))
		"Duke":
			queue_text(tr("TALKY_DUKE"))
		"RacistSR":
			queue_text(tr("TALKY_RACISTSR_1"))
			queue_text(tr("TALKY_RACISTSR_2"))
		"Sugaphys":
			queue_text(tr("TALKY_SUGAPHYS_1"))
			queue_text(tr("TALKY_SUGAPHYS_2"))
			queue_text(tr("TALKY_SUGAPHYS_3"))
		"Shy":
			queue_text(tr("TALKY_SHY"))
		"Conundrym":
			queue_text(tr("TALKY_CONUNDRYM"))
		"Quint":
			queue_text(tr("TALKY_QUINT_1"))
			queue_text(tr("TALKY_QUINT_2"))
		"Emi": # lol 
			queue_text(tr("TALKY_EMI_1"))
			queue_text(tr("TALKY_EMI_2"))
			queue_text(tr("TALKY_EMI_3"))
			queue_text(tr("TALKY_EMI_4"))
			queue_text(tr("TALKY_EMI_5"))
			queue_text(tr("TALKY_EMI_6"))
			queue_text(tr("TALKY_EMI_7"))
			queue_text(tr("TALKY_EMI_8"))
		"P_TV":
			queue_text(tr("PROP_TV_1"))
			queue_text(tr("PROP_TV_2"))
		"P_SWITCH":
			queue_text(tr("PROP_SWITCH"))
		"P_CLOCK":
			queue_text("it reads %02d:%02d" % [time.hour, time.minute])
		"P_SIGN_LAB":
			queue_text(tr("PROP_SIGN_LAB"))
		"P_SIGN_HOUSE":
			queue_text(tr("PROP_SIGN_HOUSE"))
		"P_SIGN_NEIGHBOR":
			queue_text(tr("PROP_SIGN_NEIGHBOR"))
		# -\-\-\- Error Handler -/-/-/- #
		_:
			queue_text(tr("ERROR"))
