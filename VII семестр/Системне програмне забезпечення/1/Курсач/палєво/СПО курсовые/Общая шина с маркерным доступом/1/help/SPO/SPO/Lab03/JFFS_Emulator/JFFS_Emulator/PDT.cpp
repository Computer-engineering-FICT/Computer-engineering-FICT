#include "PDT.h"

void PageDescr::serialize(FILE *dst)
{
//������ � ���� ������� ��������, ���-�� ������� � ��, ������ ����� ��������, ���������� ������� �� ���
	fprintf(dst, "%u", &(this->pageSize)); 
	fprintf(dst, "%u", &(this->pageAmount));
	fprintf(dst, "%u", &(this->version));
	fprintf(dst, "%u", &(this->records));
	int wr = this->pageSize;//������� ����������� ����� �� ��������
	char t = 0;
	while (rchain != NULL)//���� �� ������ ������, ������� ���� �� ��������
	{
		Command* curr = rchain;//���������� ��� ������ ������� ��, ���, ������ �������
		fprintf(dst, "%u", &(curr->id));
		fprintf(dst, "%u", &(curr->code));
		fprintf(dst, "%c", &(curr->data[0]));
		for(int i = 1; i < (curr->data[0]); i++)
			fprintf(dst, "%c", &(curr->data[i]));
		wr -= (8 + curr->data[0]);//�������� �� �������� ����������� ����� ����� ������ � �������
		rchain = curr->next;
		delete curr;//������� ���������� �������
	}
	for (int i = 0; i < wr; i++)
		fprintf(dst, "%c", &t);//������ ������� ����� �� �������� ������
}

void PageDescr::deserialize(FILE *dst)
{//������ ������ ��������, �� ���-��, ������, ���-�� �������
	fscanf(dst, "%u", &(this->pageSize));
	fscanf(dst, "%u", &(this->pageAmount));
	fscanf(dst, "%u", &(this->version));
	fscanf(dst, "%u", &(this->records));
	this->rchain = NULL;
	unsigned int wr = this->pageSize;
	for (unsigned int i = 0; i < this->records; i++)
	{//newer commands written first
		Command* nc = new Command();
		char t;//���������� ������ ������� ������
		fscanf(dst, "%u", &(nc->id));
		fscanf(dst, "%u", &(nc->code));
		fscanf(dst, "%c", &t);
		nc->data = new char[t];
		for (char a = 1; a < t; a++)
			fscanf(dst, "%c", &(nc->data[a]));
		nc->data[0] = t;//����� ��, ���, ������ �������
		nc->next = this->rchain;//��������� � ������� ������ ��������
		this->rchain = nc;
		wr -= (t + 8);
	}
	fseek(dst, wr, SEEK_CUR);
}