# DIO GPIO Pin
DO0=320
DO1=321
DO2=322
DO3=323
DI1=325
DI2=331
DI3=326

function exposeDI() {
         ## Expose DI to User Space
          echo $1 >/sys/class/gpio/export 2>/dev/null
           echo in >/sys/class/gpio/gpio$1/direction
           }

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

### Initial DI
exposeDI $DI1
exposeDI $DI2
exposeDI $DI3

### Initial DO
exposeDO $DO0
exposeDO $DO1
exposeDO $DO2
exposeDO $DO3

### Set DO1 = 1
setDO $DO1 1

### Set DO1 = 0
setDO $DO1 0

### Save DI1 Value to DI_VALUE
DI_VALUE=$(getDI $DI1)
