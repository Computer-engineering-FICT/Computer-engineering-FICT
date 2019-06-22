try:
    х = -3
    assert х >= 0, "Повідомлення про помилку"
except AssertionError as err:
    print(err)
