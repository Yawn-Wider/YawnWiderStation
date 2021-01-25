//Atmosphere properties
#define CRYOGAIA_ONE_ATMOSPHERE	101.13 //kPa
#define CRYOGAIA_AVG_TEMP	233.15 //kelvin

#define CRYOGAIA_PER_N2		0.24 //percent
#define CRYOGAIA_PER_O2		0.72
#define CRYOGAIA_PER_N2O	0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define CRYOGAIA_PER_CO2	0.04
#define CRYOGAIA_PER_PHORON	0.00

//Math only beyond this point
#define CRYOGAIA_MOL_PER_TURF	(CRYOGAIA_ONE_ATMOSPHERE*CELL_VOLUME/(CRYOGAIA_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define CRYOGAIA_MOL_N2			(CRYOGAIA_MOL_PER_TURF * CRYOGAIA_PER_N2)
#define CRYOGAIA_MOL_O2			(CRYOGAIA_MOL_PER_TURF * CRYOGAIA_PER_O2)
#define CRYOGAIA_MOL_N2O			(CRYOGAIA_MOL_PER_TURF * CRYOGAIA_PER_N2O)
#define CRYOGAIA_MOL_CO2			(CRYOGAIA_MOL_PER_TURF * CRYOGAIA_PER_CO2)
#define CRYOGAIA_MOL_PHORON		(CRYOGAIA_MOL_PER_TURF * CRYOGAIA_PER_PHORON)

//Turfmakers
#define CRYOGAIA_SET_ATMOS	nitrogen=CRYOGAIA_MOL_N2;oxygen=CRYOGAIA_MOL_O2;carbon_dioxide=CRYOGAIA_MOL_CO2;phoron=CRYOGAIA_MOL_PHORON;temperature=CRYOGAIA_AVG_TEMP
#define CRYOGAIA_TURF_CREATE(x)	x/cryogaia/nitrogen=CRYOGAIA_MOL_N2;x/cryogaia/oxygen=CRYOGAIA_MOL_O2;x/cryogaia/carbon_dioxide=CRYOGAIA_MOL_CO2;x/cryogaia/phoron=CRYOGAIA_MOL_PHORON;x/cryogaia/temperature=CRYOGAIA_AVG_TEMP;x/cryogaia/outdoors=TRUE;x/cryogaia/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define CRYOGAIA_TURF_CREATE_UN(x)	x/cryogaia/nitrogen=CRYOGAIA_MOL_N2;x/cryogaia/oxygen=CRYOGAIA_MOL_O2;x/cryogaia/carbon_dioxide=CRYOGAIA_MOL_CO2;x/cryogaia/phoron=CRYOGAIA_MOL_PHORON;x/cryogaia/temperature=CRYOGAIA_AVG_TEMP

// This is a wall you surround the area of your "planet" with, that makes the atmosphere inside stay within bounds, even if canisters
// are opened or other strange things occur.
/turf/unsimulated/wall/planetary/borealis2
	name = "Ice wall"
	desc = "Frigid Ice that seems to be stronger then most manmade structures."
	icon = 'icons/turf/snow_new.dmi'
	icon_state = "Icerock"
	alpha = 0xFF
	CRYOGAIA_SET_ATMOS

//Code below is to get rid of build errors in regard to virgo code and is not used by use
/turf/unsimulated/wall/planetary/virgo3b
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	VIRGO3B_SET_ATMOS