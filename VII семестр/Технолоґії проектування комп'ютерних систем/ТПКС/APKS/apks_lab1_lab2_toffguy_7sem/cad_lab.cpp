//(c) Aleksey Tulinoff, 2002
//downloaded from www.i.com.ua/~toffguy

/*

следует помнить, что бќльша€ часть сего творени€ писалась глубокой ночью 
и € слабо понимал что € делаю :-) поэтому все претензии на оптимальность
или аккуратность кода можете сразу отправл€ть в ближайший девнул или куда
там вам есть отправить ;-)

€ понимаю, что то, что этот код делает - избыточно, неоптимально и, что 
слово SHEME пишетс€ не так ;-) но € эту лабу уже сдал и переделывать не 
собираюсь :-)

зы. data - пример файла-задани€


toffguy

*/

#include <stdio.h>
#include <math.h>
#include <string.h>
#include "cad_lab.h"

char
	jumps[MAX_NODES][MAX_NODES];
char
	nodes[MAX_NODES] = {NODE_BEGIN, NODE_OP, NODE_JUMP, NODE_OP, NODE_END},
	setsign[MAX_NODES][MAX_SIGNALS],
	jmpsign[MAX_NODES];
int
	NODES_CNT	= 0,
	SIGN_CNT	= 0,
	TRIG_CNT	= 0;
bool
	TERM_CHECK = false,
	NODE_CHECK = false,
	PATH_CHECK = false;
int
	SHEME_TYPE = SHEME_MURA,
	TRIG_TYPE = TRIG_D,

	STATE_LEN = 0,
	STATE_CNT = 0,
	STATE_TOT = 0;
char
	state_jumps[MAX_NODES][MAX_NODES],
	state_nodes[MAX_NODES][10],
	state_cond[MAX_NODES][MAX_NODES][MAX_SIGNALS],
	state_sign[MAX_NODES][MAX_SIGNALS],
	state_trig[MAX_NODES][MAX_NODES][10][2],	

	TRIG_CAP_D_1 = 'C',
	TRIG_CAP_D_2 = 'D',
	TRIG_CAP_RS_1 = 'R',
	TRIG_CAP_RS_2 = 'S',

	trig_cap_1,
	trig_cap_2;
int 
	path[MAX_NODES*2];
char
	data[MAX_TERMS][MAX_IMPLIC];

bool load_data(char *filename)
{
	int
		i,
		j;
	FILE
		*input;

	input = fopen(filename, "rt");
	if (input == NULL)
	{
		printf("can not open file: %s\n", filename);
		return false;
	};

	fscanf(input, "%d", &NODES_CNT);
	for (i = 0; i < NODES_CNT; i++)
		for (j = 0; j < NODES_CNT; j++)
		{
			fscanf(input, "%d", &jumps[i][j]);
			if (jumps[i][j] == 0) jumps[i][j] = '0';
			else jumps[i][j] = '1';
		};
	for (i = 0; i < NODES_CNT; i++) fscanf(input, "%d", &nodes[i]);

	fscanf(input, "%d", &SIGN_CNT);

	for (i = 0; i < NODES_CNT; i++)
		for (j = 0; j < SIGN_CNT; j++)
			fscanf(input, "%d", &setsign[i][j]);
	for (i = 0; i < NODES_CNT; i++) fscanf(input, "%d", &jmpsign[i]);
	fscanf(input, "%d", &SHEME_TYPE);
	fscanf(input, "%d", &TRIG_TYPE);

	fclose(input);

	return true;
};

int minimize(int length, int filled)
{
	int
		i,
		j,
		k,
		l,
		equal,
		glued,
		g_filled = 0,
		p_filled = filled;
	char
		p_data[MAX_TERMS][MAX_IMPLIC],
		g_data[MAX_TERMS][MAX_IMPLIC],
		g_mask[MAX_TERMS],
		p_mask[MAX_TERMS][MAX_TERMS];

	memset(p_data, 0, sizeof(p_data));
	memcpy(p_data, data, sizeof(data));

	/* glue implics */
	memset(g_data, 0, sizeof(data));
	do
	{
		memset(g_mask, 0 ,sizeof(g_mask));
		glued = 0;
		for (i = 0; i < filled - 1; i++)
		{
			for (l = i + 1; l < filled; l++)
			{
				equal = 0;
				for (k = 0; k < length; k++)
					if (data[i][k] == data[l][k]) equal++;
				if (equal == length - 1)
					for (k = 0; k < length; k++)
						if (data[i][k] != '9')
							if (data[i][k] != data[l][k]) 
							{
								strcat(g_data[g_filled], data[i]);
								g_data[g_filled][k] = '9';
								g_filled++;
								g_mask[i] = 1;
								g_mask[l] = 1;
								glued += 2;
							};
			};
		};

		for (i = 0; i < filled; i++)
			if (g_mask[i] == 0)
			{
				strcat(g_data[g_filled], data[i]);
				g_filled++;
			};

		if (glued)
		{
			memset(data, 0, sizeof(data));
			memcpy(data, g_data, sizeof(data));
			memset(g_data, 0, sizeof(g_data));
			filled = g_filled;
			g_filled = 0;
		};
	}
	while (glued > 0);

	memset(p_mask, 0, sizeof(p_mask));
	for (i = 0; i < filled; i++)
		for (j = 0; j < p_filled; j++)
		{
			equal = 0;
			for (k = 0; k < length; k++)
			{
				if (data[i][k] == '9')
				{
					equal++;
					continue;
				};
				if (data[i][k] == p_data[j][k])	equal++;
			};
			if (equal == length) p_mask[i][j] = 1;
		};

	int
		maxpos = 0,
		max = 0,
		current = 0;
	bool
		mask_filled = false;

	g_filled = 0;
	memset(g_mask, 0 , sizeof(g_mask));
	memset(g_data, 0 , sizeof(g_data));

	do
	{
		max = 0;
		for (i = 0; i < p_filled; i++)
		{
			current = 0;
			for (j = 0; j < p_filled; j++)
				if (p_mask[i][j] == 1 && g_mask[j] == 0) current++;
			if (current > max)
			{
				max = current;
				maxpos = i;
			};
		};

		for (i = 0; i < p_filled; i++)
			if (p_mask[maxpos][i] == 1) g_mask[i] = 1;
		strcat(g_data[g_filled], data[maxpos]);
		g_filled++;

		mask_filled = true;
		for (i = 0; i < p_filled; i++)
			if (g_mask[i] == 0)
			{
				mask_filled = false;
				break;
			};

	}
	while (!mask_filled);

	memset(data, 0 ,sizeof(data));
	memcpy(data, g_data, sizeof(g_data));

	filled = g_filled;

	return filled;
};

void minimize_f()
{
	int
		i,
		j,
		k,
		filled;


	/* get implic for triggaz */
	for (j = 0; j < TRIG_CNT; j++)	
	{
		memset(data, 0, sizeof(data));
		filled = 0;

		for (i = 0; i < NODES_CNT; i++)
			for (k = 0; k < NODES_CNT; k++)
				if (state_trig[i][k][j][0] == '1')
				{
					strcat((char *)data[filled], state_nodes[i]);
					strcat((char *)data[filled], state_cond[i][k]);
					filled++;
				};

		minimize(STATE_LEN + SIGN_CNT, filled);

		printf("  %c%d = ", trig_cap_1, j + 1);
		for (i = 0; i < filled; i++)
		{
			for (k = 0; k < STATE_LEN + SIGN_CNT; k++) if (data[i][k] == '9') data[i][k] = '*';
			printf("%s ", data[i]);
		};
		printf("\n");
	};

	for (j = 0; j < TRIG_CNT; j++)	
	{
		memset(data, 0, sizeof(data));
		filled = 0;

		for (i = 0; i < NODES_CNT; i++)
			for (k = 0; k < NODES_CNT; k++)
				if (state_trig[i][k][j][1] == '1')
				{
					strcat((char *)data[filled], state_nodes[i]);
					strcat((char *)data[filled], state_cond[i][k]);
					filled++;
				};

		minimize(STATE_LEN + SIGN_CNT, filled);

		printf("  %c%d = ", trig_cap_2, j + 1);
		for (i = 0; i < filled; i++)
		{
			for (k = 0; k < STATE_LEN + SIGN_CNT; k++) if (data[i][k] == '9') data[i][k] = '*';
			printf("%s ", data[i]);
		};
		printf("\n");
	};


	/* get implics for signals */
	for (j = 0; j < SIGN_CNT; j++)	
	{
		memset(data, 0, sizeof(data));
		filled = 0;

		switch (SHEME_TYPE)
		{
		case SHEME_MILI:
			for (i = 0; i < NODES_CNT; i++)
				for (k = 0; k < NODES_CNT; k++)
					if (state_jumps[k][i] == 1)
						if (state_sign[i][j] == '1')
						{
							strcat((char *)data[filled], state_nodes[k]);
							strcat((char *)data[filled], state_cond[k][i]);
							filled++;
						};
			break;
		case SHEME_MURA:
			for (i = 0; i < NODES_CNT; i++)
				for (k = 0; k < NODES_CNT; k++)
					if (state_jumps[k][i] == 1)
						if (state_sign[i][j] == '1')
						{
							strcat((char *)data[filled], state_nodes[k]);
							filled++;
						};
			break;
		};

		minimize(STATE_LEN + SIGN_CNT, filled);

		printf("  Y%d = ", j + 1);
		for (i = 0; i < filled; i++)
		{
			for (k = 0; k < STATE_LEN + SIGN_CNT; k++) if (data[i][k] == '9') data[i][k] = '*';
			printf("%s ", data[i]);
		};
		printf("\n");
	};
};

bool check_terms()
{
	int
		i,
		j,
		k;

	TERM_CHECK = true;
	for (i = 0; i < NODES_CNT; i++)
	{
		/* check begin */
		if (nodes[i] == NODE_BEGIN)
		{
			k = 0;
			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1') k++;
			if (k < 1)
			{
				printf("  first node must have at least one wire\n");
				TERM_CHECK = false;
			};
		};

		/* check end */
		if (nodes[i] == NODE_END)
		{
			k = 0;
			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1') k++;
			if (k > 0)
			{
				printf("  last node must have not wires\n");
				TERM_CHECK = false;
			};
		};
	};

	return TERM_CHECK;
};

bool check_nodes()
{
	int
		i,
		j,
		k;

	NODE_CHECK = true;
	for (i = 0; i < NODES_CNT - 1; i++)
	{
		/* check jumps */
		if (nodes[i] == NODE_JUMP)
		{
			k = 0;
			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1') k++;
			if (k != 2) 
			{
				printf("  jump-like nodes must have no more and no less than two wires (node %d)\n", i+1);
				NODE_CHECK = false;
			};

			k = 0;
			for (j = 0; j < SIGN_CNT; j++)
			{
				if (setsign[i][j] > SIGN_CNT)
				{
					printf("  unknown signal in node %d\n", i+1);
					NODE_CHECK = false;
				};
			};
		};

		/* check operators */
		if (nodes[i] == NODE_OP)
		{
			if (nodes[i] == NODE_END || nodes[i] == NODE_END) continue;
			k = 0;
			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1') k++;
			if (k != 1) 
			{
				printf("  operator-like node must have no more and no less than one wire (node %d)\n", i+1);
				NODE_CHECK =false;
			};

			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1' && j == i)
				{
					printf("  operator-like node must not be wired with itself (node %d)\n", i+1);
					NODE_CHECK =false;
				};

			for (j = 0; j < SIGN_CNT; j++)
				if (setsign[i][j] > SIGN_CNT)
				{
					printf("  unknow signal in node %d\n", i+1);
					NODE_CHECK =false;
				};
		};
	};

	return NODE_CHECK;
};

bool rec_find_path(int start, int stop, int deep)
{
	int
		i;
	bool
		done = 0;

	if (start == stop) return true;
	path[deep] = start;
	for (i = 0; i < deep; i++) if (path[i] == start) return false;

	for (i = 0; i < NODES_CNT; i++)
		if (jumps[start][i] == '1') 
			if (i == stop) return true;
			else 
			{
				done = rec_find_path(i, stop, deep + 1);
				if (done == true) return true;
				if (done == false && i == NODES_CNT) return false;
				else continue;
			};

	return false;
};

bool check_paths()
{
	int
		begin,
		end,
		i;

	PATH_CHECK = true;

	i = rec_find_path(0, 4, 0);

	for (i = 0; i < NODES_CNT; i++)
	{
		if (nodes[i] == NODE_BEGIN) begin = i;
		if (nodes[i] == NODE_END) end = i;
	}

	if (!rec_find_path(begin, end, 0))
	{
		printf("  can not find path from node BEGIN (%d) to node END (%d)\n", begin, end);
		PATH_CHECK = false;
	};

	for (i = 0; i < NODES_CNT; i++)
	{
		if (!rec_find_path(begin, i, 0))
		{
			printf("  can not find path from node BEGIN (%d) to node %d\n", begin, i + 1);
			PATH_CHECK = false;
		};
		if (!rec_find_path(i, end, 0))
		{
			printf("  can not find path from node %d to node END (%d)\n", i + 1, end);
			PATH_CHECK = false;
		};
	};

	return PATH_CHECK;
};

int enum_sheme()
{
	int
		num_len = 0,
		i,
		j,
		numered,			//already numered nodes count
		t_numered;			//temp 
	char
		s_number[10];

	for (i = 0; i < MAX_NODES; i++)
		if ((int)pow(2, i) >= NODES_CNT)
		{
			num_len = i;
			break;
		};

	memset(s_number, ' ', 10);
	s_number[num_len] = 0;
	numered = 1;
	for (i = 0; i < NODES_CNT; i++)
	{
		if (nodes[i] == NODE_BEGIN || nodes[i] == NODE_END)
		{
			memset(state_nodes[0], '0', num_len);
			state_nodes[0][num_len] = 0;
		};
		if (nodes[i] != NODE_BEGIN && nodes[i] != NODE_END && nodes[i] == NODE_OP)
		{
			t_numered = numered;
			for (j = 0; j < num_len; j++)
			{
				if (t_numered % 2 == 1) s_number[num_len - j - 1] = '1';
				else s_number[num_len - j - 1] = '0';
				t_numered /= 2;
			};

			memcpy(state_nodes[i], s_number, num_len);
			numered++;
		};
	};

	STATE_LEN = num_len;
	STATE_CNT = numered;

	return STATE_CNT;
};

bool rec_find_node(int node, int pos, char *parent_cond, int deep)
{
	int 
		i,
		j;
	bool
		done;
	
	path[deep] = pos;
	for (i = 0; i < deep; i++)
		if (path[i] == pos) return false;

	if (nodes[pos] == NODE_END)
	{
		state_jumps[node][0] = 1; 
		return true;
	};
	if (nodes[pos] == NODE_OP) state_jumps[node][pos] = 1;
	else
	{
		for (i = 0; i < NODES_CNT; i++)
			if (jumps[pos][i] == '1')
			{
				if (jmpsign[pos] == i)
					for (j = 0; j < SIGN_CNT; j++)
						if (setsign[pos][j] == 1) state_cond[node][i][j] = 1;
				for (j = 0; j < SIGN_CNT; j++)
					if (parent_cond[j] == 1) state_cond[node][i][j] = 1;
				done = rec_find_node(node, i, state_cond[node][i], deep + 1); 
				if (done == false && i < NODES_CNT) continue;
			};
	};

	return true;
};

void build_state_jumps()
{
	int
		i,
		j;

	for (i = 0; i < NODES_CNT; i++)
		if (nodes[i] == NODE_BEGIN || nodes[i] == NODE_OP)
		{
			for (j = 0; j < NODES_CNT; j++)
				if (jumps[i][j] == '1')
					rec_find_node(i, j, state_cond[i][j], 0);
		};
};

int build_state_trig()
{
	int 
		i,
		j,
		k;
	char
		trig_d_jmp[2][2] = {	{'1', '0'}, 
								{'1', '1'}},
		trig_rs_jmp[2][2] = {	{'1', '0'},
								{'0', '1'}};

	for (i = 0; i < NODES_CNT; i++)
	{
		TRIG_CNT = STATE_LEN;

		if (nodes[i] != NODE_BEGIN && nodes[i] != NODE_OP) continue;
		switch (TRIG_TYPE)
		{
		case TRIG_D:
			for (j = 0; j < NODES_CNT; j++)
				if (state_jumps[i][j] == 1)
					for (k = 0; k < STATE_LEN; k++)
						if (state_nodes[j][k] == '0') memcpy(state_trig[i][j][k], trig_d_jmp[0], 2);
						else memcpy(state_trig[i][j][k], trig_d_jmp[1], 2);
			break;
		case TRIG_RS:
			for (j = 0; j < NODES_CNT; j++)
				if (state_jumps[i][j] == 1)
					for (k = 0; k < STATE_LEN; k++)
						if (state_nodes[j][k] == '0') memcpy(state_trig[i][j][k], trig_rs_jmp[0], 2);
						else memcpy(state_trig[i][j][k], trig_rs_jmp[1], 2);
			break;
		};
	};

	return TRIG_CNT;
};

void build_sheme_table()
{
	int
		i,
		j,
		k;

	printf("  BN |    BS |  JN |    JS |  COND |  SIGN ");
	for (i = 0; i < TRIG_CNT; i++)
		switch (TRIG_TYPE)
		{
		case TRIG_D:
			printf("| C | D ");
			break;
		case TRIG_RS:
			printf("| R | S ");
			break;
		};
	printf("\n ----+-------+-----+-------+-------+-------"); 
	for (i = 0; i < TRIG_CNT; i++) printf("+---+---");
	printf("\n");
	for (i = 0; i < NODES_CNT; i++)
	{
		if (nodes[i] != NODE_BEGIN && nodes[i] != NODE_OP) continue;
		for (j = 0; j < NODES_CNT; j++)
			if (state_jumps[i][j] == 1)
			{
				for (k = 0; k < SIGN_CNT; k++)
					if (state_cond[i][j][k] == 0) state_cond[i][j][k] = '0';
					else state_cond[i][j][k] = '1';
				state_cond[i][j][SIGN_CNT] = 0;
				memcpy(state_sign[j], setsign[j], SIGN_CNT);
				for (k = 0; k < SIGN_CNT; k++)
					if (state_sign[i][k] == 0) state_sign[i][k] = '0';
					else state_sign[i][k] = '1';
				state_sign[i][SIGN_CNT] = 0;
				printf(" %3d | %5s | %3d | %5s | %5s | %5s ", i, state_nodes[i], j, state_nodes[j], state_cond[i][j], state_sign[i]);
				for (k = 0; k < TRIG_CNT; k++)
					printf("| %c | %c ", state_trig[i][j][k][0], state_trig[i][j][k][1]);
				printf("\n");
				STATE_TOT++;
			};
	};
	printf("\n");
};

void print_functions()
{
	int 
		i,
		j,
		k;

	for (j = 0; j < TRIG_CNT; j++)
	{
		printf("  %c%d = ", trig_cap_1, j + 1);
		for (i = 0; i < NODES_CNT; i++)
			for (k = 0; k < NODES_CNT; k++)
				if (state_trig[i][k][j][0] == '1') printf("%s%s ", state_nodes[i], state_cond[i][k]);
		printf("\n");
	};

	for (j = 0; j < TRIG_CNT; j++)
	{
		printf("  %c%d = ", trig_cap_2, j + 1);
		for (i = 0; i < NODES_CNT; i++)
			for (k = 0; k < NODES_CNT; k++)
				if (state_trig[i][k][j][1] == '1') printf("%s%s ", state_nodes[i], state_cond[i][k]);
		printf("\n");
	};

	for (i = 0; i < NODES_CNT; i++)
		for (j = 0; j < SIGN_CNT; j++)
		{
			if (state_sign[i][j] == 1) state_sign[i][j] = '1';
			if (state_sign[i][j] == 0) state_sign[i][j] = '0';
		};
	
	switch (SHEME_TYPE)
	{
	case SHEME_MILI:
		for (j = 0; j < SIGN_CNT; j++)
		{
			printf("  Y%d = ", j + 1);
			for (i = 0; i < NODES_CNT; i++)
				for (k = 0; k < NODES_CNT; k++)
					if (state_jumps[k][i] == 1)
						if (state_sign[i][j] == '1') printf("%s%s ", state_nodes[k], state_cond[k][i]);
			printf("\n");
		};
		break;
	case SHEME_MURA:
		for (j = 0; j < SIGN_CNT; j++)
		{
			printf("  Y%d = ", j + 1);
			for (i = 0; i < NODES_CNT; i++)
				for (k = 0; k < NODES_CNT; k++)
					if (state_jumps[k][i] == 1)
						if (state_sign[i][j] == '1') printf("%s ", state_nodes[k]);
			printf("\n");
		};
	};
};

int main(int argc, char **argv)
{
	printf(BANNER);

	if (argc == 1)
	{
		printf("use: cad_lab.exe filename\n");
		return 0;
	};
	if (! load_data(argv[1])) return 1;

	printf("checking data..\n");

	if (check_terms()) printf("  terminators check passed\n");
	if (check_nodes()) printf("  nodes check passed\n");
	if (check_paths()) printf("  paths check passed\n");

	if (TERM_CHECK && NODE_CHECK && PATH_CHECK)
	{
		printf("\nbuilding sheme..\n");
		switch (SHEME_TYPE)
		{
		case SHEME_MILI:
			printf("  using %s\n", SHEME_MILI_S);
			break;
		case SHEME_MURA:
			printf("  using %s\n", SHEME_MURA_S);
		};
		printf("  numered %d states\n", enum_sheme());
		switch (TRIG_TYPE)
		{
		case TRIG_D:
			printf("  using %s\n", TRIG_D_S);
			trig_cap_1 = TRIG_CAP_D_1;
			trig_cap_2 = TRIG_CAP_D_2;
			break;
		case TRIG_RS:
			printf("  using %s\n", TRIG_RS_S);
			trig_cap_1 = TRIG_CAP_RS_1;
			trig_cap_2 = TRIG_CAP_RS_2;
			break;
		};
		build_state_jumps();
		printf("  got sheme for %d triggers\n", build_state_trig());

		printf("\nsheme states table:\n\n");
		build_sheme_table();

		printf("got functions:\n");
		print_functions();

		printf("\nminimizing fuctions:\n");
		minimize_f();
	};

	return 0;
};
