enum autStat
{S0,	// S0 - Початковий стан
 S1,	// S1 - Перший стан
 S2,	// S2 - Другий стан
 Se		// Se - Останній стан
};
enum autSgn
{sg0,	// sg0 - Нульовий сигнал
 sg1,	// sg1 - Перший сигнал
 sg2,	// sg2 - Другий сигнал
 sg3,	// sg3 - Третій сигнал
 sgE	// sgE - Останній сигнал
};
enum autStat nxtStat(enum autSgn sgn);
