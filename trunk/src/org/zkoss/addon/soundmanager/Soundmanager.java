/* Soundmanager.java

	Purpose:
		
	Description:
		
	History:
		Sat Jun 30 08:02:28     2011, Created by matthew

Copyright (C) 2011 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under LGPL Version 3.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.addon.soundmanager;

import org.zkoss.lang.Objects;
import org.zkoss.zk.au.out.AuInvoke;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zul.impl.Utils;
import org.zkoss.zul.impl.XulElement;

/**
* A component which plays music.
* 
* <p>Soundmanager has a build-in 360ui.
* 
* <p>See also <a href="http://www.schillmania.com/projects/soundmanager2/demo/360-player/">soundmanager2-360ui</a>
* 
*  @author matthew
*/	
public class Soundmanager extends XulElement  {

	private static final long serialVersionUID = 1L;
	/* Here's a simple example for how to implements a member field */
	private byte _audver;
	protected String _src;
	/** The soundmanager. _src and _soundmanager cannot be nonnull at the same time. */
	private org.zkoss.sound.Audio _soundmanager;
	private boolean _loop;
	
	public Soundmanager(){
	}
	public Soundmanager (String src){
		setSrc(src);
	}
	
	/** return the src.
	 */
	public String getSrc() {
		return _src;
	}
	/** Returns whether to play the audio repeatedly.
	 *
	 * <p>Default: false;
	 */
	public boolean isLoop() {
		return _loop;
	}
	/** Sets whether to play the soundmanager repeatedly.
	 */
	public void setLoop(boolean loop) {
		if (_loop != loop) {
			_loop = loop;
			smartUpdate("loop", _loop);
		}
	}
	/** Plays the soundmanager at the client.
	 */
	public void play() {
		response("ctrl", new AuInvoke(this, "play"));
	}
	/** Stops the soundmanager at the cient.
	 */
	public void stop() {
		response("ctrl", new AuInvoke(this, "stop"));
	}
	/** Pauses the soundmanager at the cient.
	 */
	public void pause() {
		response("ctrl", new AuInvoke(this, "pause"));
	}
	//super//
	protected void renderProperties(org.zkoss.zk.ui.sys.ContentRenderer renderer)
	throws java.io.IOException {
		super.renderProperties(renderer);
		render(renderer, "src", getEncodedSrc());
		render(renderer, "loop", _loop);	
	}
	/** Sets the src.
	 *
	 */
	public void setSrc(String src) {
		if (src != null && src.length() == 0)
			src = null;

		if (_soundmanager != null || !Objects.equals(_src, src)) {
			_src = src;
			_soundmanager = null;
			smartUpdate("src", new EncodedSrc());
		}
	}
	
	private class EncodedSrc implements org.zkoss.zk.ui.util.DeferredValue {
		public Object getValue() {
			return getEncodedSrc();
		}
	}
	
	private String getEncodedSrc() {
		final Desktop dt = getDesktop();
		return _soundmanager != null ? getAudioSrc(): //already encoded
			dt != null ? dt.getExecution().encodeURL(
					_src != null ? _src: "~./aud/mute.mid"):
					//mute.mid is required. otherwise, quicktime failed to identify audio
				"";
	}
	
	private String getAudioSrc() {
		return Utils.getDynamicMediaURI(
			this, _audver, _soundmanager.getName(), _soundmanager.getFormat());
	}
	/** Not childable. */
	protected boolean isChildable() {
		return false;
	}
	//super
	public String getZclass() {
		return (this._zclass != null ? this._zclass : "z-soundmanager");
	}
}

