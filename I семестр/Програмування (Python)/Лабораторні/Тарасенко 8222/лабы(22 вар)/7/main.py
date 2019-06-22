import os
import shutil
import random
from string import punctuation


# path = r'C:\lab7\Тарасенко'
# os.makedirs(path)
shutil.copyfile(r'C:\lab7\Тарасенко\22.txt', r'C:\lab7\Тарасенко\221.txt')

datalist = []
with open(r'C:\lab7\Тарасенко\221.txt', 'r') as file1:
    for line in file1:
        # print(line, end='')
        newline = ''
        line = line.replace('\n', '').split(' ')
        for i in range(0,len(line)):
            line[i] = list(line[i])
            pos_list = []
            for letter in line[i]:
                if letter in punctuation:
                    pos_list.append((line[i].index(letter),letter))
            for letter in line[i]:
                if letter in punctuation:
                    line[i].remove(letter)
            random.shuffle(line[i])
            for pos in pos_list:
                line[i].insert(pos[0],pos[1])
            newline += ''.join(line[i]) + ' '
            for letter in newline:
                if letter.isalpha():
                    newline = newline.replace(newline[newline.index(letter)], letter.upper())
                    break
        newline += '\n'
        datalist.append(newline)

with open(r'C:\lab7\Тарасенко\221.txt', 'w') as file1:
    for i in datalist:
        file1.write(i)


datalist2 = []
consonants = 'БбВвГгҐґДдЖж3зЙйКкЛлМмНнПпРрСсТтФфXхЦцЧчШшЩщ'
shutil.copyfile(r'C:\lab7\Тарасенко\22.txt', r'C:\lab7\Тарасенко\222.txt')
with open(r'C:\lab7\Тарасенко\222.txt', 'r') as file2:
    for line in file2:
        newline = ''
        line = line.replace('\n', '').split(' ')
        for i in range(0,len(line)):
            line[i] = list(line[i])
            pos_list = (list(enumerate(line[i])))
            new_pos_list = [list(i) for i in pos_list]
            new_pos_list1 = [i for i in new_pos_list if i[1] in consonants]
            for c in range(len(line[i]) - 1, -1, -1):
                if line[i][c] in consonants:
                    del line[i][c]
            letter_list = [i[1] for i in new_pos_list1]
            letter_list.reverse()
            for a in new_pos_list1:
                del a[1]
            for a in new_pos_list1:
                a.insert(1,letter_list[0])
                del letter_list[0]
            for pos in new_pos_list1:
                    line[i].insert(pos[0], pos[1])
            newline += ''.join(line[i]) + ' '
        newline += '\n'
        datalist2.append(newline)

with open(r'C:\lab7\Тарасенко\222.txt', 'w') as file2:
    for i in datalist2:
        file2.write(i)
