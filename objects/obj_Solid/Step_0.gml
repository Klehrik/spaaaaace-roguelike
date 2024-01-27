/// Solid : Step

// Set sprite size
image_xscale = Size / sprite_get_width(sprite_index);
image_yscale = Size / sprite_get_height(sprite_index);

// Move and decelerate
if (MoveVec.getMag() > 0) MoveVec.setMag(MoveVec.getMag() * 0.98);
if (MoveVec.getMag() <= 0.1) MoveVec.setMag(0);
Rotate *= 0.95;

x += MoveVec.x;
y += MoveVec.y;

image_angle += Rotate;

// NoDamageTime
if (NoDamageTime > 0) NoDamageTime -= 1;
