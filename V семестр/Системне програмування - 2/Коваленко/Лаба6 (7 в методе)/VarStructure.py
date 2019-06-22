class DataVar(object):

    def __init__(self, data_type, key, value=None):
        self.data_type = data_type
        self.key = key
        self.value = value

    def set_value(self, value):
        self.value = value

    def get_value(self):
        return self.value

    def get_key(self):
        return str(self.key)

    def get_type(self):
        return self.data_type

    def __str__(self):
        return 'Var: "' + self.key + '" : ' + 'type = ' + self.data_type + '; value = ' + str(self.value)
        #return 'Var : type[' + self.data_type + '], name[' + str(self.key) + '], value = ' + str(self.value)