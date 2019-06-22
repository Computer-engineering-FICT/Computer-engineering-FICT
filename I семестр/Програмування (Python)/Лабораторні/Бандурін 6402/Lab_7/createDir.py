import os

os.chdir("C:")
if "Lab_5" not in os.listdir():
    os.mkdir("Lab_5")

if "Lab_7" not in os.listdir():
    os.mkdir("Lab_7")
if "Lab_6" not in os.listdir():
    os.mkdir("Lab_6")
os.chdir("Lab_7")
if "Vlad Bandurin" not in os.listdir():
    os.mkdir("Vlad Bandurin")
