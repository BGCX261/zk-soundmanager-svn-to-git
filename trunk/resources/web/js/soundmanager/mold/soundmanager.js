function (out) {
	var zcls = this.getZclass(),
		uuid = this.uuid;
	//TODO : add mold to change 360ui ,example: 360-YUI
	out.push('<div ',this.domAttrs_(),'><a ',this._anchorAttrs(),'></a></div>');
	
}