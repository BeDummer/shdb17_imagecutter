import cv2
import glob, os
import numpy as np
import sys
#from matplotlib import pyplot as plt

file = sys.argv[1]
orig_img = cv2.imread(file)
img = orig_img
img = cv2.blur(img, (10,10))
for e in range(5):
 	img = cv2.erode(img, (5,5))
retval, img = cv2.threshold(img,127,255,cv2.THRESH_BINARY)
img2 = img
img2 = cv2.Canny(img2, 100, 200)
img2 = cv2.dilate(img2, (2,2))
img2 = cv2.cvtColor(img2, cv2.COLOR_GRAY2RGB)
img2 = cv2.bitwise_not(img2)
full_img = img2 #np.concatenate([img2,orig_img],1)
cv2.imwrite(os.path.splitext(file)[0]+'_edge.png', full_img)
