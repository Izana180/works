#define SIZE 4

//タワーの高さに重複があるものを弾く(ここに入力されるgridは全てのキーが正しい形になっていることが保証されている)
int is_valid(int grid[SIZE][SIZE], int row, int col)
{
    int i;

    i = 0;
    while (i < col)
    {
        if (grid[row][i] == grid[row][col])
        {
            return (0);
        }
        i++;
    }

    i = 0;
    while (i < row)
    {
        if (grid[i][col] == grid[row][col])
        {
            return (0);
        }
        i++;
    }
    return (1);
}

int count_visible_buildings(int *line, int size)
{
    int count;
    int max_height;
    int i;

    count = 0;
    max_height = 0;
    i = 0;
    while (i < size)
    {
        if (line[i] > max_height)
        {
            max_height = line[i];
            count++;
        }
        i++;
    }
    return (count);
}

int check_row(int grid[SIZE][SIZE], int constraints[SIZE][4], int i)
{
    int temp_line[SIZE];
    int reverse_index;
    int j;

    j = 0;
    while (j < SIZE)
    {
        temp_line[j] = grid[i][j];
        j++;
    }

    if (count_visible_buildings(temp_line, SIZE) != constraints[i][2])
        return (0);

    j = SIZE - 1;
    reverse_index = 0;
    while (j >= 0)
    {
        temp_line[reverse_index++] = grid[i][j];
        j--;
    }

    if (count_visible_buildings(temp_line, SIZE) != constraints[i][3])
        return (0);

    return (1);
}

int check_column(int grid[SIZE][SIZE], int constraints[SIZE][4], int i)
{
    int temp_line[SIZE];
    int reverse_index;
    int j;

    j = 0;
    while (j < SIZE)
    {
        temp_line[j] = grid[j][i];
        j++;
    }

    if (count_visible_buildings(temp_line, SIZE) != constraints[i][0])
        return (0);

    j = SIZE - 1;
    reverse_index = 0;
    while (j >= 0)
    {
        temp_line[reverse_index++] = grid[j][i];
        j--;
    }

    if (count_visible_buildings(temp_line, SIZE) != constraints[i][1])
        return (0);

    return (1);
}

int check_visibility(int grid[SIZE][SIZE], int constraints[SIZE][4])
{
    int row_or_col;

    row_or_col = 0;
    while (row_or_col < SIZE)
    {
        if (check_row(grid, constraints, row_or_col) == 0)
            return (0);

        if (check_column(grid, constraints, row_or_col) == 0)
            return (0);

        row_or_col++;
    }
    return (1);
}