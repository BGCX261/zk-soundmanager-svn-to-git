(function() {

	function loadScript(sURL, onLoad) {

		function loadScriptHandler() {
			var rs = this.readyState;
			if (rs == 'loaded' || rs == 'complete') {
				this.onreadystatechange = null;
				this.onload = null;
				if (onLoad) {
					onLoad();
				}
			}
		}

		function scriptOnload() {
			this.onreadystatechange = null;
			this.onload = null;
			window.setTimeout(onLoad, 20);
		}

		var oS = document.createElement('script');
		oS.type = 'text/javascript';
		if (onLoad) {
			oS.onreadystatechange = loadScriptHandler;
			oS.onload = scriptOnload;
		}
		oS.src = sURL;
		document.getElementsByTagName('head')[0].appendChild(oS);
	}
	zk.loadScript('zkau/web/js/soundmanager/ext/animator-jsmin.js');
	window.onload = function() {
		setTimeout(function() {
			loadScript('zkau/web/js/soundmanager/ext/soundmanager2-jsmin.js', function() {
				window.soundManager.useFastPolling = true;
				window.soundManager.url = 'zkau/web/js/soundmanager/swf/';
				loadScript('zkau/web/js/soundmanager/ext/360player-jsmin.js', function() {
					window.threeSixtyPlayer.config.useWaveformData = true;
					window.threeSixtyPlayer.config.useEQData = true;
				});
				window.soundManager.onready(function() {
					window.threeSixtyPlayer.init();
				});
				window.soundManager.ontimeout(function() {
					alert('SM2 cannot loaded, enable HTML5 or falsh PLZ');
				});
			});
		}, 0);
	};

})();