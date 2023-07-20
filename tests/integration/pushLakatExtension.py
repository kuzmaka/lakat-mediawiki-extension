# copy the lakat folder into the manualTest folder

import os
import sys

def CopyLakatToManualTest():
    # check whether the manualTest folder exists
    if not os.path.exists(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), 'manualTest')):
        sys.exit('manualTest folder does not exist')
    # change to root path
    os.chdir(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
    # copy the lakat folder into the manualTest / extensions folder using os.path.join  
    os.system('cp -r Lakat manualTest/extensions')

if __name__ == '__main__':
    CopyLakatToManualTest()
