difference() {
    // Outer shape + optional ribs
    union() {
        knob_body(knob_od, knob_h, top_chamfer);
        if (add_ridges)
            ridge_band(knob_od, ridge_band_h, ridge_band_z, ridges_count, ridge_depth, ridge_width);
    }
      // Added smaller O.D. shaft ("stem")
        if (add_stem) {
            // place on top or bottom relative to the knob's center
            translate([0,0, stem_on_top ? (knob_h/2) : -(knob_h/2 + stem_h)])
                knob_stem(stem_od, stem_h, stem_fillet);
        }

    // Subtract DD bore
    dd_bore(shaft_d, shaft_af, clr, knob_h + 0.6);

    // Optional set-screw
    if (add_set_screw)
        set_screw(set_screw_d, set_screw_z);
}

// Notes:
// • Increase ridges_count for finer grip; increase ridge_width/depth for chunkier ribs.
// • Keep ridge_band_h a bit shorter than knob_h so ridges don't collide with the chamfer.
