gfx read node './output/cmgui.exnode'
gfx read elem './output/cmgui.exelem'
gfx create window 1

gfx cre spectrum flow
gfx modify spectrum flow clear overwrite_colour;
gfx modify spectrum flow linear range -1.25 0 extend_above extend_below rainbow colour_range 0 1 component 3;

gfx def field vector_field coord rectangular_cartesian component general.1 general.2 general.3

gfx cre spectrum pressure
gfx modify spectrum pressure linear reverse range 0 1500 extend_above extend_below rainbow colour_range 0 1 component 4;

gfx modify g_element OpenCMISS node_points glyph arrow_solid general size "0.1*0.1*0.1" centre 0,0,0 select_on material default selected_material default_selected data vector_field orientation vector_field scale_factors "0.0*0.0*0.1" spectrum flow

gfx modify window 1 background colour 1 1 1

gfx define faces egroup OpenCMISS
gfx modify g_element OpenCMISS surfaces select_on material default selected_material default_selected data general spectrum pressure