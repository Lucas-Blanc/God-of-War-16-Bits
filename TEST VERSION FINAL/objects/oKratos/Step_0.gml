gauche = (keyboard_check(ord("Q")) || gamepad_button_check(0, gp_padl));
droite = (keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr));
saut = (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1));
attack_legere = (mouse_check_button_pressed(mb_left) || gamepad_button_check(0, gp_face3));
attack_lourde = (mouse_check_button_pressed(mb_right) || gamepad_button_check(0, gp_face4));
attack_distance = (mouse_check_button_pressed(mb_middle) || gamepad_button_check_pressed(0, gp_shoulderr));
block = (keyboard_check_pressed(ord("B")) || gamepad_button_check(0, gp_shoulderl));
heal = gamepad_button_check(0, gp_face2);

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_LEGERE: PlayerState_Attack_Legere(); break;
	case PLAYERSTATE.ATTACK_LOURDE: PlayerState_Attack_Lourde(); break;
	case PLAYERSTATE.ATTACK_COMBO_LEGERE: PlayerState_Combo_Legere(); break;
	case PLAYERSTATE.ATTACK_COMBO_LOURDE: PlayerState_Combo_Lourde(); break;
	case PLAYERSTATE.ATTACK_DISTANCE: PlayerState_Attack_Distance(); break;
	case PLAYERSTATE.BOUCLIER: PlayerState_Bouclier(); break;
	case PLAYERSTATE.HEAL: PlayerState_Heal(); break;
}