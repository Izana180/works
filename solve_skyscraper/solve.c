#define SIZE 4
#include <unistd.h>

void    ft_putchar(char c);
int     check_input(char *input, int n);
int     check_visibility(int grid[SIZE][SIZE], int constraints[SIZE][4]);
int     is_valid(int grid[SIZE][SIZE], int row, int col);
int     get_next_position(int row, int col, int *next_row, int *next_col);

//バックトラック法で次のマスに進むための関数　左から右に走査し、右端に辿り着いたら折り返して次行の左端に移動する
int     get_next_position(int row, int col, int *next_row, int *next_col)
{
    if (col == SIZE - 1)
    {
        *next_row = row + 1;
        *next_col = 0;
    }
    else
    {
        *next_row = row;
        *next_col = col + 1;
    }
    return (0);
}

//バックトラック法を用いてパズルを解く
int     solve(int grid[SIZE][SIZE], int row, int col, int constraints[SIZE][4])
{
    int next_row;
    int next_col;
    int height;

    if (row == SIZE)
        return (check_visibility(grid, constraints));

    get_next_position(row, col, &next_row, &next_col);
    height = 1;
    while (height <= SIZE)
    {
        grid[row][col] = height;
        if (is_valid(grid, row, col) && solve(grid, next_row, next_col, constraints))
            return (1);
        height++;
    }
    grid[row][col] = 0;
    return (0);
}

//solve関数で得た解を出力する　解が無ければエラーを返す
void    solve_puzzle(int grid[SIZE][SIZE], int constraints[SIZE][4])
{
    int i;
    int j;

    if (solve(grid, 0, 0, constraints))
    {
        i = 0;
        while (i < SIZE)
        {
            j = 0;
            while (j < SIZE)
            {
                ft_putchar(grid[i][j] + '0');
                if (j != SIZE - 1)
                    ft_putchar(' ');
                j++;
            }
            ft_putchar('\n');
            i++;
        }
    }
    else
    {
        write(2, "Error", 5);
        ft_putchar('\n');
    }
}