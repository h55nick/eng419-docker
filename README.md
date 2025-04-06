# What even is this

This repo contains enough to build and then run a Docker container that has the same Python (plus libraries) environment as the Coursera labs for ENG419. The `requirements.txt` is taken from the output of `pip freeze` within a Coursera lab, with the NVIDIA specific packages removed. It may be possible to pass GPU access through to a container (which would be useful for any accelerators including Apple Metal on M1/M2/M3/M4 laptops), pull requests are welcome.

# How to use

1. Install Docker, or something compatible
2. Run `sh build.sh` or copy the commands from that file and run them on the command line. This will take some time as a far amount of libraries and container layers need to be downloaded and installed
3. Whenever you want to use the environment, 
    - change to the directory you want to be the root of the file system Jupyter notebook server will be able to see
    - run `sh run.sh` or copy the commands from that file and run them on the command line
4. Run `docker ps` to list all running containers and find the appropriate one (the image type is `eng419`), and note its ID
5. Run `docker logs [ID]` to show the last output from that container. Towards the end it will say "Jupyter Server 2.15.0 is running at:", skip the next line and copy the one that starts with `http://127.0.0.1:8888` and paste it into a browser window
6. When you're done, run `docker stop [ID]`

# Does it work

Seems to. No guarantees, but I was able to load up my labs for 101 and 201 and run them without any changes. On a MacBook Pro M4, some models trained faster than on the A10 GPU in the lab environment, while some trained slower. Overall, performance is comparable. Again, if anyone has dark magic to pass local GPU resources through, pull requests are welcome.