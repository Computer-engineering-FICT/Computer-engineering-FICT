import re
p = re.compile (r"^[0-9]?$")#жодного або одне входженння
print("Знайдено" if p.search("") else "Ні")
print("Знайдено" if p.search("1") else "Ні")
print("Знайдено" if p.search("6") else "Ні")
print("Знайдено" if p.search("w") else "Ні")
print("Знайдено" if p.search("w1") else "Ні")
