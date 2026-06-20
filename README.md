# AeroShell Workspace

Contains code, components and other miscellaneous files shared between AeroThemePlasma and VistaThemePlasma, that don't belong in other projects. In the future, this repo will contain other libraries needed for both ATP and VTP.

## Note on building

When building to a non-standard destination (using DESTDIR), it's required to export the environment variable prior to running the first CMake command, like so:

```bash
export DESTDIR=out
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=ON -B build .
cmake --build build 
cmake --install build
```

This is done this way in order to properly install a symlink for the Segoe UI font config, while obeying the DESTDIR variable.
