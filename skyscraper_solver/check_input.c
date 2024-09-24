int count_space(char *str)
{
    int i;
    int count;

    count = 0;
    i = 0;
    while (str[i] != '\0')
    {
        if (str[i] == ' ')
        {
            count++;
        }
        i++;
    }
    return (count);
}

int ft_strlen(char *str)
{
    int i;

    i = 0;
    while (str[i] != '\0')
        i++;
    return (i);
}

int check_input(char *input, int SIZE)
{
    int i;

    i = 0;
    //入力が正しいためには、空白文字と数字の数が不正でないことが必要(2桁の数字、空白が複数連続しているパターンを弾く)
    if (!(count_space(input) == (SIZE * SIZE - 1) && ft_strlen(input) == (SIZE * SIZE * 2 - 1)))
        return (0);
    //先の条件を満たしている場合、入力が全て範囲内の数字、または空白文字になっているか調べる(数字でない文字、範囲外の数字が入っているパターンを弾く)
    while (i < SIZE * SIZE * 2 - 1)
    {
        if (!(('1' <= input[i] && input[i] <= '0' + SIZE) || (input[i] == ' ')))
            return (0);
        i++;
    }
    return (1);
}