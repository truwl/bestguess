arr = [1,2,3,34,4,5]
arr.sort(reverse=True)
import numpy as np
import pandas as pd
pdseries = pd.Series(arr).unique()
pdseries[1]