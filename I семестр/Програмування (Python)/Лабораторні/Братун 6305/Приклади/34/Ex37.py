import re
p = re.compile(r"[\s,.]+")
print(re.split(p, "word1, word2\nword3"))
print(re.split(r"[\s,.]+", "word1, word2\nword3"))

