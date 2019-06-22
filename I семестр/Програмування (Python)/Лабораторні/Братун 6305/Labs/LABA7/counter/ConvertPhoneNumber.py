import os
import time
path = 'C:/lab7/Bratun' #Path to file
filename = r'v51.txt' #Name file to converted
newfilename = r'v52.txt' # New file

os.chdir(path) #go to directory

#Read file
with open( filename, "r", encoding="utf-8") as f:
    tmp = f.readlines()
    tmp[0] = tmp[0][1:]
    f.close()

#Convert file
with open( newfilename, "w", encoding="utf-8") as d:
    for i in tmp:
        d.write(i[5:10] + " blocked" + "\n")
    d.close()

#Take nowday data
t = os.path.getctime(newfilename)
rename = time.strftime("%d.%m.%Y", time.localtime(t))

#Rename
os.rename(newfilename, rename + ".bat")
