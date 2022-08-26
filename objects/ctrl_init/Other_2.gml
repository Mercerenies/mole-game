
randomize();
room_goto_next();

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
