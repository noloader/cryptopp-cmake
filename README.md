## Crypto++ CMake

[![Build Status](https://travis-ci.org/noloader/cryptopp-cmake.svg?branch=master)](https://travis-ci.org/noloader/cryptopp-cmake)
[![Build status](https://ci.appveyor.com/api/projects/status/qximuf4lv7213v8s/branch/master?svg=true)](https://ci.appveyor.com/project/noloader/cryptopp-cmake/branch/master)

This repository contains CMake files for Wei Dai's Crypto++ (https://github.com/weidai11/cryptopp). It supplies `CMakeLists.txt` and `cryptopp-config.cmake` for Crypto++ for those who want to use CMake. CMake is officialy unsupported, so use it at your own risk.

The purpose of Crypto++ CMake is two-fold:

1. better support Linux distributions, like Gentoo
2. provide users with centrally maintained CMake project files

The initial `cryptopp-config.cmake` and `CMakeLists.txt` were taken from the library sources when CMake support was dropped. Also see CMake on the [Crypto++ wiki](https://www.cryptopp.com/wiki/CMake) for some history and how to use CMake with Crypto++.

## Documentation

The CMake project files are documented on the [Crypto++ wiki | CMake](https://www.cryptopp.com/wiki/CMake). If there is an error or ommission in the wiki article, then please fix it or open a bug report.

## Testing

The CMake files are officialy unsupported, so use them at your own risk. With that said, the CMake source files are tested with Crypto++ on Linux and OS X using [Travis CI](https://github.com/weidai11/cryptopp/blob/master/.travis.yml).

In June 2018 the library added `cryptest-cmake.sh` to help test the CMake gear. The script is located in Crypto++'s `TestScripts` directory. The script downloads the CMake project files, builds the library and then runs the self tests.

If you want to use `cryptest-cmake.sh` to drive things then perform the following steps.

    cd cryptopp
    cp TestScripts/cryptest-cmake.sh .
    ./cryptest-cmake.sh

## Workflow

The general workflow is clone to clone this repo:

    git clone https://github.com/noloader/cryptopp-cmake.git
    mkdir build
    cd build
    cmake ../cryptopp-cmake

As cmake (starting with 3.14) is able to download the Crypto++ sources itself, it's not needed anymnore add the submodule to Crypto++ for seamless integration. For any of you using a cmake version prior to 3.14, you unfortunately have to clone the sources by yourself. You have the choice if the clone Wei's code and clone this repo into it, or you clone this repo and clone Wei's code into your source-dir (recommended if you're working in this source, too) or you can clone the source into your build-dir.

## ZIP Files

If you are working from a Crypto++ release zip file, then you should download the same cryptopp-cmake release zip file. Both Crypto++ and this project use the same release tags, such as CRYPTOPP_8_0_0.

If you mix and match Master with a release zip file then things may not work as expected. You may find the build project files reference a source file that is not present in the Crypto++ release.

## Integration
The CMake submodule integrates with the Crypto++ library. The library's `GNUmakefile` and `GNUmakefile-cross` were modified to clean the artifacts produced by CMake. To clean the directory after running CMake perform a `git checkout GNUmakefile` followed by a `make -f GNUmakefile distclean`.

## Collaboration
We would like all distro maintainers to be collaborators on this repo. If you are a distro maintainer then please contact us so we can send you an invite.

If you are a collaborator then make changes as you see fit. You don't need to ask for permission to make a change. Noloader is not an CMake expert so there are probably lots of opportunities for improvement.

Keep in mind other distros may be using the files, so try not to break things for the other guy. We have to be mindful of lesser-used platforms and compilers, like AIX, Solaris, IBM xlC and Oracle's SunCC.

## License

Everything in this repo is release under Public Domain code. If the license or terms is unpalatable for you, then don't feel obligated to use it or commit.
