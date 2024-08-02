# About
This repository was created to automate the installation of Unbound and Redis, interconnect them, configure optimal settings for both, as well as for the operating system, and keep everything up to date with periodic update jobs, all while minimizing resource usage.

# Setup *alpine linux only
```SHELL
wget -qO - https://raw.githubusercontent.com/BenSabry/UnboundRedis/main/setup.sh | sh
```

![Screenshot of Unbound/Redis running.](https://github.com/BenSabry/UnboundRedis/blob/main/.github/assets/SS_monitor.sh.png?raw=true)
*Screenshot of Unbound/Redis running.

# Tech/Tools
<b>*[Unbound](https://www.nlnetlabs.nl/projects/unbound/about/)*</b>: is a validating, recursive, caching DNS resolver. It is designed to be fast and lean and incorporates modern features.<br />
<b>*[Redis](https://redis.io/about/)*</b>: is the world’s fastest in-memory database. that can also be used as a cache or document or vector database.<br />

# Recommendations
Setup on clean Alpine linux installation

# Periodic Jobs
<b>Daily</b> Rotating logs<br />
<b>Weekly</b> System Upgrade<br />
<b>Monthly</b> Unbound Update<br />
