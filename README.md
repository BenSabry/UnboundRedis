# About
The purpose of this repository is to automate the installation of Unbound with Redis on a fresh Alpine Linux installation (whether it’s an LXC, VM, or bare metal), establish their interconnection, configure optimal settings for both, and keep everything up to date with periodic update jobs, all while minimizing resource usage, and all accomplished with a single step or script.

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
<b>Daily</b> Rotating logs<br />
<b>Weekly</b> System Upgrade<br />
<b>Monthly</b> Unbound Update<br />
