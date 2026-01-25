# Links

Using LTS scarthgap
https://docs.yoctoproject.org/5.0.15/ref-manual/system-requirements.html#supported-linux-distributions


## Docker image
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2823422188/Building+Yocto+Images+using+a+Docker+Container

```sh
sudo docker build -t yoctocontainer .
sudo docker run -it -v `pwd`:/home/build/work yoctocontainer
```

## Future
Set up devcontainer as in https://github.com/exactassembly/yocto-vscode-howto