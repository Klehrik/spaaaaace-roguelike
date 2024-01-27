/// Bubble : Draw

var duration = room_speed;
if (Upgraded == 1) duration *= 3;

Size += 1000 / duration;
if (image_alpha > 0) image_alpha -= 1 / duration;
else instance_destroy();

draw_sprite_ext(spr_InvertedCircle, 0, x, y, Size/sprite_get_width(spr_InvertedCircle) * 2, Size/sprite_get_height(spr_InvertedCircle) * 2, 0, image_blend, image_alpha / 2);

//draw_set_alpha(image_alpha / 2);
//draw_circle(x, y, Size, 0);
//draw_set_alpha(1);

// Destroy projectiles
with (par_Projectile)
{
	if (point_in_circle(x, y, other.x, other.y, other.Size)) instance_destroy();
}
