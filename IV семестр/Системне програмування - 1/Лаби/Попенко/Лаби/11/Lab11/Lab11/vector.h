extern "C" {
	void vectorSSE(float *dest, float *A, float *B, int num);
	void vectorFPU(float *dest, float *A, float *B, int num);
}