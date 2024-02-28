# Lab 1: Beginner Fuzzing

## Erros Encountered
It was not able to find `afl-cc` or some other libraries because the library was not shared globally meaning it was not present inside the `/usr/local/bin` or `/usr/bin/`. So, just went to the `AFLplusplus` directory and ran `sudo make install`.


### Issues
For all issues at start, run the commands shown in sudo mode. Get the sudo mode by running this - `sudo -i`

#### Issue 1
Now, got ran `make` and `fuzzgoat` is compiled. Now, got this while running `afl-fuzz -i in -o out ./fuzzgoat`

```
(base) ┌─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $afl-fuzz -i in -o out ./fuzzgoat @@
afl-fuzz++4.09a based on afl by Michal Zalewski and a large online community
[+] AFL++ is maintained by Marc "van Hauser" Heuse, Dominik Maier, Andrea Fioraldi and Heiko "hexcoder" Eißfeldt
[+] AFL++ is open source, get it at https://github.com/AFLplusplus/AFLplusplus
[+] NOTE: AFL++ >= v3 has changed defaults and behaviours - see README.md
[+] No -M/-S set, autoconfiguring for "-S default"
[*] Getting to work...
[+] Using exponential power schedule (FAST)
[+] Enabled testcache with 50 MB
[+] Generating fuzz data with a length of min=1 max=1048576
[*] Checking core_pattern...

[-] Hmm, your system is configured to send core dump notifications to an
    external utility. This will cause issues: there will be an extended delay
    between stumbling upon a crash and having this information relayed to the
    fuzzer via the standard waitpid() API.
    If you're just testing, set 'AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1'.

    To avoid having crashes misinterpreted as timeouts, please log in as root
    and temporarily modify /proc/sys/kernel/core_pattern, like so:

    echo core >/proc/sys/kernel/core_pattern

[-] PROGRAM ABORT : Pipe at the beginning of 'core_pattern'
         Location : check_crash_handling(), src/afl-fuzz-init.c:2361

```

I can't echo even with `sudo`. So, solved this with `tee` command,
```
echo "kernel.core_pattern=core" | sudo tee /proc/sys/kernel/core_pattern
```
Check details,
```
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $ls
afl-command-line  fuzzgoat  fuzzgoat_ASAN  fuzzgoat.c  fuzzgoat.h  fuzzgoatNoVulns.c  in  input-files  LICENSE  main.c  Makefile  README.md  seed
(base) ┌─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $echo core >/proc/sys/kernel/core_pattern
-bash: /proc/sys/kernel/core_pattern: Permission denied
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $sudo echo core >/proc/sys/kernel/core_pattern
-bash: /proc/sys/kernel/core_pattern: Permission denied
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $echo "kernel.core_pattern=core" | sudo tee /proc/sys/kernel/core_pattern
[sudo] password for raihan: 
kernel.core_pattern=core
(base) ┌─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $cat /proc/sys/kernel/core_pattern
kernel.core_pattern=core
```

#### Issue 2

```
(base) ┌─[raihan@raihan-XPS-8940]─[~/fuzzgoat]
└──╼ $afl-fuzz -i in -o out ./fuzzgoat @@
afl-fuzz++4.09a based on afl by Michal Zalewski and a large online community
[+] AFL++ is maintained by Marc "van Hauser" Heuse, Dominik Maier, Andrea Fioraldi and Heiko "hexcoder" Eißfeldt
[+] AFL++ is open source, get it at https://github.com/AFLplusplus/AFLplusplus
[+] NOTE: AFL++ >= v3 has changed defaults and behaviours - see README.md
[+] No -M/-S set, autoconfiguring for "-S default"
[*] Getting to work...
[+] Using exponential power schedule (FAST)
[+] Enabled testcache with 50 MB
[+] Generating fuzz data with a length of min=1 max=1048576
[*] Checking core_pattern...
[*] Checking CPU scaling governor...

[-] Whoops, your system uses on-demand CPU frequency scaling, adjusted
    between 781 and 4687 MHz. Unfortunately, the scaling algorithm in the
    kernel is imperfect and can miss the short-lived processes spawned by
    afl-fuzz. To keep things moving, run these commands as root:

    cd /sys/devices/system/cpu
    echo performance | tee cpu*/cpufreq/scaling_governor

    You can later go back to the original state by replacing 'performance'
    with 'ondemand' or 'powersave'. If you don't want to change the settings,
    set AFL_SKIP_CPUFREQ to make afl-fuzz skip this check - but expect some
    performance drop.

[-] PROGRAM ABORT : Suboptimal CPU scaling governor
         Location : check_cpu_governor(), src/afl-fuzz-init.c:2470
```

Again, even with sudo, I can't change the file,
```
(base) ┌─[raihan@raihan-XPS-8940]─[/sys/devices/system/cpu]
└──╼ $echo performance | tee cpu*/cpufreq/scaling_governor
tee: cpu0/cpufreq/scaling_governor: Permission denied
tee: cpu10/cpufreq/scaling_governor: Permission denied
tee: cpu11/cpufreq/scaling_governor: Permission denied
tee: cpu12/cpufreq/scaling_governor: Permission denied
tee: cpu13/cpufreq/scaling_governor: Permission denied
tee: cpu14/cpufreq/scaling_governor: Permission denied
tee: cpu15/cpufreq/scaling_governor: Permission denied
tee: cpu1/cpufreq/scaling_governor: Permission denied
tee: cpu2/cpufreq/scaling_governor: Permission denied
tee: cpu3/cpufreq/scaling_governor: Permission denied
tee: cpu4/cpufreq/scaling_governor: Permission denied
tee: cpu5/cpufreq/scaling_governor: Permission denied
tee: cpu6/cpufreq/scaling_governor: Permission denied
tee: cpu7/cpufreq/scaling_governor: Permission denied
tee: cpu8/cpufreq/scaling_governor: Permission denied
tee: cpu9/cpufreq/scaling_governor: Permission denied
performance
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[/sys/devices/system/cpu]
└──╼ $sudo echo performance | tee cpu*/cpufreq/scaling_governor
tee: cpu0/cpufreq/scaling_governor: Permission denied
tee: cpu10/cpufreq/scaling_governor: Permission denied
tee: cpu11/cpufreq/scaling_governor: Permission denied
tee: cpu12/cpufreq/scaling_governor: Permission denied
tee: cpu13/cpufreq/scaling_governor: Permission denied
tee: cpu14/cpufreq/scaling_governor: Permission denied
tee: cpu15/cpufreq/scaling_governor: Permission denied
tee: cpu1/cpufreq/scaling_governor: Permission denied
tee: cpu2/cpufreq/scaling_governor: Permission denied
tee: cpu3/cpufreq/scaling_governor: Permission denied
tee: cpu4/cpufreq/scaling_governor: Permission denied
tee: cpu5/cpufreq/scaling_governor: Permission denied
tee: cpu6/cpufreq/scaling_governor: Permission denied
tee: cpu7/cpufreq/scaling_governor: Permission denied
tee: cpu8/cpufreq/scaling_governor: Permission denied
tee: cpu9/cpufreq/scaling_governor: Permission denied
performance
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[/sys/devices/system/cpu]
└──╼ $
```


Previously `tee` command worked but now it doesn't because it is being executed with elevated privileges (using sudo), but the individual parts of the command (echo and tee) run in separate subshells. As a result, the redirection (>) inside the sudo command doesn't have the necessary elevated privileges.
I used a different approach, such as using sudo with a here-string (<<<) and solved with this,
```
sudo sh -c 'for cpu in /sys/devices/system/cpu/cpu*/cpufreq/; do echo performance > "$cpu/scaling_governor"; done'
```

Notice, if I run this command `sudo sh -c 'echo performance > cpu*/cpufreq/scaling_governor'` then it will not work because `cpu*` means any directories like `cpu0`,`cpu1` etc should be taken care of. So, there should be a loop as I did above.
```
(base) ┌─[✗]─[raihan@raihan-XPS-8940]─[/sys/devices/system/cpu]
└──╼ $sudo sh -c 'echo performance > cpu*/cpufreq/scaling_governor'
sh: 1: cannot create cpu*/cpufreq/scaling_governor: Directory nonexistent
```

After this step, when I ran `afl-fuzz -i in -o out ./fuzzgoat`, it worked.


## Notes on docker
I executed the command `afl-fuzz -i in -o out ./fuzzgoat` but got the same issues on docker. I tried to fix it inside docker by going to the directories and doing necessary changes e.g.,
`echo core >/proc/sys/kernel/core_pattern` but it didn't let me do that because this `/proc/sys/kernel/core_pattern` is my system file and docker cannot make changes to my system file. 
So, when I changed the file inside my system (not inside docker, I did it outside docker). Then it worked fine inside docker.
