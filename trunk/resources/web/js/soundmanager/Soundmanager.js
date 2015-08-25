/* Soundmanager.js

	Purpose:
		
	Description:
		
	History:
		Sat Jun 30 08:02:28     2011, Created by matthew

Copyright (C) 2011 Potix Corporation. All Rights Reserved.

This program is distributed under LGPL Version 3.0 in the hope that
it will be useful, but WITHOUT ANY WARRANTY.
*/

(function () {
	
	function syncADom(wgt){
		var n = wgt.$n().lastChild;
		if (n.href == wgt._src)
			return;
		if (n.loop == wgt._loop)
			return;
		wgt.rerender();
		wgt.stop();
		window.soundManager.destroySound(wgt.uuid);
		wgt._currentSound = null;
		wgt._isplaying = false;
		window.threeSixtyPlayer.init(wgt.uuid);
	}
/**
* A component which plays music.
* 
* <p>Soundmanager has a build-in 360ui.
* 
* <p>See also <a href="http://www.schillmania.com/projects/soundmanager2/demo/360-player/">soundmanager2-360ui</a> 
*/	
soundmanager.Soundmanager = zk.$extends(zk.Widget, {
	$define: {
		/** Returns the src.
		 * <p>Default: null.
		 * @return String
		 */
		/** Sets the src.
		 * @param String src
		 */
		//todo: Load without setting src
		src: _zkf = function () {
			if(this.desktop) {
				syncADom(this);
			}
		},
		/** Returns whether to play the soundmanager repeatedly.
		 * <p>Default: false;
		 * @return boolean
		 */
		/** Sets whether to play the soundmanager repeatedly.
		 * @param boolean loop
		 */
		loop: _zkf
	},
	/** Plays the soundmanager at the client.
	 */
	play: function () {
		if(this._isplaying)
			return;
		if(!this._currentSound){
			var sm ;
			sm = window.soundManager.createSound(this.uuid, this._src);
			this._currentSound = sm;
		}
		this._currentSound.play({loops: (this._loop? 1000000 : 0 )});
		this._isplaying = true;
	},
	/** Stops the soundmanager at the client.
	 */
	stop: function () {
		if(this._currentSound){
			this._currentSound.stop();
			this._isplaying = false;
		}
	},
	/** Pauses the soundmanager at the cient.
	 */
	pause: function () {
		if(this._currentSound){
			this._currentSound.pause();
			this._isplaying = false;
		}
	},

	unbind_: function () {
		this.stop();
		window.soundManager.destroySound(this.uuid);
		this._isplaying = false;
		this.$supers(soundmanager.Soundmanager, 'unbind_', arguments);
	},
	
	domAttrs_: function(no){
		var attr = this.$supers('domAttrs_', arguments);
		var idx = attr.indexOf('class');
		attr = attr.substring(0, idx + 7) + 'ui360 ' + attr.substring(idx + 7);
		return attr;
	},
	
	_anchorAttrs: function(no){
		var attr = 'href="' + (this._src || '') + '"',
			v;
		if (v = this._loop) 
			attr += ' loop="' + v + '"';
		return attr;
	},
	//super//
	getZclass: function () {
		return this._zclass != null ? this._zclass : "z-soundmanager";
	}
});
})();
