# nesDockerfile

这个代码库旨在帮助工程师们快速实现多平台MPI与opneMP的混合并行开发。当然，你只用MPI也没问题的啦。

> 你还在折腾那恼人的环境配置吗？你还在为开发平台不同导致的软件无法正常运行而头疼吗？
>
> 只要一个star，只要一个star， fortran_mpi_omp镜像带回家。
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
3. 进入相应目录，构建docker image
	```bash
	cd nesDockerfile/fortran_mpi_omp
	docker image build -t fortran_mpi_omp .
	```
4. 运行docker image
	```bash
	docker container run -it fortran_mpi_omp /bin/bash
	```
5. 编译并测试
	```bash
	make && chmod +x ./test.sh && ./test.sh
	```

## 如果你的网络环境较差



## 离线环境





