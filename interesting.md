Penetration Testing:
1. Use nmap to find openports and tools running with version number e.g., openssh 7.6p1
2. Look for vulnerabilities using openVAS, look CVE
3. Use known exploits e.g., poc exploit for heartbleed, log4j poc exploit, sudo killer
```
https://github.com/sensepost/heartbleed-poc
https://github.com/kozmer/log4j-shell-poc
https://github.com/TH3xACE/SUDO_KILLER
```
5. Use fuzzing to find unknown vulnerabilities, look AFL fuzzer


Binary Analysis:
1. look valgrind: [https://valgrind.org/docs/valgrind2007.pdf](https://valgrind.org/docs/valgrind2007.pdf)
