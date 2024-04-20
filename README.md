# Introduction

Onion Pirate Radio is a simple project with the goal of creating a streaming radio station over the Tor network.

The instructions found here are just what I am using for my own setup. Feel free to experiment with your own settings and try out other applications. My goal here is simplicity and anonymity.

# Requirements for this project.

This project is unapologetically Linux-centric. It may run on Mac or on Windows in WSL but I haven't and won't be testing that. It will probably work on the *BSD's as long as you can get the required software to run.

## Main Packages:
* [icecast](https://icecast.org/) - Streaming Audio Server.
* [ezstream](https://icecast.org/ezstream/) - Audio generator that feeds to icecast.
* [tor](https://torproject.org) - The daemon for the Tor network. This is not the same as the Tor Browser.

## Audio Packages:
* [vorbis-tools](https://github.com/xiph/vorbis-tools)
* [madplay](https://github.com/Distrotech/madplay)

## Installation in Ubuntu:
```
sudo apt install icecast ezstream tor vorbis-tools madplay
```


