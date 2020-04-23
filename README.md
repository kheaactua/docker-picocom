# docker-picocom

Small container for https://github.com/npat-efault/picocom

## Usage

Example to connect to COM5:

```sh
dkr -ti --privileged --device=/dev/ttyUSB5 picocom:latest -b 921600 /dev/ttyUSB5
```
