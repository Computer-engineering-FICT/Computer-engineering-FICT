var LFSR = function(polynom, initstate) {
	if(!polynom.length || polynom.length != (initstate.length + 1))
		return false;

	this.polynom = polynom.slice(0, polynom.length - 1);
	this.state = initstate;
};

LFSR.prototype.next = function() {
	var l = this.polynom.length, first = this.state[0];
	
	for(var i = 1; i < l; ++i)
		this.state[i - 1] = (this.polynom[i] ? first : 0) ^ this.state[i];
	this.state[l - 1] = first;
	
	return first;
};