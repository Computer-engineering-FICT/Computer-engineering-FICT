enum autStat
{
	S0,	// S0 - Початковий стан
	S1,	// S1 - Перший стан
	S2,	// S2 - Другий стан
	S3,
	S4,
	S5,
	S6,
	S7,
	S8,
	Se		// Se - Останній стан
};

enum autSgn
{
	sg0,	// sg0 - Нульовий сигнал
	dlm,	// dlm - Перший сигнал
	rtl,	// rtl - Другий сигнал
	sgE	// sgE - Останній сигнал
};

enum autStat nxtStat(enum autSgn sgn);
