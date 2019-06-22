var TESTS = {
	freq: function(seq) {
		var count = 0;
		
		for(i in seq)
			if(seq[i])
				count++;
		
		return count / seq.length;
	},
	diff: function(seq) {
		var count = 0, overall = seq.length - 1;
		
		for(var i = 0; i < overall; i++)
			if(seq[i] != seq[i + 1])
				count++;
		
		return count / overall;
	},
	rank: function(seq, len) {
		var table = {}, l = seq.length - len;
		
		for(var i = 0, key; i < l; i++)
		{
			key = seq.slice(i, i + len).join('');
			
			if(key in table)
				table[key]++;
			else
				table[key] = 1;
		}
		
		return table;
	},
	comp: function(seq) {
		var C = [1], B = [1], T, d, x = 1, L = 0, N = 0, n = seq.length;
		
		var updateC = function() {
			var A = [], lC = C.length - 1, lB = B.length - 1;
			
			for(var i = 0, l = Math.max(lC, lB + x) + 1; i < l; i++)
			{
				A[i] = (C[lC - i]  || 0) ^ (B[lB - i + x] || 0);
			}
			
			C = A.reverse();		
		};
		
		do
		{
			for(var j = 0, sum = 0, lC = C.length - 1; j < L; j++)
				sum += C[lC - j] * seq[N - j];			
			
			d = (seq[N] + sum) % 2;
			
			if(d)
			{
				x++;
			}
			else
			{
				if((2 * L) > N)
				{
					updateC();
					x++;
				}
				else
				{
					L = N + 1 - L;
					T = C.slice(0);
					updateC();
					B = T;
					x = 1;
				}
			}
			
			N++;
		}
		while(N < n);
		
		return {'L': L, 'polynom': C};	
	}
};