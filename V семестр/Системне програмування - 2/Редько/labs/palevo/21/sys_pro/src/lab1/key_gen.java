package lab1;


class key_gen extends Gen {
	int key;

	key_gen (int key, Integer a, Long b, Float c) {
		super(a, b, c);
		this.key=key;
	}
	int get_key (){
		return key;	
	}
	void set_key (int key){
		this.key=key;
	}

	void print_key (){
		System.out.print("key = "+ key +" int = "+ int_ob + " long = " + long_ob +
				" float = " + float_ob + '\n');
	}
}
