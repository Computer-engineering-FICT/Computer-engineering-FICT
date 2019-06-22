graph = [
    {'dlm': 1, 'itr': 1},
    {'dlm': 6, 'itr': 2},
    {'dlm': 3, 'itr': 3},
    {'dlm': 4, 'itr': 1},
    {'dlm': 5, 'itr': 5},
    {'dlm': 6, 'itr': 6},
    {'dlm': 7, 'itr': 7},
    {}
    ]


def follow_signals(start: int, signals: list):
    global path
    current_state = start
    path = [['', current_state + 2]]
    for signal in signals:
        if signal in graph[current_state]:
            current_state = graph[current_state][signal]
        path.append([signal, current_state + 2])
    return path


def show_path(path_of_signals: list):
    for i in range(len(path_of_signals)):
        try:
            print('STATE{}({})  --> '.format(path_of_signals[i][1], str(path_of_signals[i+1][0])), end=' ')
        except IndexError:
            print(' STATE{}'.format(path_of_signals[i][1]))


if __name__ == '__main__':
    signals1 = ['itr', 'itr', 'dlm', 'cfr','cfr', 'itr', 'dlm','dlm',  'bdd', 'cfr']
    print(signals1, end='\n\n')

    show_path(follow_signals(0, signals1))
