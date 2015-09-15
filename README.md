#Dockerized R00T (CERN)
_compile your root-scripts without building root yourself_

Important: for security reasons the interactive gui-features of root will not be supported. But you can easily save your graphs to pdf.

## usage
just try
```bash
docker run --rm martingabelmann/root --help

```

### complie single c++ file 
Assuming you've a script to compile at ``/your/work/dir/rootfile.cc``:

```bash
cd /your/work/dir/
docker run --rm -v $PWD:/tmp/ martingabelmann/root -c rootfile.cc -o binary.out
```
the ``-o`` flag is optional. If not set, the binary is called ``rootfile.out``.

Then simply run your new binary with
```bash
docker run --rm -ti -v $PWD:/tmp/ martingabelmann/root run binary.out
```

### linking stuff together
may will be supported in future


## more complex stuff
join a containers bash with

```bash
docker run --rm -ti -v $PWD:/tmp/ martingabelmann/root bash
```
to manage more complex situattions.

You can spawn R00T by typing ``root`` (not well tested) but all gui features will not work.



##ToDo
  * linking
  * free choice of libs
  * host integration-scripts (maybe a set of aliases, bash-scripts or scons)
  * examples
