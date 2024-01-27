/// Misc

function solve_quadratic(a, b, c)
{
	// Check discriminant
	if (sqr(b) - (4 * a * c) >= 0)
	{
		// Solve both roots
		var x1 = (-b + sqrt(sqr(b) - (4 * a * c))) / (2 * a);
		var x2 = (-b - sqrt(sqr(b) - (4 * a * c))) / (2 * a);
		
		// Return the smallest non-negative root
		if (x1 < 0 or (x2 < x1 and x2 >= 0)) x1 = x2;
		return x1;
	}
	else return -1;
}

// GMLscripts.com/license
function instance_nth_nearest(x,y,obj,n)
{
    var pointx,pointy,object,list,nearest;
    pointx = x;
    pointy = y;
    object = obj;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}
