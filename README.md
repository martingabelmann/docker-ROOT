#Dockerized ROOT (CERN)
_compile your root-scripts without building root yourself_

Important: for security reasons the interactive gui-features of root will not be supported (but you can of course save graphs to pdf).

## Usage
Just try
```bash
docker run --rm martingabelmann/root --help

```

### Complie single c++ file 
Assuming you've a script to compile at ``/your/work/dir/rootfile.cc``:

```bash
cd /your/work/dir/
docker run --rm -v $PWD:/tmp/ martingabelmann/root -c rootfile.cc -o binary.out
```
The ``-o`` flag is optional: if not set, the binary is called ``rootfile.out``.

Then run your new binary with
```bash
docker run --rm -ti -v $PWD:/tmp/ martingabelmann/root -r binary.out
```

## Manage more complex situations
Join a containers bash with

```bash
docker run --rm -ti -v $PWD:/tmp/ martingabelmann/root bash
```

You can spawn ROOT by typing ``root`` (not well tested) but all gui features will not work.
