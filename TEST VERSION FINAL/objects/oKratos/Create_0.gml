hsp = 0;
vsp = 0;
wlksp = 4;
grv = 1;

has_axe = 1;
h_direction = 0;

pv = 10;
blink = 0;
imune = 0;

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();


enum PLAYERSTATE
{
	FREE,
	ATTACK_LEGERE,
	ATTACK_LOURDE,
	ATTACK_COMBO_LEGERE,
	ATTACK_COMBO_LOURDE,
	ATTACK_DISTANCE,
	BOUCLIER,
	HEAL
}