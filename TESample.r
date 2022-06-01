#include "Types.r"
#include "TESample.h"

/* we use an MBAR resource to conveniently load all the menus */

resource 'MBAR' (rMenuBar, preload) {
	{ mApple, mFile, mEdit };		/* three menus */
};


resource 'MENU' (mApple, preload) {
	mApple, textMenuProc,
	0b1111111111111111111111111111101,	/* disable dashed line, enable About and DAs */
	enabled, apple,
	{
		"About FocusedEdit\311",
			noicon, nokey, nomark, plain;
		"-",
			noicon, nokey, nomark, plain
	}
};

resource 'MENU' (mFile, preload) {
	mFile, textMenuProc,
	0b0000000000000000000100000000000,	/* enable Quit only, program enables others */
	enabled, "File",
	{
		"New",
			noicon, "N", nomark, plain;
		"Open",
			noicon, "O", nomark, plain;
		"-",
			noicon, nokey, nomark, plain;
		"Close",
			noicon, "W", nomark, plain;
		"Save",
			noicon, "S", nomark, plain;
		"Save As\311",
			noicon, nokey, nomark, plain;
		"Revert",
			noicon, nokey, nomark, plain;
		"-",
			noicon, nokey, nomark, plain;
		"Page Setup\311",
			noicon, nokey, nomark, plain;
		"Print\311",
			noicon, nokey, nomark, plain;
		"-",
			noicon, nokey, nomark, plain;
		"Quit",
			noicon, "Q", nomark, plain
	}
};

resource 'MENU' (mEdit, preload) {
	mEdit, textMenuProc,
	0b0000000000000000000000000000000,	/* disable everything, program does the enabling */
	enabled, "Edit",
	 {
		"Undo",
			noicon, "Z", nomark, plain;
		"-",
			noicon, nokey, nomark, plain;
		"Cut",
			noicon, "X", nomark, plain;
		"Copy",
			noicon, "C", nomark, plain;
		"Paste",
			noicon, "V", nomark, plain;
		"Clear",
			noicon, nokey, nomark, plain
	}
};


/* this ALRT and DITL are used as an About screen */

resource 'ALRT' (rAboutAlert, purgeable) {
	{40, 20, 160, 290},
	rAboutAlert,
	{ /* array: 4 elements */
		/* [1] */
		OK, visible, silent,
		/* [2] */
		OK, visible, silent,
		/* [3] */
		OK, visible, silent,
		/* [4] */
		OK, visible, silent
	},
    centerMainScreen       // Where to show the alert
};

resource 'DITL' (rAboutAlert, purgeable) {
	{ /* array DITLarray: 5 elements */
		/* [1] */
		{88, 184, 108, 264},
		Button {
			enabled,
			"OK"
		},
		/* [2] */
		{8, 8, 24, 274},
		StaticText {
			disabled,
			"FocusedEdit"
		},
		/* [3] */
		{32, 8, 48, 237},
		StaticText {
			disabled,
			""
		},
		/* [4] */
		{56, 8, 72, 136},
		StaticText {
			disabled,
			"Brought to you by:"
		},
		/* [5] */
		{80, 24, 112, 167},
		StaticText {
			disabled,
			"Cameron Henlin"
		}
	}
};


/* this ALRT and DITL are used as an error screen */

resource 'ALRT' (rAboutAlert, purgeable) {
	{40, 20, 194, 412},
	rUserAlert,
	{ /* array: 4 elements */
		/* [1] */
		OK, visible, silent,
		/* [2] */
		OK, visible, silent,
		/* [3] */
		OK, visible, silent,
		/* [4] */
		OK, visible, silent
	},
    centerMainScreen       // Where to show the alert
};

resource 'DITL' (rUserAlert, purgeable) {
	{ /* array DITLarray: 5 elements */
		/* [1] */
		{119, 8, 138, 80},
		Button {
			enabled,
			"OK"
		},
		/* [2] */
		{8, 8, 24, 264},
		StaticText {
			disabled,
			"FocusedEdit"
		},
		/* [3] */
		{32, 8, 48, 267},
		StaticText {
			disabled,
			"Copyright © 2022 Cameron Henlin"
		},
		/* [4] */
		{56, 8, 72, 166},
		StaticText {
			disabled,
			"cam.henlin@gmail.com"
		},
		/* [5] */
		{80, 8, 112, 407},
		StaticText {
			disabled,
			"https://github.com/CamHenlin/FocusedEdit"
		}
	}
};

/*
# {64, 60, 314, 460},
*/

resource 'WIND' (rDocWindow, preload, purgeable) {
	{42, 4, 336, 506}, 
	zoomDocProc, invisible, goAway, 0x0, "FocusedEdit",
	centerMainScreen
};


resource 'CNTL' (rVScroll, preload, purgeable) {
	{0, 0, 0, 0},
	0, visible, 0, 0, scrollBarProc, 0, ""
};


resource 'CNTL' (rHScroll, preload, purgeable) {
	{0, 0, 0, 0},
	0, visible, 0, 0, scrollBarProc, 0, ""
};

resource 'STR#' (kErrStrings, purgeable) {
	{
	"You must run on 512Ke or later";
	"Application Memory Size is too small";
	"Not enough memory to run TESample";
	"Not enough memory to do Cut";
	"Cannot do Cut";
	"Cannot do Copy";
	"Cannot exceed 32,000 characters with Paste";
	"Not enough memory to do Paste";
	"Cannot create window";
	"Cannot exceed 32,000 characters";
	"Cannot do Paste"
	}
};

/* here is the quintessential MultiFinder friendliness device, the SIZE resource */

resource 'SIZE' (-1) {
	dontSaveScreen,
	acceptSuspendResumeEvents,
	enableOptionSwitch,
	canBackground,				/* we can background; we don't currently, but our sleep value */
								/* guarantees we don't hog the Mac while we are in the background */
	multiFinderAware,			/* this says we do our own activate/deactivate; don't fake us out */
	backgroundAndForeground,	/* this is definitely not a background-only application! */
	dontGetFrontClicks,			/* change this is if you want "do first click" behavior like the Finder */
	ignoreChildDiedEvents,		/* essentially, I'm not a debugger (sub-launching) */
	not32BitCompatible,			/* this app should not be run in 32-bit address space */
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	reserved,
	kPrefSize * 1024,
	kMinSize * 1024	
};


type 'MOOT' as 'STR ';


resource 'MOOT' (0) {
	"FocusedEdit"
};


resource 'BNDL' (128) {
	'MOOT',
	0,
	{
		'ICN#',
		{
			0, 128
		},
		'FREF',
		{
			0, 128
		}
	}
};


resource 'FREF' (128) {
	'APPL',
	0,
	""
};


resource 'ICN#' (128) {
	{ /* array: 2 elements */
		/* [1] */
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF",
		/* [2] */
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
		$"FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF"
	}
};

