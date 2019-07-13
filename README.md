# nesDockerfile

这个代码库旨在帮助工程师们快速构建多平台MPI与opneMP的混合并行仿真软件开发环境。当然，你只用MPI也没问题的啦。请根据需要选择相应docker镜像。

> 你还在折腾那恼人的环境配置吗？你还在为同个团队各个成员开发平台不同导致的软件无法正常运行而头疼吗？
>
> 只要一个star，只要一个star， Docker镜像带回家。
>
> 有了本镜像，你就可以实现传说中的『一次编写，到处运行』！
>
> 还在等什么，心动不如行动，快点下载安装吧！



## 链接
* 源代码库：[nesDockerfile](https://github.com/nescirem/nesDockerfile)
* Docker Hub：https://hub.docker.com/r/nescirem/fortran_mpi_omp



## 安装并测试

1. 首先，你需要在你的电脑上安装Docker并开启虚拟化。
	你可以参考这位童鞋的Docker安装教程：https://yeasy.gitbooks.io/docker_practice/install/
	常见问题请百度："Windows开启虚拟化"、"虚拟化已开启，但docker无法运行"、"Docker windows volume“
2. 下载本镜像
	```bash
	docker pull nescirem/fortran_mpi_omp:latest
	```
3. 运行docker镜像（生成并进入容器）
	```bash
	docker container run -it fortran_mpi_omp:latest /bin/bash
	```
4. 编译并测试
	```bash
	make && chmod +x ./test.sh && ./test.sh
	```



## 基本使用

将宿主机目录挂载到容器并启动（举例）：`docker container run -it -v /d/nesDocker/fortran_mpi_openmp:/home/test fortran_mpi_omp /bin/bash`

列出当前使用镜像：`docker image ls`

退出但不关闭容器：Ctrl+p+q

列出当前所有容器：`docker container ls --all`

退出容器后重新进入：`docker restart [container id] &&  docker attach [container id]` 

镜像默认使用mpich， 若需要改为openmpi，请修改镜像的`.bashrc`文件；
镜像默认使用gcc4.8.5， 若需要改为gcc5.3.1，请修改镜像的`.bashrc`文件。
具体怎么修改都注释在文件里了，修改完成后记得`source ~/.bashrc`一下使之生效。



## 网络问题

你的机器若无法联网：请先在能联网的机器上下载-重命名-打包镜像文件（举个例子）并压缩：

```bash
docker pull nescirem/fortran_mpi_omp:latest
docker nescirem/fortran_mpi_omp:latest fortran_mpi_omp:0.4
docker rmi nescirem/fortran_mpi_omp:latest
docker save -o fortran_mpi_omp_cgns.tar fortran_mpi_omp:0.4
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
   当然，我也使用NASA的并行测试程序NAS Parallel Benchmarks测试对比了一下docker与物理机在数值计算这类计算密集型程序的性能表现，详见：[性能对比测试](#性能对比测试)。
2. 我在Windows程序写得好好的，为什么要折腾Docker？

   有收割机不用，你非要用镰刀收割我也没办法╮(╯▽╰)╭。



## 性能对比测试

等等。。马上就好（咕咕咕）