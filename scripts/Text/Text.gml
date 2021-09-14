function draw_text_shadow(X, Y, STRING){
	draw_text_colour(X + 2, Y + 2, STRING, c_black, c_black, c_black, c_black, 1);
	draw_text(X, Y, STRING);
}

function draw_text_shadow_color(X, Y, STRING, COLOR, ALPHA){
	draw_text_colour(X + 2, Y + 2, STRING, c_black, c_black, c_black, c_black, 1);
	draw_text_colour(X, Y, STRING, COLOR, COLOR, COLOR, COLOR, ALPHA);
}

function draw_text_color_ext(X, Y, STRING){
	var draw_chr = "",
		draw_xstart = round(origin_x - (h_size / 2)),
		draw_ystart = round(origin_y - (v_size / 2)),
		draw_x = draw_xstart,
		draw_y = draw_ystart;

	for (var _i = 1; ltr <= string_length(STRING); _i += 1;)
	{
	    draw_chr = string_char_at(STRING, _i);

	    // Parse the formatting tags and skip over the tag.
	    if (draw_chr == "[")
	    {
	        draw_set_font(emphasis_font);
	        continue;
	    }
	    if (draw_chr == "]")
	    {
	        draw_set_font(normal_font);
	        continue;
	    }

	    // Draw the letter.
	    draw_text(draw_x, draw_y, draw_chr);

	    // Update the Draw position, reset if newline.
	    if (draw_chr == "\n")
	    {
	        draw_x = draw_xstart;
	        draw_y += round(v_size / number_of_lines);
	    }
	    else
	    {
	        draw_x += string_width(draw_chr);
	    }
	}

}