#define SIZE 4
#include <unistd.h>

int     check_input(char *input, int n);
int     check_visibility(int grid[SIZE][SIZE], int constraints[SIZE][4]);
int     is_valid(int grid[SIZE][SIZE], int row, int col);
int     get_next_position(int row, int col, int *next_row, int *next_col);
int     solve(int grid[SIZE][SIZE], int row, int col, int constraints[SIZE][4]);
void    solve_puzzle(int grid[SIZE][SIZE], int constraints[SIZE][4]);

void    ft_putchar(char c)
{
    write(1, &c, 1);
    return ;
}

//入力されたヒント(キー)を成形する
void    parse_constraints(char *c, int constraints[SIZE][SIZE])
{
    int i;
    int j;
    int k;

    i = 0;
    j = 0;
    k = 0;
    while (c[k] != '\0')
    {
        if ('0' <= c[k] && c[k] <= '9')
        {
            constraints[j][i] = c[k] - '0';
            j++;
            if (j == SIZE)
            {
                j = 0;
                i++;
            }
        }
        k++;
    }
}

//出力のためのsizexsizeのグリッドを生成
void    create_grid(int grid[SIZE][SIZE])
{
    int i;
    int j;

    i = 0;
    while (i < SIZE)
    {
        j = 0;
        while (j < SIZE)
        {
            grid[i][j] = 0;
            j++;
        }
        i++;
    }
}

int     main(int argc, char *argv[])
{
    int grid[SIZE][SIZE];
    int constraints[SIZE][SIZE];
    int n;

    n = (int)SIZE;
    create_grid(grid);
    if (argc != 2 || check_input(argv[1], n) == 0)
    {
        write(2, "Error", 5);
        ft_putchar('\n');
        return (0);
    }
    parse_constraints(argv[1], constraints);
    solve_puzzle(grid, constraints);
    return (0);
}