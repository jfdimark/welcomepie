/*
 * Plugin Name:    Equalize Column Heights
 * Plugin URI:     http://logicpool.com/
 * Description:    This function is used to make a series of columns have equal heights
 * Version:        0.1
 *
 * Author:         Don Lyckman
 *                 twitter.com/dlyck
 *                 logicpool.com
 *
 * License:        GPLv2
 *
 * Usage:
 *                 Put all column in a parent div
 *                 Add the function to a selector: $("#parent-id").equalize_column_heights("equalize");
 *                 Add class="equalize" to each div that needs the same height
 */

if(jQuery().pluginMethod) {
    //jQuery plugin exists
} else {
    //jQuery plugin DOES NOT exist
}

(function ($) {

$.fn.equalize_column_heights = function (equalize_class) {

	  var tallest_column=0;
	  
	  parent_id = "column-group" + $(this).attr("id") + " ." + equalize_class;
	  
	  $(parent_id).each(function(index, value) { 
  			 if (tallest_column < $(this).height()){ tallest_column = $(this).height(); }
		});
	  
	  $(parent_id).each(function(index, value) { 
  			 $(this).css({'min-height': tallest_column});
		});

}

}(jQuery));