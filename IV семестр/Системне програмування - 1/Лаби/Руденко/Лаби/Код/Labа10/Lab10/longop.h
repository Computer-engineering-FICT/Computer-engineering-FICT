extern "C"
{
	void Add_LONGOP(long bits, long *dest, long *pB, long *pA);
	void Sub_LONGOP(long bits, long *dest, long *pB, long *pA);
	void Mul_NxN_LONGOP(long *dest, long *p2, long *p1);
}