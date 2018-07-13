import h5py as h5
import numpy as np
import matplotlib.pyplot as plt

# h5.run_test()
f = h5.File('test1.h5', 'r')
f.keys()
f['size'][:][0]
x = f['x'][:]
y = f['y'][:,:]
f.close()

x
y

plt.plot(x, y[1,:])
plt.plot(x, y[2,:])
plt.show()
