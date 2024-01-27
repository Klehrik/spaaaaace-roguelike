/// Shield Pulse : Draw

var duration = room_speed;

Size += 600 / duration;
if (image_alpha > 0) image_alpha -= 1 / duration;
else instance_destroy();

draw_sprite_ext(spr_InvertedCircle, 0, x, y, Size/sprite_get_width(spr_InvertedCircle) * 2, Size/sprite_get_height(spr_InvertedCircle) * 2, 0, image_blend, image_alpha / 2);

// Heal allies
with (par_Ship)
{
	if (point_in_circle(x, y, other.x, other.y, other.Size) and Team == other.Team
	and ds_list_find_index(other.Healed, id) == -1)
	{
		Shield += MaxShield * 0.25;
		ds_list_add(other.Healed, id);
	}
}
