# go two directories up and then go to the manualTest directory
# and then run the docker-compose down command

import os
import subprocess

def dockerdown():
    # the the directory of this file, then go two directories up and then go to the manualTest directory and docker-compose down. Use os.path.join
    os.chdir(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), 'manualTest'))
    subprocess.run(['docker-compose', 'down'])

# remove the folder manualTest  
def removeManualTest():
    os.chdir(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
    # print(os.getcwd())
    # remove recursively the manualTest directory
    os.system('sudo rm -rf manualTest')
    # # the directory of this file, then go two directories up and then remove manualTest directory
    # os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    # os.rmdir('manualTest')

if __name__ == '__main__':
    dockerdown()
    removeManualTest()