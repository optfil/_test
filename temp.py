# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import math
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0., 10.1, 0.2)
a = np.sin(x)
b = np.cos(x)

fig1 = plt.figure(figsize = (8, 8))

x = np.linspace(0, 10, 51)
y = np.linspace(0, 8, 41)
(X, Y) = np.meshgrid(x, y)
a = np.exp(-((X - 2.5)**2 + (Y - 4)**2) / 4.0) - np.exp(-((X - 7.5)**2 + (Y - 4)**2) / 4.0)

ac = 0.25 * (a[:-1, :-1] + a[:-1, 1:] + a[1:, :-1] + a[1:, 1:])
c = plt.pcolor(x, y, ac)
plt.clim(-1, 1)
d = plt.colorbar(c, orientation = 'horizontal')
q = plt.jet()
e = plt.contour(x, y, a, np.linspace(-1, 1, 11), colors = 'k')
lx = plt.xlabel("x")
ly = plt.xlabel("y")

sttl = plt.suptitle("two plots")

plt.show()