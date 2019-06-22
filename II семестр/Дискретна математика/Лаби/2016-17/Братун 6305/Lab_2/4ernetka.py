with open(r"Relation R.txt", "r", encoding="UTF-8") as f:
            relation_R = f.read().split(" ")
with open(r"Relation S.txt", "r", encoding="UTF-8") as f:
            relation_S = f.read()
print(relation_R)
copy1_relation_R = []
for i in relation_R:
     print(i[1],i[0])

print(copy1_relation_R)

