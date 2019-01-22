# test-docker

docker run hello-world:latest python hello.py

# Linux system directories (Filesystem Hierarchy Standard):

`/usr/bin`:
Directory for the executables that are accessed by all users (everybody have this directory in their $PATH). The main files of your Software will probably be here. You should never create a subdirectory under this folder.

`/bin`:
Like /usr/bin, but here you'll find only boot process vital executables, that are simple and small. Your Software (being high-level) probably doesn't have nothing to install here.

`/usr/sbin`:
Like /usr/bin, but contains only the executables that must be accessed by the administrator (root user). Regular users should never have this directory in their $PATH. If your Software is a daemon, This is the directory for some of executables.

`/sbin`:
Like /usr/sbin, but only for the boot process vital executables, and that will be accessed by sysadmin for some system maintaining. Commands like fsck (filesystem check), init (father of all processes), ifconfig (network configuration), mount, etc can be found here. It is the system's most vital directory.

`/usr/lib`:
Contains dynamic libraries and support static files for the executables at /usr/bin and /usr/sbin. You can create a subdirectory like /usr/lib/myproduct to contain your helper files, or dynamic libraries that will be accessed only by your Software, without user intervention. A subdirectory here can be used as a container for plugins and extensions.

`/lib`:
Like /usr/lib but contains dynamic libraries and support static files needed in the boot process. You'll never find an executable at /bin or /sbin that needs a library that is outside this directory. Kernel modules (device drivers) are under /lib.

`/etc`:
Contains configuration files. If your Software uses several files, put them under a subfolder like /etc/myproduct/

`/var`:
The name comes from "variable", because everything that is under this directory changes frequently, and the package system (RPM) doesn't keep control of. Usually /var is mounted over a separate high-performance partition. In /var/log logfiles grow up. For web content we use /var/www, and so on.

# Commands:
$ docker rm $(docker ps -a -q)

$ docker run -it --name vol-test -h CONTAINER -v /data debian /bin/bash
root@CONTAINER:/# ls /data
root@CONTAINER:/# 





`/home`:
Contains the user's (real human beings) home directories. Your Software package should never install files here (in installation time). If your business logic requires a special UNIX user (not a human being) to be created, you should assign him a home directory under /var or other place outside /home. Please, never forget that.

`/usr/share/doc, /usr/share/man`:
The "share" word is used because what is under /usr/share is platform independent, and can be shared among several machines across a network filesystem. Therefore this is the place for manuals, documentations, examples etc.

`/usr/local, /opt`:
These are obsolete folders. When UNIX didn't have a package system (like RPM), sysadmins needed to separate an optional (or local) Software from the main OS. These were the directories used for that.

You may think is a bad idea to break your Software (as a whole) in many pieces, instead of keeping it all under a self-contained directory. But a package system (RPM) has a database that manages it all for you in a very professional way, taking care of configuration files, directories etc. And if you spread your Software using the FHS, beyond the user friendliness, you'll bring an intuitive way to the sysadmin configure it, and work better with performance and security.
