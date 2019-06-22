import re
p = r"201[7]"
print(re.subn(p, "2012", "2014, 2015, 2016, 2017"))

