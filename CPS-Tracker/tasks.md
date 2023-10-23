## Last 2 important tasks left
Slack msg from mu:
Those are two different tasks: (1) we need a motivating example (graph) to show that with only audit logs, it is impossible to see what happens inside the physical domain, (2) to connect OS-level provenance graphs (from audit logs) and application-level graphs (from our instrumented logs), we need to find corresponding nodes/edges in the two graphs for the same actions/attacks and then merge the graphs. Task (1) does not need real physical testbed. Task (2) needs both logs to be collected from the testbed.

1. Sysdig logs collected with hbw logs
    - Find read and write
    - Write with a malicious file/separate function call (attack)
    - Send mqtt message with a separate function call or, malicious file

2. Get most important functions
    - Find common functions from the logs and put it into common<file name>. It will have separate logs for separate files.
    - Find common functions from common<file name> for all the controllers and put it into 1 file.
    - Remove those common functions from that file
    - Then we will be left with most important functions

    - Try to do it with ML model and it will be unsupervised model.
