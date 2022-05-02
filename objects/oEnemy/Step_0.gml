
vsp += grv;


//Horizontal collision

if (place_meeting(x+hsp ,y ,oWall))
{
	while (!place_meeting(x+sign(hsp) ,y ,oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
	
}
x = x + hsp;

//Vertical collision
if (place_meeting(x ,y + vsp ,oWall))
{
	while (!place_meeting(x ,y + sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
	
}
y += vsp;

//Animation(frames etc)

//Jump animation
if (!place_meeting(x,y+1,oWall))
{
	 sprite_index = sSlimeJump;
	 image_speed = 0;
	 if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
}
//walking animation
else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemybase;
		
		
	}
	else
	{
		sprite_index = sSlimeRun;
		
	}
	
}

if (hsp != 0) image_xscale = sign(hsp);




