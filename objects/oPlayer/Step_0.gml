
if (hascontrol)
{
	key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);

	// Calculate movement

	var move = key_right - key_left;

	hsp = move * walksp;
	if move != 0 oScore.timeStart = true;

	vsp += grv;

	if (collision(x , y+1 )) and (key_jump)
	{
		vsp = jumpspd;
	}

	//Horizontal collision

	if (collision(x+hsp ,y ))
	{
		while (!collision(x+sign(hsp) ,y ))
		{
			x += sign(hsp);
		}
		hsp = 0;
	
	}
	x = x + hsp;

	//Vertical collision
	if (collision(x ,y + vsp ))
	{
		while (!collision(x ,y + sign(vsp)))
		{
			y += sign(vsp);
		}
		vsp = 0;
	
	}
	y += vsp;

	//Animation(frames etc)

	//Jump animation
	if (!collision(x,y+1))
	{
		 sprite_index = sPlayer4;
		 image_speed = 0;
		 if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
	}
	//walking animation
	else 
	{
		if(sprite_index == sPlayer4) 
		{
			audio_play_sound(sLanding,6,false);
			audio_sound_pitch(sLanding, choose(0.8,1.0,1.2,1.4));
			
		}
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sPlayer;
		
		
		}
		else
		{
			sprite_index = sPlayerRun;
			
			//Step sound when the frame index changes
			if runIndex != floor(image_index) audio_play_sound(choose(sFootsteep,sFootsteep2,sFootsteep3,sFootsteep4), 8,false);
			runIndex = floor(image_index);
		}
	
	}

	if (hsp != 0) image_xscale = sign(hsp);

	if (hp <=0)
	{
		instance_destroy();	
	}

}
else
{
	key_right = 0;
	key_left = 0
	key_jump = 0
}


