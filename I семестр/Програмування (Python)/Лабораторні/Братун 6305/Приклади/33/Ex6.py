import re
p = re.compile (r"^[0-9]+$") #одне або більше входження
print("Знайдено" if p.search("1234567890") else "Ні")
print("Знaйдeнo" if p.search("q1234567890") else "Ні")
print("Знaйдeнo" if p.search("1234567890q") else "Ні")
print("Знaйдeнo" if p.search("1234567q890") else "Ні")
print("Знайдено" if p.search("") else "Ні")

p = re.compile (r"^[0-9]*$")#нуль або більше входження
print("Знайдено" if p.search("") else "Ні")
print("Знайдено" if p.search("12334567890") else "Ні")
print("Знайдено" if p.search("w12334567890") else "Ні")
print("Знайдено" if p.search("123w3457890") else "Ні")
