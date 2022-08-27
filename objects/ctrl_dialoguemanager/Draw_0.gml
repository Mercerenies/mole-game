
if (_text == "") {
  exit;
}

draw_sprite(spr_DialogueBox, 0, 0, 568);
draw_sprite(spr_DialogueFace, _face, 90, 668);

draw_set_color(c_white);
draw_set_font(fnt_Dialogue);
draw_text_ext(210, 600, _display_text, -1, 804);