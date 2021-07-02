import time
from datetime import datetime

hz = 10
fp = r'/sys/class/gpio/gpio321/value'

def write_val(fp, val):
    with open(fp, 'w') as f:
        f.write(str(val))

HIGH = True
while True:
    if HIGH:
        write_val(fp, 1) # 1: pull down
        HIGH = False
    else:
        write_val(fp, 0) # 1: pull up
        HIGH = True
        print(datetime.now(), 'pull up!')
    time.sleep((1/hz)/2)

