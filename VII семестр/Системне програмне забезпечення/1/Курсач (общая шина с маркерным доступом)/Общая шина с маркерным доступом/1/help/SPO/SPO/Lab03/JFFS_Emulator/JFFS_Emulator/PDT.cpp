#include "PDT.h"

void PageDescr::serialize(FILE *dst)
{
//запись в файл размера страницы, кол-ва страниц в фс, версии даной страницы, количества записей на ней
	fprintf(dst, "%u", &(this->pageSize)); 
	fprintf(dst, "%u", &(this->pageAmount));
	fprintf(dst, "%u", &(this->version));
	fprintf(dst, "%u", &(this->records));
	int wr = this->pageSize;//счетчик оставшегося места на странице
	char t = 0;
	while (rchain != NULL)//идем по списку команд, которые есть на странице
	{
		Command* curr = rchain;//записываем для каждой команды ид, коп, данные команды
		fprintf(dst, "%u", &(curr->id));
		fprintf(dst, "%u", &(curr->code));
		fprintf(dst, "%c", &(curr->data[0]));
		for(int i = 1; i < (curr->data[0]); i++)
			fprintf(dst, "%c", &(curr->data[i]));
		wr -= (8 + curr->data[0]);//отнимаем от счетчика оставшегося места обьем записи о команде
		rchain = curr->next;
		delete curr;//убиваем записанную команду
	}
	for (int i = 0; i < wr; i++)
		fprintf(dst, "%c", &t);//глушим остаток места на странице нулями
}

void PageDescr::deserialize(FILE *dst)
{//читаем размер страницы, их кол-во, версию, кол-во записей
	fscanf(dst, "%u", &(this->pageSize));
	fscanf(dst, "%u", &(this->pageAmount));
	fscanf(dst, "%u", &(this->version));
	fscanf(dst, "%u", &(this->records));
	this->rchain = NULL;
	unsigned int wr = this->pageSize;
	for (unsigned int i = 0; i < this->records; i++)
	{//newer commands written first
		Command* nc = new Command();
		char t;//воссоздаем список записей команд
		fscanf(dst, "%u", &(nc->id));
		fscanf(dst, "%u", &(nc->code));
		fscanf(dst, "%c", &t);
		nc->data = new char[t];
		for (char a = 1; a < t; a++)
			fscanf(dst, "%c", &(nc->data[a]));
		nc->data[0] = t;//читая ИД, коп, данные команды
		nc->next = this->rchain;//добавляем в цепочку команд страницы
		this->rchain = nc;
		wr -= (t + 8);
	}
	fseek(dst, wr, SEEK_CUR);
}