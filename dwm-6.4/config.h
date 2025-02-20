/* See LICENSE file for copyright and license details. */

/* alt-tab configuration */
static const unsigned int tabModKey 		= 0x40;	/* if this key is hold the alt-tab functionality stays acitve. This key must be the same as key that is used to active functin altTabStart `*/
static const unsigned int tabCycleKey 		= 0x17;	/* if this key is hit the alt-tab program moves one position forward in clients stack. This key must be the same as key that is used to active functin altTabStart */
static const unsigned int tabPosY 			= 1;	/* tab position on Y axis, 0 = bottom, 1 = center, 2 = top */
static const unsigned int tabPosX 			= 1;	/* tab position on X axis, 0 = left, 1 = center, 2 = right */
static const unsigned int maxWTab 			= 600;	/* tab menu width */
static const unsigned int maxHTab 			= 200;	/* tab menu height */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
//static const char *fonts[]          = { "FiraCode Nerd Font:style=Regular:size=8:antialias=true:autohint=true","NotoColorEmoji:size=8:antialias=true:autohint=true" };
//static const char dmenufont[]       = { "FiraCode Nerd Font:style=Regular:size=8" };
static const char *fonts[]          = { "Monaco Nerd Font:style=Regular:size=8:antialias=true:autohint=true","NotoColorEmoji:size=8:antialias=true:autohint=true" };
static const char dmenufont[]       = { "Monaco Nerd Font:style=Regular:size=8" };

//Default color scheme
//static const char col_gray1[]       = "#222222";
//static const char col_gray2[]       = "#444444";
//static const char col_gray3[]       = "#bbbbbb";
//static const char col_gray4[]       = "#eeeeee";
//static const char col_cyan[]        = "#005577";

// Gruvbox color scheme
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#504945";
static const char col_gray3[]       = "#bdae93";
static const char col_gray4[]       = "#ebdbb2";
static const char col_cyan[]        = "#cc241d";

// One dark color scheme
//static const char black[]       = "#1e222a";
//static const char white[]       = "#abb2bf";
//static const char gray2[]       = "#2e323a"; // unfocused window border
//static const char gray3[]       = "#545862";
//static const char gray4[]       = "#6d8dad";
//static const char blue[]        = "#61afef";  // focused window border
//static const char green[]       = "#7EC7A2";
//static const char red[]         = "#e06c75";
//static const char orange[]      = "#caaa6a";
//static const char yellow[]      = "#EBCB8B";
//static const char pink[]        = "#c678dd";
//static const char col_borderbar[]  = "#1e222a"; // inner border

// Catppuccin mocha
//static const char rosewater[]        = "#7c7f93";
//static const char flamingo[]    = "#cad3f5";
//static const char pink[]       = "#abe9b3";
//static const char mauve[]         = "#f28fad";
//static const char red[]      = "#f8bd96";
//static const char maroon[]      = "#fae3b0";

// static const char black[]       = "#1E1D2D";
// // default background dark blue
// static const char gray2[]       = "#282737"; // unfocused window border
// static const char gray3[]       = "#585767";
// // dark blue
// static const char gray4[]       = "#282737";
// // bright light blue
// //static const char blue[]        = "#96CDFB";  // focused window border
// // light grey
// static const char blue[]        = "#7c7f93";  // focused window border
// static const char grey[]        = "#7c7f93";
// static const char lavender[]    = "#cad3f5";
// static const char green[]       = "#abe9b3";
// static const char red[]         = "#f28fad";
// static const char orange[]      = "#f8bd96";
// static const char yellow[]      = "#fae3b0";
// static const char pink[]        = "#d5aeea";
// static const char col_borderbar[]  = "#1E1D2D"; // inner border
// static const char white[] = "#f8f8f2";

static const char *colors[][3]      = {
    /*               fg         bg         border   */
    // gruvbox
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    // Default color scheme
    //[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
    // Gruvbox color scheme
    [SchemeSel]  = { col_gray4, col_gray2,  col_gray1  },
    [SchemeHid]  = { col_cyan,  col_gray1, col_cyan  },

    // catppuccin
    // [SchemeNorm]       = { gray3,   black,  gray2 },
    // [SchemeSel]        = { lavender,   black,   blue  },
};

/* tagging */
#define MAX_TAGLEN 16
static char tags[][MAX_TAGLEN] = { "1:web", "2:web", "3:ops", "4:ops", "5:otm", "6:otm", "7:evg", "8:evg", "9:wiki", "10:yandex", "11:chats", "12:misc" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	/*{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },*/
	{ "qutebrowser",  NULL,       NULL,       1,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
        { "[]=",      tile },   /* first entry is default */
	{ "[M]",      monocle },
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
// Gruvbox dmenu
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
// Catppuccin dmenu
// static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", gray4, "-nf", gray3, "-sb", blue, "-sf", gray4, NULL };
//static const char *termcmd[]  = { "/usr/local/bin/kitty", NULL };
static const char *termcmd[]  = { "/usr/local/bin/st", NULL };
static const char *brightness_up[] = { "/usr/local/bin/br", "+25", NULL };
static const char *brightness_down[] = { "/usr/local/bin/br", "-25", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_Up,     spawn,          {.v = brightness_up } },
	{ MODKEY,                       XK_Down,   spawn,          {.v = brightness_down } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstackvis,  {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstackvis,  {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      focusstackhid,  {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      focusstackhid,  {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
        //{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
        //{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
        { MODKEY,                       XK_q,    view,           {0} },
	{ MODKEY,                       XK_Right,       shiftviewclients, { .i = +1 } },
	{ MODKEY,                       XK_Left,        shiftviewclients, { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_s,      show,           {0} },
	{ MODKEY|ShiftMask,             XK_s,      showall,        {0} },
	{ MODKEY,                       XK_h,      hide,           {0} },
        { MODKEY,                       XK_n,      nametag,        {0} },
        { Mod1Mask,                     XK_Tab,    altTabStart,    {0} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
        TAGKEYS(                        XK_F10,                      9)
        TAGKEYS(                        XK_F11,                      10)
        TAGKEYS(                        XK_F12,                      11)
	{ MODKEY|ShiftMask,             XK_q,      quitprompt,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

