import cv2
import numpy as np

def assert_text_was_found(coordinatesList, text):
    if coordinatesList is None:
        print('Text ' + text + ' was found')
        raise Exception("Text '{}' was not found".format(text))
    elif len(coordinatesList) == 0:
        print('Text ' + text + ' was not found')
        raise Exception("Text '{}' was not found".format(text))
    else:
        print('Text ' + text + ' was found')
        

def find_sub_image(im1, im2):
    needle = cv2.imread(im1)
    haystack = cv2.imread(im2)

    result = cv2.matchTemplate(needle, haystack, cv2.TM_CCOEFF_NORMED)
    y, x = np.unravel_index(result.argmax(), result.shape)
    x += (needle.shape[1]/2)
    y += (needle.shape[0]/2)
    return x, y