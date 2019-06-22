import pickle
#Відновлення послідовності байтів у об'єкт
obj1 = pickle.loads(b'\x80\x03]q\x00(K\x01K\x02K\x03K\x04K\x05e.')
print(obj1)
obj2 = pickle.loads(b'\x80\x03(K\x06K\x07K\x08K\tK\ntq\x00.')
print(obj2)
