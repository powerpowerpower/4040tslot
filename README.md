T-slot 40mm Profile Library

This is a small library for generating T-slot 40mm profiles. It was written using a "blueprint" obtained from an AliExpress seller. You can use this library to generate similar profiles — with or without a central hole.
2020 2040 2080 4080 etc.

Profile functions

With central hole:

    40_profile(tolerance=x, sections=y) or simply 40_profile(x, y)

Without central hole:

    40_profile_no_hole(tolerance=x, sections=y) or simply 40_profile_no_hole(x, y)

Without central hole and without slit:

    40_profile_no_hole_no_slit(tolerance=x, sections=y) or simply 40_profile_no_hole_no_slit(x, y)

Plate variants (flat plate version of the profile)

With central hole:

    plate_40_profile(tolerance=x, sections=y) or simply plate_40_profile(x, y)

Without central hole:

    plate_40_profile_no_hole(tolerance=x, sections=y) or simply plate_40_profile_no_hole(x, y)

Without central hole and without slit:

    plate_40_profile_no_hole_no_slit(tolerance=x, sections=y) or simply plate_40_profile_no_hole_no_slit(x, y)

Polygon modules

The library includes polygon modules, shown in the picture.

Typical 4040 corner:

    t40()

Corner expansion insert:

    t40expansion_insert()

Plain side:

    t40plain_side()

No hole:

    t40_no_hole()

Expansion insert, no hole:

    t40expansion_insert_no_hole()

Plain side, no hole:

    t40plain_side_no_hole()

No hole, no slit:

    t40_no_hole_no_slit()

Expansion insert, no hole, no slit:

    t40expansion_insert_no_hole_no_slit()

Plain side, no hole, no slit:

    t40plain_side_no_hole_no_slit()

Note: When using the polygon modules, don't forget to add a 6.8 mm hole yourself.
