/* ====================================================================

  This is a 3D model of a mechanical puzzle. It is released under
  the following license:

  Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported
  https://creativecommons.org/licenses/by-nc-nd/3.0/

  This means the model is licensed for personal, noncommercial use
  only. Anyone may print a copy for their own use, but selling or
  otherwise monetizing the model or print (or any derivatives) is
  prohibited. For details, refer to the summary at the above URL.

  Puzzle design (c) Stewart Coffin
  3D model (c) Aaron Siegel

==================================================================== */

include <puzzlecad.scad>

require_puzzlecad_version("2.0");

$tray_scale = 13;

// Uncomment one of the following three lines to render that component.

*pieces();
*tray();
*lid();

module pieces() {
    
    burr_plate([
        ["xx|xx|x."], [".x|.x|xx|x."], ["x.|x.|xx|x."], ["xx|.x|.x"], ["xx.|.xx|..x"]
    ], $burr_scale = [$tray_scale, $tray_scale, $tray_opening_height], $plate_width = 120, $burr_inset = 0.05);
    
}

module tray(render_as_lid = false) {
    
    house1 = [[0, 0], [6, 0], [6, 3], [3, 6], [0, 3]];
    house2 = [[0, 0], [8, 0], [8, 5], [4, 9], [0, 5]] / sqrt(2);
    
    packing_tray(
        opening_polygons = [
            house1,
            [for (point = house2) point + [6 + 4 / $tray_scale, 0]]
        ],
        render_as_lid = render_as_lid,
        title = "Housing Project",
        subtitles = ["Stewart Coffin", "STC #181C"]
    );
    
}

module lid() {
    
    tray(render_as_lid = true);
    
}
