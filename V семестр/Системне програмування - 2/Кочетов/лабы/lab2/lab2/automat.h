enum autStat
{
	S0,
	S1,
	S2,
	S3,
	S4,
	S5,
	Se
};

enum autSgn
{
	dlm,	// dlm - Перший сигнал
	ltr	// ltr - Другий сигнал
};

enum autStat nxtStat(enum autSgn sgn);
