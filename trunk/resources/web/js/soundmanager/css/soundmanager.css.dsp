<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.z-soundmanager{
     color:black;
}

.ui360, /* entire UI */
.sm2-360ui { /* canvas container */
 position:relative;
}

.ui360,
.sm2-360ui {
 min-width:50px; /* should always be at least this. */
 min-height:50px;
}

.sm2-360ui {
 width:50px;
 height:50px;
}

.ui360,
.ui360 * {
 vertical-align:middle;
}

.sm2-360ui {
 position:relative;
 display:inline-block; /* firefox 3 et al */
 float:left; /* IE 6+7, firefox 2 needs this, inline-block would work with fx3 and others */
 *display:inline;
/*
 clear:left;
*/
}

.sm2-360ui.sm2_playing,
.sm2-360ui.sm2_paused {
 /* bump on top when active */
 z-index:10;
}

.ui360 a { /* .sm2_link class added to playable links by SM2 */
 float:left;
 display:inline;
 position:relative;
 color:#000;
 text-decoration:none;
 left:3px; /* slight spacing on left UI */
 top:18px; /* vertical align */
 text-indent:50px; /* make room for UI at left */
}

.ui360 a.sm2_link { /* SM2 has now started */
 text-indent:0px; /* UI now in place. */
}

.ui360 a,
.ui360 a:hover,
.ui360 a:focus {
 padding:2px;
 margin-left:-2px;
 margin-top:-2px;
}

.ui360 a:hover,
.ui360 a:focus {
 background:#eee;
 -moz-border-radius:3px;
 -webkit-border-radius:3px;
 -khtml-border-radius:3px;
 border-radius:3px;
 outline:none;
}

.ui360 .sm2-canvas {
 position:absolute;
 left:0px;
 top:0px;
}

.ui360 .sm2-timing {
 position:absolute;
 display:block;
 left:0px;
 top:0px;
 width:100%;
 height:100%;
 margin:0px;
 font:11px "helvetica neue",helvetica,monaco,lucida,terminal,monospace;
 color:#666;
 text-align:center;
 line-height:50px;
}

.ui360 .sm2-timing.alignTweak {
 text-indent:1px; /* devious center-alignment tweak for Safari (might break things for others.) */
}

.ui360 .sm2-cover {
 position:absolute;
 left:0px;
 top:0px;
 width:100%;
 height:100%;
 z-index:2;
 display:none;
}

.ui360 .sm2-360btn {
 position:absolute;
 display:block;
 top:50%;
 left:50%;
 width:22px;
 height:22px;
 margin-left:-11px;
 margin-top:-11px;
 cursor:pointer;
 z-index:3;
}

.ui360 .sm2-360data {
 display:inline-block;
 font-family:helvetica;
}

.ui360 .sm2-360ui.sm2_playing .sm2-cover,
.ui360 .sm2-360ui.sm2_paused .sm2-cover {
 display:block;
}

/* this could be optimized a fair bit. */

.ui360 {
 /*
  "fake" button shown before SM2 has started, non-JS/non-SM2 case etc.
  background image will be removed via JS, in threeSixyPlayer.init()
 */
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play.png')}) no-repeat 14px 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play.gif')}) no-repeat 14px 50%; /* IE 6-only: special crap GIF */
}

.ui360 .sm2-360btn-default,
.ui360 .sm2-360ui.sm2_paused .sm2-360btn {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play.gif')}) no-repeat 50% 50%; /* IE 6-only: special crap GIF */
}

.ui360 .sm2-360btn-default,
.ui360 .sm2-360ui.sm2_paused .sm2-360btn {
 cursor:pointer;
}

.ui360 .sm2-360btn-default:hover,
.ui360 .sm2-360ui.sm2_paused .sm2-360btn:hover {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play-light.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-play.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360 .sm2-360ui.sm2_playing .sm2-360btn:hover,
.ui360 .sm2-360btn-playing:hover {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-pause-light.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-pause-light.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360 .sm2-360ui.sm2_playing .sm2-timing {
 visibility:visible;
}

.ui360 .sm2-360ui.sm2_buffering .sm2-timing {
 visibility:hidden;
}

.ui360 .sm2-360ui .sm2-timing,
.ui360 .sm2-360ui .sm2-360btn:hover + .sm2-timing,
.ui360 .sm2-360ui.sm2_paused .sm2-timing {
 visibility:hidden;
}

.ui360 .sm2-360ui.sm2_dragging .sm2-timing,
.ui360 .sm2-360ui.sm2_dragging .sm2-360btn:hover + .sm2-timing {
 /* paused + dragging */
 visibility:visible;
}

.ui360 .sm2-360ui.sm2_playing .sm2-360btn,
.ui360 .sm2-360ui.sm2_dragging .sm2-360btn,
.ui360 .sm2-360ui.sm2_dragging .sm2-360btn:hover,
.ui360 .sm2-360ui.sm2_dragging .sm2-360btn-playing:hover {
 /* don't let pause button show on hover when dragging (or paused and dragging) */
 background:transparent;
 cursor:auto;
}

.ui360 .sm2-360ui.sm2_buffering .sm2-360btn,
.ui360 .sm2-360ui.sm2_buffering .sm2-360btn:hover {
  background:transparent url(${c:encodeURL('~./soundmanager/img/icon_loading_spinner.gif')}) no-repeat 50% 50%;
  opacity:0.5;
  visibility:visible;
}

/* inline list style */

.sm2-inline-list .ui360,
.sm2-inline-block .ui360 {
 position:relative;
 display:inline-block;
 float:left;
 _display:inline;
 margin-bottom:-15px;
}

.sm2-inline-list .ui360 {
 /* inline player: minor tweak, tighten spacing */
 margin-right:-2px;
}

.sm2-inline-block .ui360 {
 margin-right:8px;
}

.sm2-inline-list .ui360 a {
 display:none;
}

/* annotations */

ul.ui360playlist {
 list-style-type:none;
}

ul.ui360playlist,
ul.ui360playlist li {
 margin:0px;
 padding:0px;
}

div.ui360 div.metadata {
 display:none;
}

div.ui360 a span.metadata,
div.ui360 a span.metadata * {
 /* name of track, note etc. */
 vertical-align:baseline;
}


/* larger canvas, spectrum + EQ visualization and other items */

.ui360-vis,
.ui360-vis .sm2-360ui,
.sm2-inline-list .ui360-vis {
 /* size of the container for the circle, etc. */
 width:256px;
 height:256px;
}

.ui360-vis {
 position:relative;
 /* a little extra spacing */
 padding-top:1px;
 padding-bottom:1px;
 margin-bottom:-18px; /* approximate "line height" we want */
 padding-left:248px;
 margin-left:0px;
 background-position:22.6% 50%; /* (~109px) initial play button position */
}

.sm2-inline-list .ui360-vis {
 cursor:pointer
}

.ui360-vis a {
 font:14px "helvetica neue",helvetica,monaco,lucida,terminal,monospace;
 white-space:nowrap;
 text-indent:0px; /* undo inline style */
 top:46%; /* ehh. */
}

.sm2-inline-list .ui360-vis a {
 line-height:256px;
 top:auto;
}

.ui360-vis .sm2-360ui {
 margin-left:-256px;
}

.ui360-vis .sm2-timing {
 line-height:256px;
}

.ui360-vis .sm2-timing {
 font:bold 24px "helvetica neue",helvetica,monaco,lucida,terminal,monospace;
 color:#333;
 text-align:center;
 line-height:256px;
 text-indent:0px;
}

.sm2-inline-list .ui360-vis,
.sm2-inline-list .ui360-vis .sm2-360ui {
 margin-left:0px;
}

.sm2-inline-list .ui360-vis {
 margin:8px 13px 7px 0px;
 padding-left:0px;
 background-position:50% 50%; /* initial play button position */
}

.sm2-inline-list .ui360-vis .sm2-360ui {
 border:1px solid #eee;
 /* offset the border */
 margin-left:-1px;
 margin-top:-1px;
}

.sm2-inline-list .ui360-vis a {
 position:absolute;
 display:inline;
 left:0px;
 bottom:0px;
 top:1px;
 width:100%; /* 2px padding in box */
 height:99%; /* dumb vertical hack */
 *height:256px; /* IE is dumb. */
 overflow:hidden;
 font-size:small;
 font-weight:300;
 color:#333;
 margin:0px;
 padding:0px;
 line-height:488px; /* bottom vertical alignment for text */
 *line-height:480px; /* IE again */
 text-align:center;
 -moz-border-radius:0px;
 -khtml-border-radius:0px;
 border-radius:0px;
}

.sm2-inline-list .ui360 a:hover {
 background-color:transparent; /* reset */
}

.sm2-inline-list .ui360-vis:hover .sm2-360ui,
.sm2-inline-list .ui360-vis a.sm2_link:hover,
.sm2-inline-list .ui360-vis a.sm2_link:active,
.sm2-inline-list .ui360-vis a.sm2_link:focus {
 background-color:transparent;
}

.sm2-inline-list .ui360-vis:hover a.sm2_link {
 background-color:#fafafa;
 *background-color:transparent; /* eh, screw IE. */
}

/* Use a bigger loading image for this layout */

.ui360-vis .sm2-360btn {
 width:48px;
 height:48px;
 margin-left:-24px;
 margin-top:-24px;
}

.ui360-vis:hover .sm2-360btn {
 /* show "play" anywhere on UI when hovering */${c:encodeURL('~./soundmanager/img/360-button-vis-pause-light.gif')}
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play-light.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360-vis .sm2-360ui.sm2_paused .sm2-360btn {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360-vis .sm2-360btn-default:hover,
.ui360-vis .sm2-360ui.sm2_paused .sm2-360btn:hover {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play-light.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360-vis .sm2-360ui.sm2_playing .sm2-360btn:hover,
.ui360-vis .sm2-360btn-playing:hover {
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play-light.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-pause-light.gif')}) no-repeat 50% 50%;
 cursor:pointer;
}

.ui360-vis {
 /* non-JS / before-loaded state */
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.png')}) no-repeat 21% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.gif')}) no-repeat 21% 50%; /* IE 6-only: special crap GIF */
}

.ui360-vis .sm2-360btn-default {
 /* real button, post-loaded state */
 background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.png')}) no-repeat 50% 50%;
 _background:transparent url(${c:encodeURL('~./soundmanager/img/360-button-vis-play.gif')}) no-repeat 50% 50%; /* IE 6-only: special crap GIF */
}

.ui360-vis .sm2-360ui.sm2_dragging .sm2-360btn {
 visibility: hidden;
}

#sm2-container {
 /*
  where the SM2 flash movie goes. by default, relative container.
  set relative or absolute here, and don't touch it later or bad things will happen (see below comments.)
 */
 position:relative;
 width:1px;
 height:1px;
 _overflow:hidden; /* screw IE 6, just make it display nice */
}

#sm2-container object,
#sm2-container embed {
 /*
  the actual movie bit.
  SWF needs to be able to be moved off-screen without display: or position: changes. important.
  changing display: or position: or overflow: here or on parent can cause SFW reload or other weird issues after unblock,
  eg. SM2 starts but strange errors, no whileplaying() etc.
 */
 position:absolute;
}

#sm2-container object,
#sm2-container embed,
#sm2-container.swf_timedout,
#sm2-container.swf_timedout object,
#sm2-container.swf_timedout embed {
 /* 
  when SM2 didn't start normally, time-out case. flash blocked, missing SWF, no flash?
  48px square flash placeholder is typically used by blockers.
 */
 left:auto;
 top:auto;
 width:48px;
 height:48px;
}

#sm2-container.swf_unblocked {
 /* SWF unblocked, or was never blocked to begin with; try to collapse container as much as possible. */
 width:1px;
 height:1px;
}

#sm2-container.swf_loaded object,
#sm2-container.swf_loaded embed,
#sm2-container.swf_unblocked object,
#sm2-container.swf_unblocked embed {
 /* hide flash off-screen (relative to container) when it has loaded OK */
 left:-9999em;
 top:-9999em;
}

#sm2-container.swf_error {
 /* when there is a fatal error (flash loaded, but SM2 failed) */
 display:none;
}

#sm2-container.high_performance {
 /* "high performance" case: keep on-screen at all times */
 position:absolute;
 position:fixed;
 overflow:hidden;
 _top:-9999px; /* IE 6 hax, no position:fixed */
 _left:-9999px;
 bottom:0px;
 left:0px;
 /*
  special case: show at first with w/h, hide when unblocked.
  might be bad/annoying.
 */
 width:48px;
 height:48px;
 z-index:99; /* try to stay on top */
}

#sm2-container.high_performance.swf_loaded,
#sm2-container.high_performance.swf_unblocked {
 z-index:auto;
}


#sm2-container.high_performance.swf_loaded,
#sm2-container.high_performance.swf_unblocked,
#sm2-container.high_performance.swf_unblocked object,
#sm2-container.high_performance.swf_unblocked embed {
 /* 8x8px is required minimum to load in fx/win32 in some cases(?), 6x6+ good for fast performance, even better when on-screen via position:fixed */
 width:8px;
 height:8px;
}

#sm2-container.high_performance.swf_loaded {
 /* stay bottom/left */
 top:auto;
 bottom:0px;
 left:0px;
}

#sm2-container.high_performance.swf_loaded object,
#sm2-container.high_performance.swf_loaded embed,
#sm2-container.high_performance.swf_unblocked object,
#sm2-container.high_performance.swf_unblocked embed {
 /* high-performance case must stay on-screen */
 left:auto;
 top:auto;
}

#sm2-container.high_performance.swf_timedout {
 z-index:99; /* try to stay on top */
}