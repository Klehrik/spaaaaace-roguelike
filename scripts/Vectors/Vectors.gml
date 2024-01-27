/// 2D Vector Library
/// Klehrik


// [Functions - vec2]

// new vec2(x, y);
// * Create a new Vec2 with a default value of (0, 0).

// clone();
// * Return a new copy of the vector.


// getDir();
// * Return the direction of the vector.

// getMag();
// * Return the magnitude of the vector.

// setDir(dir);
// * Set the direction of the vector to a specified angle (in degrees).

// setMag(scalar);
// * Set the magnitude of the vector to a scalar.


// add(vec2);
// * Add another vec2 to the vector.

// subtract(vec2);
// * Subtract another vec2 from the vector.

// multiply(scalar);
// * Multiply the vector by a scalar.

// normalize();
// * Normalize the vector.

// rotate(degrees);
// * Rotate the vector by a number of degrees.


function vec2(_x = 0, _y = 0) constructor
{
	x = _x;
	y = _y;
	
	
	static clone = function()
	{
		return new vec2(x, y);
	}
	
	
	static getDir = function()
	{
		return point_direction(0, 0, x, y);
	}
	
	static getMag = function()
	{
		return point_distance(0, 0, x, y);
	}
	
	static setDir = function(dir)
	{
		var m = getMag();
		x = dcos(dir) * m;
		y = -dsin(dir) * m;
	}
	
	static setMag = function(scalar)
	{
		var m = getMag();
		if (m > 0)
		{
			x /= m;
			y /= m;
		}
		x *= scalar;
		y *= scalar;
	}
	
	
	static add = function(_vec2)
	{
		x += _vec2.x;
		y += _vec2.y;
	}
	
	static subtract = function(_vec2)
	{
		x -= _vec2.x;
		y -= _vec2.y;
	}
	
	static multiply = function(scalar)
	{
		x *= scalar;
		y *= scalar;
	}
	
	static normalize = function()
	{
		var m = getMag();
		if (m > 0)
		{
			x /= m;
			y /= m;
		}
	}
	
	static rotate = function(degrees)
	{
		var dir = getDir() + degrees;
		var m = getMag();
		x = dcos(dir) * m;
		y = -dsin(dir) * m;
	}
}
