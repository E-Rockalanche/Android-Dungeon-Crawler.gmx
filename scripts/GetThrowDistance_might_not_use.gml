/*
var entity = argument0;
var item = argument1;


var force, mass, theta, impulse_dist = 0.635;//arm length
force = 60*entity.strength;//convert strength to force
mass = item[? ITEM.WEIGHT]/0.454;//convert lb to kg

var velocity2rd = 2*impulse_dist*force/(mass + (9.28/2) );

var theta = 45, g = 9.81;

var dist = floor(sin(2*theta) * velocity2rd / g);//returns distance based on velocity and angle
return dist;
