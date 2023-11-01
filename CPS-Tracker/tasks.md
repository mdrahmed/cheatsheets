# Last 2 important tasks left
Slack msg from mu:
Those are two different tasks: (1) we need a motivating example (graph) to show that with only audit logs, it is impossible to see what happens inside the physical domain, (2) to connect OS-level provenance graphs (from audit logs) and application-level graphs (from our instrumented logs), we need to find corresponding nodes/edges in the two graphs for the same actions/attacks and then merge the graphs. Task (1) does not need real physical testbed. Task (2) needs both logs to be collected from the testbed.

1. Sysdig logs collected with hbw logs -- DONE, now follow step 1.2
    - Find read and write
    - Write with a malicious file/separate function call (attack)
    - Send mqtt message with a separate function call or, malicious file
    
    1.2. Generate the `mqtt` attack and run this.

2. Get most important functions using `prefixspan` 
**For data-mining look for some data mining tools**
    - Find common functions from the logs and put it into common<file name>. It will have separate logs for separate files.
        - Run the `hbwall3` and `vgrall3` file with p`prefixspan` 
        - Run it for 3 different `seq_len` => `1024, 512, 256`
        - Then get the output for 3 different size e.g., `1000, 500, 200`. If it it the range, then get the lowest number.
    - Find common functions from common<file name> for all the controllers and put it into 1 file.
    - Remove those common functions from that file
    - Then we will be left with most important functions

    - Try to do it with ML model and it will be unsupervised model. -- We don't have any labels, so, there will always be a question that the how accurately it can identify the attacks.
