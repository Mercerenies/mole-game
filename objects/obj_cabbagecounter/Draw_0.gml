
draw_self();
draw_set_font(fnt_CabbageCounter);

var text = string(cabbages_collected) + "/" + string(total_cabbages);
draw_set_color(c_white);

if (cant_win) {
  text = "X/" + string(total_cabbages);
  draw_set_color(c_red);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + 71, y + 27, text);
draw_set_valign(fa_top);
draw_set_halign(fa_left);