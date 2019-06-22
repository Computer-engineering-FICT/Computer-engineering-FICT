import re

a = re.search('(?<=\[).*?(?=\])', var).group()
print(a)
