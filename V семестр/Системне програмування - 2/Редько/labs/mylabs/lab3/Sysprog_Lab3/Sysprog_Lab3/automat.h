enum autStat
{
	S0,	// S0 - ���������� ����
	S1,	// S1 - ������ ����
	S2,	// S2 - ������ ����
	S3,
	S4,
	S5,
	S6,
	S7,
	S8,
	Se		// Se - ������� ����
};

enum autSgn
{
	sg0,	// sg0 - �������� ������
	dlm,	// dlm - ������ ������
	rtl,	// rtl - ������ ������
	sgE	// sgE - ������� ������
};

enum autStat nxtStat(enum autSgn sgn);
