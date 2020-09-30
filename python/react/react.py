class InputCell:
    def __init__(self, initial_value):
        self.value = initial_value


class ComputeCell:
    def __init__(self, inputs, compute_function):
        self.compute_function = compute_function
        self.inputs = inputs
        # self.__value = compute_function([inpt.value for inpt in inputs])

    def add_callback(self, callback):
        pass

    def remove_callback(self, callback):
        pass

    @property
    def value(self):
        return self.compute_function([inpt.value for inpt in self.inputs])
