# Імпорт модуля subsamp1 з поточного каталогу
from .import subsamp1 as ss1
var1 ="Значення з: {0}".format(ss1.msg)
from  .subsamp1 import  msg as ms1
var2 = "Значення з: {0}".format(ms1)
#Імпорт модуля sample1 з батьківського каталогу
from ..import sample1 as smp
var3 = "Значення з: {0}".format(smp.msg)
from  ..sample1 import msg as m
var4 = "Значення з: {0}".format(m)
