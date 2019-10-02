from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from scipy.stats import norm
from sklearn.preprocessing import StandardScaler
from scipy import stats
import warnings
warnings.filterwarnings('ignore')

import sys
import pandas_profiling

df_train=pd.read_csv('C:/Users/Sergi Ch/Downloads/UBIQUM/@a SAMPLE PROJECTS/House Prices/House Prices/datasets/train.csv')
