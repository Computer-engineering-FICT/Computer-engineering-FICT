import os

os.chdir('C:/lab7/Bratun')

def get_lines():
    with open(r'v51.txt', "r", encoding="utf‐8") as f:
        tmp = f.readlines()
        f.close()
        return tmp

lines = get_lines()

newfilelines = []

def filelength():
    for i in range(len(lines)):
        if len(lines[i]) % 2 == 0:
            newfilelines.append(lines[i])

filelength()

with open(r'v52.txt', "w", encoding="utf‐8") as f:
    for i in newfilelines:
        f.write(i)
    f.close()
