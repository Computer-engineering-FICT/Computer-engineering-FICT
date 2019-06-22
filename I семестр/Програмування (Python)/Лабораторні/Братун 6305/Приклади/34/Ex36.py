import re
p = re.compile(r"[0-9]+")
print(p.split("word, word\nword"))

