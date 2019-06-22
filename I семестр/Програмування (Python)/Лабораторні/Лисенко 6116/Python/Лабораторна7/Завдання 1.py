import os, pickle, shutil, shelve
try:
#1
    os.mkdir(os.path.abspath("lab7"))
#2
    os.mkdir(os.path.abspath("lab7/Лисенко"))
except FileExistsError: pass
#3
shutil.copy("16.txt", "lab7/Лисенко/16.txt")
shutil.copy("v16.txt", "lab7/Лисенко/v16.txt")
shutil.copy("alpha.txt", "lab7/Лисенко/alpha.txt")
#4
try:
    os.mkdir(os.path.abspath("lab5"))
except FileExistsError: pass
d = {'Київ': 2908088, 'Москва': 12197596, 'Париж': 2243833,
     'Вашингтон': 601723, 'Токіо': 13185502, 'Афіни': 664046}
with open(os.path.abspath("data"), "wb") as f:
    pickle.dump(d, f)
shutil.move(os.path.abspath("data"), os.path.abspath("lab5/data"))
with open(os.path.abspath("lab5/data"), "rb") as f:
    d = pickle.load(f)
d["Лондон"] = 8308369
with open(os.path.abspath("lab5/data2"), "wb") as f:
    pickle.dump(d, f)
#5
try:
    os.mkdir(os.path.abspath("lab6"))
except FileExistsError: pass
d = {"Україна": ("Київ", 847, 2908, 603628, 42760),
     "США": ("Вашингтон", 177, 601, 9826675, 324883),
     "Росія": ("Москва", 2510, 12197, 17098246, 143500),
     "Франція": ("Париж", 105, 2244, 551695, 65073),
     "Греція": ("Афіни", 38, 664, 131990, 11305),
     "Японія": ("Токіо", 2187, 13185, 377944, 126434)}
with shelve.open(os.path.abspath("data")) as f:
    f.update(d)
shutil.move(os.path.abspath("data"), os.path.abspath("lab6/data"))
with shelve.open(os.path.abspath("lab6/data")) as f:
    f.pop("США")
    f.popitem()
    f.update({"Китай": ("Пекін", 16801, 22000, 9597, 1330000)})
    for i in f:
        print(i, f[i])
