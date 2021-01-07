/obj/item/clothing/mask/gas
	name = "Противогаз"
	desc = "Маска, закрывающая лицо, которая может быть подключена к системе подачи воздуха. И хоть она хорошо подходит для сокрытия личности, фильтрует газы она не очень." //More accurate
	icon_state = "gas_alt"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_NORMAL
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = NONE

// **** Welding gas mask ****

/obj/item/clothing/mask/gas/welding
	name = "Сварочная маска"
	desc = "Противогаз со встроенными сварочными очками и защитной маской. Похоже на череп - явно сконструированно ботаном."
	icon_state = "weldingmask"
	materials = list(MAT_METAL=4000, MAT_GLASS=2000)
	flash_protect = 2
	tint = 2
	armor = list("melee" = 10, "bullet" = 16, "laser" = 0,"energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 55)
	actions_types = list(/datum/action/item_action/toggle)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = MASKCOVERSEYES
	visor_flags_inv = HIDEEYES
	visor_flags_cover = MASKCOVERSEYES
	resistance_flags = FIRE_PROOF

/obj/item/clothing/mask/gas/welding/attack_self(mob/user)
	weldingvisortoggle(user)


// ********************************************************************

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "Маска чумного доктора"
	desc = "Модернизированная версия классического дизайна, эта маска не только отфильтровывает токсины, но и может быть подключена к системе подачи воздуха."
	icon_state = "plaguedoctor"
	item_state = "gas_mask"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 2,"energy" = 2, "bomb" = 0, "bio" = 75, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/mask/gas/syndicate
	name = "Улучшенный противогаз"
	desc = "Плотно прилегающая тактическая маска, которая может быть подключена к системе подачи воздуха."
	icon_state = "syndicate"
	strip_delay = 60

/obj/item/clothing/mask/gas/clown_hat
	name = "Клоунские маска и парик"
	desc = "Лицо настоящего проказника. Без парика и маски клоун неполноценен."
	clothing_flags = MASKINTERNALS
	icon_state = "clown"
	item_state = "clown_hat"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE
	actions_types = list(/datum/action/item_action/adjust)
	dog_fashion = /datum/dog_fashion/head/clown

/obj/item/clothing/mask/gas/clown_hat/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/list/options = list()
	options["True Form"] = "clown"
	options["The Feminist"] = "sexyclown"
	options["The Madman"] = "joker"
	options["The Rainbow Color"] ="rainbow"

	var/choice = input(user,"To what form do you wish to Morph this mask?","Morph Mask") in options

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, "<span class='notice'>Your Clown Mask has now morphed into [choice], all praise the Honkmother!</span>")
		return 1

/obj/item/clothing/mask/gas/sexyclown
	name = "Сексуальные клоунские маска и парик"
	desc = "Женская клоунская маска для балующихся трансвеститов или женщин-артисток"
	clothing_flags = MASKINTERNALS
	icon_state = "sexyclown"
	item_state = "sexyclown"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/mime
	name = "Маска мима"
	desc = "Традиционная маска мима. У него жуткое выражение лица."
	clothing_flags = MASKINTERNALS
	icon_state = "mime"
	item_state = "mime"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE
	actions_types = list(/datum/action/item_action/adjust)


/obj/item/clothing/mask/gas/mime/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/list/options = list()
	options["Blanc"] = "mime"
	options["Triste"] = "sadmime"
	options["Effrayé"] = "scaredmime"
	options["Excité"] ="sexymime"

	var/choice = input(user,"To what form do you wish to Morph this mask?","Morph Mask") in options

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, "<span class='notice'>Your Mime Mask has now morphed into [choice]!</span>")
		return 1

/obj/item/clothing/mask/gas/monkeymask
	name = "Маска обезьяны"
	desc = "Маска, используемая в роли обезьяны."
	clothing_flags = MASKINTERNALS
	icon_state = "monkeymask"
	item_state = "monkeymask"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/sexymime
	name = "Сексуальная маска мима"
	desc = "Традиционная женская маска мима."
	clothing_flags = MASKINTERNALS
	icon_state = "sexymime"
	item_state = "sexymime"
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/death_commando
	name = "Маска коммандо смерти"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"

/obj/item/clothing/mask/gas/cyborg
	name = "Визор киборга"
	desc = "Бип боб."
	icon_state = "death"
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/owl_mask
	name = "Маска совы"
	desc = "Вуууу!"
	icon_state = "owl"
	clothing_flags = MASKINTERNALS
	flags_cover = MASKCOVERSEYES
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/gas/carp
	name = "Маска карпа"
	desc = "Гррр рррр."
	icon_state = "carp_mask"

/obj/item/clothing/mask/gas/tiki_mask
	name = "Маска Тики"
	desc = "Жуткая деревянная маска. Вырезана из удивительно плохого куска дерева."
	icon_state = "tiki_eyebrow"
	item_state = "tiki_eyebrow"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	actions_types = list(/datum/action/item_action/adjust)
	dog_fashion = null


/obj/item/clothing/mask/gas/tiki_mask/ui_action_click(mob/user)

	var/mob/M = usr
	var/list/options = list()
	options["Original Tiki"] = "tiki_eyebrow"
	options["Happy Tiki"] = "tiki_happy"
	options["Confused Tiki"] = "tiki_confused"
	options["Angry Tiki"] ="tiki_angry"

	var/choice = input(M,"To what form do you wish to change this mask?","Morph Mask") in options

	if(src && choice && !M.stat && in_range(M,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(M, "The Tiki Mask has now changed into the [choice] Mask!")
		return 1
