import re
р = re.compile(r"червон((а)|(е))")
print("Знaйдeнo" if р.search("червона") else "Ні")
print("Знaйдeнo" if р.search("червоне") else "Ні")
print("Знaйдeнo" if р.search("червоний") else "Ні")
print(ord('а'))
print(ord('я'))
print(ord('ґ'))

