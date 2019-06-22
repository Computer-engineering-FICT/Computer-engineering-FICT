var T = function(polynoms, initstates, NC, NS) {	
	for(var i = 0, n = Math.pow(2, NC); i < n; i++)
		this.table.push(Math.random() > 0.5 ? 1 : 0);
	
	for(var i = 0; i < NC; ++i)
		this.registers.push(new LFSR(polynoms[NS + i], initstates[NS + i]));
};

T.prototype.table = [];
T.prototype.registers = [];
T.prototype.next = function() {
	var tablenum = 0;
	
	for(var i = 0, l = this.registers.length; i < l; i++)
		tablenum += this.registers[i].next() ? Math.pow(2, i) : 0;
		
	return this.table[tablenum];
};


	
