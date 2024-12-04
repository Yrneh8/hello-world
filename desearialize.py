import pickle
serialized_data = input("Enter serialized data: ")
deserialized_data = pickle.loads(serialized_data.encode('latin1'))
