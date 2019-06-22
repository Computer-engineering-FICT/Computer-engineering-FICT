
// ������� ������� ������
struct keyString
{
	char *str;
	unsigned long nMod;
};

// ������������� ������� ������
struct functionString
{
	struct
	{
		int i;
	} _f ;
};

// ��������� ����� �������
struct record
{
	// �������� ��������� �����
	struct keyString key;
	// �������� ������������� �������
	struct functionString func;
	// ������ ��������� 
	char _del;
};

//------------------------------------------------------------------------------
// ������� ������ ������� �� ������ �������
// ������ �� ������ �������
struct record *selectNumber(struct record *, unsigned char);	

// ��������� �� ������ �������
struct record *insertNumber(struct record *, struct record *, unsigned char, int *);

// ��������� �� ������ �������
struct record *deleteNumber(struct record *, unsigned char);

// �������� �� ������ �������
struct record *updateNumber(struct record *, struct record *, unsigned char, int *);

//------------------------------------------------------------------------------
// ��������� �� ���������� ��������
 int neqKey(struct record *, struct keyString);

// ��������� �����
 int cmpStr(unsigned char *, unsigned char *);

// ��������� �� ���������� �������
 int cmpKey(struct record *, struct keyString);

// ��������� �� ���������� �������
 int cmpKys(struct keyString *, struct keyString*);

// ��������� �� ���������� �������
 int simKey(struct record *, struct keyString);

//------------------------------------------------------
// ������ �� ������ �������
struct record *selectLinear(struct keyString, struct record *, int);

// ��������� �� ������ �������
struct record *insertLinear(struct record *, struct record *, int *);

// ��������� �� ������ �������
struct record *deleteLinear(struct record *, struct record *, int *);

// �������� �� ������ �������
struct record *updateLinear(struct keyString, struct record *, struct record *, int *);

// ��������� ��� ������� ������
struct record *packLinear(struct record *, int *);

//------------------------------------------------------
// ���������� �� �������� �������
struct record *sortBinary(struct record *, int);

// ������ �� �������� �������
struct record *selectBinary(struct keyString, struct record *, int);

// ��������� �� �������� �������
struct record *insertBinary(struct record *, struct record *, int *);

// ��������� �� �������� �������
struct record *deleteBinary(struct record *, struct record *, int *);

// �������� �� �������� �������
struct record *updateBinary(struct keyString, struct record *, struct record *, int *);