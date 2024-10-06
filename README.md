# About
This repository aims to automate the installation of Unbound and Redis on a fresh Alpine Linux setup (LXC, VM, or bare metal), establish their connection, configure optimal settings for both and the operating system itself, and maintain updates with periodic jobs, all while minimizing resource usage and achieving everything with a single script.

# Setup *alpine linux only
```SHELL
wget -qO - https://raw.githubusercontent.com/BenSabry/UnboundRedis/main/setup.sh | sh
```

# Screenshot of Unbound/Redis running
![Screenshot of Unbound/Redis running.](https://github.com/BenSabry/UnboundRedis/blob/main/.github/assets/SS_monitor.sh.png?raw=true)

# Tech/Tools
<b>*[Unbound](https://www.nlnetlabs.nl/projects/unbound/about/)*</b>: is a validating, recursive, caching DNS resolver. It is designed to be fast and lean with modern features.<br />
<b>*[Redis](https://redis.io/about/)*</b>: is the world’s fastest in-memory database. that can also be used as a cache database.<br />

# Periodic Jobs
<b>Daily</b> Unbound Update<br />
<b>Daily</b> Rotating logs<br />
<b>Weekly</b> System Upgrade<br />
