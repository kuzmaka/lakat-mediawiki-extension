# go two directories up and then go to the manualTest directory
# and then run the docker-compose down command

import os
import subprocess

def dockerdown():
    os.chdir('../..')
    os.chdir('manualTest')
    subprocess.run(['docker-compose', 'down'])

# remove the folder manualTest  
def removeManualTest():
    os.chdir('..')
    os.rmdir('manualTest')

if __name__ == '__main__':
    dockerdown()
    removeManualTest()