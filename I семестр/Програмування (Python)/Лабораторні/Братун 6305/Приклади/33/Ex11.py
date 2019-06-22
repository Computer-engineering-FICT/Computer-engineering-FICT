import re
p = re.compile (r"^[0-9]*$")#нуль або більше входження
print("Знайдено" if p.search("") else "Ні")
print("Знайдено" if p.search("12334567890") else "Ні")
print("Знайдено" if p.search("w12334567890") else "Ні")
print("Знайдено" if p.search("123w3457890") else "Ні")
print("Знайдено" if p.search("wwwww") else "Ні")
