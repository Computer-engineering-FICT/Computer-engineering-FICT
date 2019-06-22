class DataArray(object):

    def __init__(self, data_type, key, size):
        self.data_type = data_type
        self.key = key
        self.size = size
        self.elements = []
        for i in range(int(size)):
            self.elements.append(None)

    def set_element(self, ind, value):
        self.elements[int(ind)] = value

    def get_value(self, ind):
        if ind < int(self.size):
            return self.elements[ind]

    def get_key(self):
        return str(self.key)

    def get_type(self):
        return self.data_type

    def get_size(self):
        return self.size

    def __str__(self):
        return 'Array: "' + self.key + '" : ' + 'type = ' + self.data_type + '; size = ' + str(self.size) + '; value = ' + str(self.elements)
#        return 'Array : type[' + self.data_type + '], name[' + str(self.key) + '], size[' + str(self.size) + '], value = ' + str(self.elements)