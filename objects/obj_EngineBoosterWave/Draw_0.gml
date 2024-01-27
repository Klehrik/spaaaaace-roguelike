/// Engine Booster Wave : Draw

var duration = room_speed;

Size += 600 / duration;
if (image_alpha > 0) image_alpha -= 1 / duration;
else instance_destroy();

draw_sprite_ext(spr_InvertedCircle, 0, x, y, Size/sprite_get_width(spr_InvertedCircle) * 2, Size/sprite_get_height(spr_InvertedCircle) * 2, 0, image_blend, image_alpha / 2);
