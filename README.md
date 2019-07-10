# nesDockerfile

这个代码库旨在帮助工程师们快速构建多平台MPI与opneMP的混合并行仿真软件开发环境。当然，你只用MPI也没问题的啦。请根据需要选择相应docker镜像。

| _directory_             |   base |  tag  | mpich&openmpi  | cgns  |
| :---------------------- | :----: | :---: | :------------: | :---: |
| fortran_mpi_openmp      | centos7| mpich | 3.0.4 & 1.10.7 |       |
| fortran_mpi_openmp_cgns |fedora31|  0.1  | 3.0.4 & 1.10.7 | 3.2.1 |


> 你还在折腾那恼人的环境配置吗？你还在为同个团队各个成员开发平台不同导致的软件无法正常运行而头疼吗？
>
> 只要一个star，只要一个star， Docker镜像带回家。
>
> 有了本镜像，你就可以实现传说中的『一次编写，到处运行』！
>
> 还在等什么，心动不如行动，快点下载安装吧！



## 安装并测试

1. 首先，你需要在你的电脑上安装Docker并开启虚拟化。
	你可以参考这位童鞋的Docker安装教程：https://yeasy.gitbooks.io/docker_practice/install/
	常见问题请百度："Windows开启虚拟化"、"虚拟化已开启，但docker无法运行"
2. 运行以下命令下载本代码库
	```bash
	git clone https://github.com/nescirem/nesDockerfile.git`
	```
3. 进入相应目录，构建docker镜像
	```bash
	cd nesDockerfile/fortran_mpi_omp
	docker image build -t fortran_mpi_omp .
	```
4. 运行docker镜像（生成并进入容器）
	```bash
	docker container run -it fortran_mpi_omp /bin/bash
	```
5. 编译并测试
	```bash
	make && chmod +x ./test.sh && ./test.sh
	```



## 基本使用

将宿主机目录挂载到容器并启动（举例）：`docker container run -it -v /d/nesDocker/fortran_mpi_o
penmp:/home/test fortran_mpi_omp /bin/bash`

列出当前使用镜像：`docker image ls`

退出但不关闭容器：Ctrl+p+q

列出当前所有容器：`docker container ls --all`

退出容器后重新进入：`docker restart [container id] &&  docker attach [container id]` 



镜像默认使用mpich， 若需要改为openmpi，请修改镜像的`.bashrc`文件：

`export PATH=/usr/lib64/mpich/bin:$PATH` 👉 `export PATH=/usr/lib64/openmpi/bin:$PATH`



## 网络问题

你若在中国大陆，请使用aliyun镜像（请将[tag]替换为相应的镜像tag）：

```bash
docker pull registry.cn-hangzhou.aliyuncs.com/nes_docker/fortran_mpi_omp:[tag]
```

你的机器若无法联网：请先在能联网的机器上打包镜像文件（举个例子）并压缩：

```bash
docker pull registry.cn-hangzhou.aliyuncs.com/nes_docker/fortran_mpi_omp:0.1
docker save -o fortran_mpi_omp_cgns.tar fortran_mpi_omp:0.1
gzip fortran_mpi_omp_cgns.tar
```

将该镜像文件拷贝到目标机器上解压并安装（记得先给目标机器安装Docker）：

```bash
gzip -d fortran_mpi_omp_cgns.tar.gz
docker load -i fortran_mpi_omp_cgns.tar
```



## 常见疑问

1. 在Docker里面运行数值仿真程序，会有性能损耗么？

   几乎不会。CPU 与内存基本不会有损失，损失只出现在 I/O 上，将详见论文：[Felter, Wes, et al. 2015](https://scholar.google.com/scholar?q=An+Updated+Performance+Comparison+of+Virtual+Machines+and+Linux+Containers&hl=zh-CN&as_sdt=0&as_vis=1&oi=scholart) 或参考[知乎](https://www.zhihu.com/question/29027322)，[V2EX](https://www.v2ex.com/t/394313)。

2. 我在Windows程序写得好好的，为什么要折腾Docker？

   有收割机不用，你非要用镰刀收割我也没办法╮(╯▽╰)╭。


