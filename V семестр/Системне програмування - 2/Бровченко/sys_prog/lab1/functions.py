def compare_piece(key:str, piece:str):
    l = 0
    if len(key)<=len(piece):
        for i in range(len(key)):
            if key[i] == piece[i]: l += 1
            else: break
    else:
        for i in range(len(piece)):
            if key[i] == piece[i]: l += 1
            else: break
    return l


def filter_return(list_of_p: list):
    tmp = []
    for i in list_of_p:
        tmp.append(i[1])
    max_piece = max(tmp)
    tmp = []
    for i in list_of_p:
        if i[1] == max_piece:
            tmp.append(i[0])
    return max_piece, tmp


def compare_full_str(key, arr: str):
    list_of_pieces = []
    for i in range(len(key)):
        temp = arr.find(key[i])
        while temp != -1:
            try:
                n = compare_piece(key[i:], arr[temp: temp+len(key)])
                list_of_pieces.append([arr[temp:n+temp], n])
            except:
                n = compare_piece(key[i:], arr[temp:])
                list_of_pieces.append([arr[temp:n + temp], n])
            temp = arr.find(key[i], temp + 1)
    if list_of_pieces != []:
        return filter_return(list_of_pieces)
    else: return (0, '')


def compare_list(key: str, inplist:list):
    res = []
    for i in inplist:
        res.append(compare_full_str(key, i))
    tmp = []
    for i in res:
        tmp.append(i[0])
    max_piece = max(tmp)
    tmp = []
    for i in res:
        if i[0] == max_piece:
            tmp.append(i[1])
    return max_piece, tmp


if __name__ == "__main__":
    inp_list = ['GARant', 'Patriot', 'fARaOn', 'Atrium', 'GaRage', 'PitStop', 'GadGet']

    print(inp_list)
    print('Input key ---> ', end=' ')
    inp_key = input('')

    result = compare_list(key=inp_key, inplist=inp_list)

    res = result[1]*100

    print('\nmax len of match: {}'.format(result[0]))
    for i in res:
        print(i, end='')
        input()

