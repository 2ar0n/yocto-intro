# Links

Using LTS scarthgap
https://docs.yoctoproject.org/5.0.15/ref-manual/system-requirements.html#supported-linux-distributions


## Docker image
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2823422188/Building+Yocto+Images+using+a+Docker+Container

```sh
docker build -t yoctocontainer .
docker run -it -v `pwd`:/home/build/work yoctocontainer
```