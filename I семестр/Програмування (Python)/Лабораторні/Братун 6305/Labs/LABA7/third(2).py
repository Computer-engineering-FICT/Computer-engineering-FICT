import os
os.chdir('C:/lab7/Bratun')

def get_lines():
    with open(r'51.txt', "r", encoding="utf‐8") as f:
        tmp = f.readlines()
        f.close()
        return tmp

lines = get_lines()

new_file_lines = []

def filelength():
    for i in range(len(lines)):
        if len(lines[i]) % 2 == 0:
            new_file_lines.append(lines[i])

filelength()

with open(r'52.txt', "w", encoding="utf‐8") as f:
    for i in new_file_lines:
        f.write(i)
    f.close()
