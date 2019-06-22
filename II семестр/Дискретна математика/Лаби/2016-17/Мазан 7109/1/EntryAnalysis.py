import SetsCreation, random

class Sets_Analysing():
    def __init__(self):
        self.Result = []

    @staticmethod
    def get_usual_set(volume, universal):
        return SetsCreation.Set(random.sample(universal(), volume))

    @staticmethod
    def get_universal_set(Value_list):
        return SetsCreation.Set(list(range(Value_list[0],Value_list[1]+1)))

    @staticmethod
    def set_hand_creation(list):
        return SetsCreation.Set(list)
