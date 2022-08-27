
randomize();

global.skip_dia = false;

// Initialize particle systems
global.part_system = part_system_create_layer("Instances_Particles", true);

global.soft_dirt_part = part_type_create();
part_type_sprite(global.soft_dirt_part, spr_DirtCracked, false, false, true);
part_type_size(global.soft_dirt_part, 1.2, 1.9, 0, 0);
part_type_scale(global.soft_dirt_part, 1, 1);
part_type_speed(global.soft_dirt_part, 0.9, 2.0, 0, 0);
part_type_direction(global.soft_dirt_part, 70, 110, 0, 5);
part_type_gravity(global.soft_dirt_part, 0, 0);
part_type_orientation(global.soft_dirt_part, 0, 360, 20, 0, false);
part_type_colour1(global.soft_dirt_part, make_colour_rgb(59, 31, 9));
part_type_alpha2(global.soft_dirt_part, 0.5, 0.0);
part_type_life(global.soft_dirt_part, 5, 15);

global.cabbage_leaf_part = part_type_create();
part_type_sprite(global.cabbage_leaf_part, spr_CabbageLeaf, false, false, true);
part_type_size(global.cabbage_leaf_part, 0.8, 1.2, 0, 0);
part_type_scale(global.cabbage_leaf_part, 1, 1);
part_type_speed(global.cabbage_leaf_part, 0.8, 1.0, 0, 0);
part_type_direction(global.cabbage_leaf_part, 70, 110, 0, 5);
part_type_gravity(global.cabbage_leaf_part, 0, 0);
part_type_orientation(global.cabbage_leaf_part, 0, 360, 20, 0, false);
part_type_colour1(global.cabbage_leaf_part, c_white);
part_type_alpha2(global.cabbage_leaf_part, 0.75, 0.0);
part_type_life(global.cabbage_leaf_part, 5, 15);

global.beehive_part = part_type_create();
part_type_sprite(global.beehive_part, spr_BeehivePart, false, false, true);
part_type_size(global.beehive_part, 0.6, 1.4, 0, 0);
part_type_scale(global.beehive_part, 1, 1);
part_type_speed(global.beehive_part, 0.6, 0.9, 0, 0);
part_type_direction(global.beehive_part, 70, 110, 0, 5);
part_type_gravity(global.beehive_part, 0, 0);
part_type_orientation(global.beehive_part, 0, 360, 20, 0, false);
part_type_colour1(global.beehive_part, c_white);
part_type_alpha2(global.beehive_part, 0.75, 0.0);
part_type_life(global.beehive_part, 5, 20);

global.player_fire = part_type_create();
part_type_shape(global.player_fire, pt_shape_pixel);
part_type_size(global.player_fire, 1, 1, 0, 0);
part_type_scale(global.player_fire, 1, 1);
part_type_speed(global.player_fire, 1, 2.5, 0, 0);
part_type_direction(global.player_fire, 70, 110, 0, 5);
part_type_gravity(global.player_fire, 0, 0);
part_type_orientation(global.player_fire, 0, 0, 0, 0, false);
part_type_colour3(global.player_fire, $2727a1, $7dced4, $8ddee4);
part_type_alpha3(global.player_fire, 1.0, 0.7, 0.0);
part_type_life(global.player_fire, 10, 20);

// DEBUG CODE
//room_goto_next();
room_goto(rm_Level27);
