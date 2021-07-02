1. DIO setting in the ~/.profile
```
echo 321 >/sys/class/gpio/export 2>/dev/null
echo out >/sys/class/gpio/gpio321/direction 
```
