# Docker env for BHP Work

***Made this to keep my machine from being to filled with crap, unfortunately that
requires us to install more crap, (docker and by association wsl)***

- Cuda version 12+
- Should work with both my A2000 and your A3000 Mobile GPUS

# Prerequisites

NVIDIA cuda capable GPU With driver version 550+ (for cuda 12) compatible with relevant cuda version
Docker for desktop installed as WSL mode

Links to reference material
- [https://docs.docker.com/desktop/gpu/] <- Try running the docker image at this link first to see if it works for you (it just worked out of the box for me, nothing new to install on windows host)
- [https://developer.nvidia.com/cuda-gpus] gpu list
- [https://hub.docker.com/r/nvidia/cuda] the base docker image, may want to move to the runtime cuda initial image rather than the base one as it has extra math libraries [https://developer.nvidia.com/gpu-accelerated-libraries]

## Build it 
```
.\build_file.ps1

```
Or do `docker build -t pytorch-gpu . -f Dockerfile`

## Running it (to perform tests below)
Will drop you into python3.8 instance, with ./app and ./data directories available
```
.\run_file.ps1

Or 
``` 
docker run --name pytorch-container --gpus all -it --rm -v ./app:/app -v ./data:/data  pytorch-gpu
```

# Test it works:


1. Test cuda and pytorch:
```
import torch  
# get index of currently selected device  
torch.cuda.current_device() # returns 0 in my case  
# get number of GPUs available  
torch.cuda.device_count() # returns 1 in my case  
# get the name of the device  
torch.cuda.get_device_name(0) # 'NVIDIA GeForce RTX 3060 Laptop GPU' in my case
```
2. Test copy local dir worked:

```
import os
os.listdir()
```

3. exit and kill docker (keep image, delete instance)
```
exit()
```

### Guide followed to make the docker file
https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/



