graph = [
    {'dlm': 1, 'ltr': 0, 'cfr':1},
    {'dlm': 2, 'cfr': 2},
    {'dlm': 3, 'itr': 3, 'cfr': 2},
    {'dlm': 4, 'itr': 4, 'cfr':4},
    {'dlm': 5, 'itr': 5},
    {'dlm': 6, 'itr': 6},
    {'dlm': 6, 'itr': 6},
    {}
    ]


def follow_signals(start: int, signals: list):
    global path
    current_state = start
    path = [['', current_state + 1]]
    for signal in signals:
        if signal in graph[current_state]:
            current_state = graph[current_state][signal]
        path.append([signal, current_state + 1])
    return path


def show_path(path_of_signals: list):
    for i in range(len(path_of_signals)):
        try:
            print('ST{}({}) -> '.format(path_of_signals[i][1], str(path_of_signals[i+1][0])), end=' ')
        except IndexError:
            print(' ST{}'.format(path_of_signals[i][1]))


if __name__ == '__main__':
    signals1 = ['dlm', 'itr', 'cfr', 'dlm', 'itr']
    signals2 = ['itr', 'itr', 'dlm', 'itr', 'cfr', 'itr', 'itr']
    signals3 = ['ltr', 'cfr', 'dlm', 'dbl', 'cfr', 'cfr', 'dlm', 'dbl','cfr']


    show_path(follow_signals(0, signals3))
