import numpy as np
import pandas as pd

# https://www.machinelearningplus.com/python/101-pandas-exercises-python/

# Create a pandas series from each of the items below: a list, numpy and a dictionary
mylist = list('abcedfghijklmnopqrstuvwxyz')
myarr = np.arange(26)
mydict = dict(zip(mylist, myarr))

# Convert the series ser into a dataframe with its index as another column on the dataframe
mylist = list('abcedfghijklmnopqrstuvwxyz')
myarr = np.arange(26)
mydict = dict(zip(mylist, myarr))
ser = pd.Series(mydict)

# import numpy as np
# ser1 = pd.Series(list('abcedfghijklmnopqrstuvwxyz'))
# ser2 = pd.Series(np.arange(26))