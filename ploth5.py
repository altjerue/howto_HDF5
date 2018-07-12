import h5py as h5
import numpy as np
import matplotlib.pyplot as plt

# h5.run_test()

f = h5.File('test1.h5', 'r')

# f.keys()

x = f['x'][:][:]
y = f['y'][:][:]
dy = f['dy'][:][:]


plt.plot(x, y)
plt.plot(x, dy)
plt.show()
