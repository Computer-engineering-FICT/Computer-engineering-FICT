print("Доступ до модуля sample1")
import mypack.sample1 as s1
print(s1.msg)
print(s1.__name__)

print("\nДоступ до модуля subsamp1")
import mypack.subpack.subsamp1 as ss1
print(ss1.msg)
print(ss1.__name__)

print("\nДоступ до модуля subsamp2")
import mypack.subpack.subsamp2 as ss2
print(ss2.msg)
print(ss2.__name__)
