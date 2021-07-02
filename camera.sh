# DIO GPIO Pin
DO0=320

function exposeDO() {
         echo $1 >/sys/class/gpio/export 2>/dev/null
          echo out >/sys/class/gpio/gpio$1/direction
          }

function setDO() {
         echo $2 >/sys/class/gpio/gpio$1/value
         }

function getDO() {
         cat /sys/class/gpio/gpio$1/value
         }

### Initial DO
exposeDO $DO0

### Set DO1 = 1
setDO $DO0 1

### Set DO1 = 0
# setDO $DO0 0

### Save DI1 Value to DI_VALUE
DO_VALUE=$(getDO $DO0)
echo $DO_VALUE
