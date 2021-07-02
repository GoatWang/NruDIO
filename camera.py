import time
from datetime import datetime

def write_val(fp, val):
    with open(fp, 'w') as f:
        f.write(str(val))

def pull_up(fp):
    write_val(fp, 1)
    time.sleep(0.000001)
    write_val(fp, 0) 

if __name__ == '__main__':
    hz = 1
    fp = r'/sys/class/gpio/gpio321/value'

    last_time = time.time()
    while True:
        pull_up(fp)
        print(time.time(), "pull up")
        while True:
            if (time.time() - last_time) >= (1/hz):
                last_time = time.time()
                break

