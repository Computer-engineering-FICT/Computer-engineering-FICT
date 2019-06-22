import re
p = re.compile(r"[\s,.]+")
print(p.split("word1, word2\nword3\r\nword4.word5"))
print(p.split("wordl, word2\nword3\r\nword4.word5", 2))
