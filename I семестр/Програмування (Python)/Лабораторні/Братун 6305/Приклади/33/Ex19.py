import re
#* - 0 або більше
#? - жодного або одне
s = "Учні та  учителі в школі"
p = re.compile(r"([а-я]+((ителі)|(ні)))", re.I)
print(p.findall(s))

p1 = re.compile(r"([а-я]+(?:(?:ителі)|(?:ні)))", re.I)
print(p1.findall(s))
