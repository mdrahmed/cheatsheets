# CPS-Tracker

## APT attacks
An Advanced Persistent Threat (APT) attack refers to a prolonged, targeted cyber attack that is carried out by a sophisticated adversary with specific objectives. **APT attacks typically involve a combination of various techniques and tools to gain unauthorized access, maintain persistence, and exfiltrate sensitive data over an extended period of time.**
Persistence: APT attacks are typically long-term and persistent in nature, with the attacker attempting to maintain their presence within the target network or system over an extended period of time.
Advanced Techniques: APT attacks often involve advanced techniques and tools, including zero-day exploits, custom malware, social engineering, and targeted phishing emails. Attackers may leverage sophisticated tactics to evade detection and bypass security measures.
Covert Operations: APT attackers aim to remain undetected by blending into the normal network activity, using techniques such as lateral movement, privilege escalation, and encryption to hide their actions.

## False Data Injection:

In False Data Injection (FDI) an adversary maliciously injects fabricated or manipulated data into a system or network. Purpose of this attack is to deceive or manipulate the behavior of the targeted system, leading to incorrect decisions, compromised operations, or compromised integrity of the data.
**This could involve modifying sensor readings, altering data packets, or manipulating the input signals to deceive the system.**

[In testbed, it starts with this check](https://github.com/fischertechnik/txt_training_factory/blob/master/TxtSmartFactoryLib/src/TxtVacuumGripperRobotRun.cpp#L192-L195),
```
		else if (!dps.is_DIN())
		//else if(!block)
		{
			FSM_TRANSITION( START_DELIVERY, color=blue, label='dsi' );
		}
```
This `dps.is_DIN()` function is defined in the `TxtDeliveryPickupStation.cpp` [file](https://github.com/fischertechnik/txt_training_factory/blob/master/TxtSmartFactoryLib/src/TxtDeliveryPickupStation.cpp#L117-L129), 
```
	bool TxtDeliveryPickupStation::is_DIN()
	{
		std::cout<<"Function: TxtDeliveryPickupStation::is_DIN()\n";
		SPDLOG_LOGGER_TRACE(spdlog::get("console"), "is_DIN", 0);
		assert(pT->pTArea);
		return (pT->pTArea->ftX1in.uni[6] == 1);
	}
```

**[Note:Most important thing to notice here this function `is_DIN()` will return `false or 0`. But the condition will check if it's not `true or 1`. So, if I print the values then I should get `0`. That's what I got in the log.]** See the following,

```
Function: _ZN2ft21TxtVacuumGripperRobot7fsmStepEv
Global Variable:   %235 = load i8, i8* %234, align 1, !dbg !25748, !tbaa !25750, !range !25663
loadInst_values: 0
Global Variable:   %249 = load i8, i8* %248, align 4, !dbg !25761, !tbaa !25763, !range !25663
loadInst_values: 0
Global Variable:   %268 = load i8, i8* %267, align 4, !dbg !25775, !tbaa !25776, !range !25663
loadInst_values: 0
Global Variable:   %313 = load i8, i8* %312, align 1, !dbg !25815, !tbaa !25662, !range !25663
loadInst_values: 0
Function: _ZN2ft24TxtDeliveryPickupStation6is_DINEv
Called from: _ZN2ft21TxtVacuumGripperRobot7fsmStepEv _ZN2ft24TxtDeliveryPickupStation6is_DINEv callInst_values: 0
Function: _ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC2IivEERKT_
Function: _ZNSt11this_thread9sleep_forIxSt5ratioILx1ELx1000EEEEvRKNSt6chrono8durationIT_T0_EE
Function: _ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEE4zeroEv
Function: _ZNSt6chrono15duration_valuesIxE4zeroEv
Function: _ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC2IxvEERKT_
Function: _ZNSt6chronoleIxSt5ratioILx1ELx1000EExS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE
Function: _ZNSt6chronoltIxSt5ratioILx1ELx1000EExS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE
Function: _ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv
Function: _ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv
Called from: _ZNSt11this_thread9sleep_forIxSt5ratioILx1ELx1000EEEEvRKNSt6chrono8durationIT_T0_EE _ZNSt6chronoleIxSt5ratioILx1ELx1000EExS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE callInst_values: 0
```
![FID detection](https://github.com/mdrahmed/cheatsheets/assets/26908164/a50fa093-26e2-4882-a712-51e92ecbd9f5)


See the function is called first and then inside the condition the value is `false`.
```
Function: _ZN2ft24TxtDeliveryPickupStation6is_DINEv
Called from: _ZN2ft21TxtVacuumGripperRobot7fsmStepEv _ZN2ft24TxtDeliveryPickupStation6is_DINEv callInst_values: 0
```


**False Data Injection: To perform this attack, we will insert malicious data inside the code. Which will trigger [this particular code](https://github.com/fischertechnik/txt_training_factory/blob/master/TxtSmartFactoryLib/src/TxtVacuumGripperRobotRun.cpp#L194) or, we will directly [call this case](https://github.com/fischertechnik/txt_training_factory/blob/master/TxtSmartFactoryLib/src/TxtVacuumGripperRobotRun.cpp#L350),**
```
	FSM_TRANSITION( START_DELIVERY, color=blue, label='dsi' );
```
Or,
```
	case START_DELIVERY:
	{
		printState(START_DELIVERY);

		setTarget("hbw");
		moveDeliveryInAndGrip();
		moveNFC();
		std::string uid = dps.nfcReadUID();
		if (uid.empty())
		{
			FSM_TRANSITION( WRONG_COLOR, color=red, label='empty tag' );
			break;
		} else {
			proStorage.resetTagUidMaskTs(uid);
			proStorage.setTimestampNow(uid, DELIVERY_RAW_INDEX);
			if (reqWP_HBW != 0) {
				reqWP_HBW->printDebug();
				delete reqWP_HBW;
			}
			reqWP_HBW = new TxtWorkpiece(uid,WP_TYPE_NONE,WP_STATE_RAW);
			reqWP_HBW->printDebug();
			FSM_TRANSITION( COLOR_DETECTION, color=blue, label='nfc tag ok' );
		}
#ifdef __DOCFSM__
		FSM_TRANSITION( START_DELIVERY, color=blue, label='wait' );
#endif
		break;
	}
```


**If we do that then we will not see the Function call, so according to that we or, the administrator can tell that's an attack.** 
```
Function: _ZN2ft24TxtDeliveryPickupStation6is_DINEv
```

**To replace the sensor data:**
Write script to intercept the data stream, modify the sensor data, and send the altered data to the system using python.
Intercept the MQTT messages passing through the middleware and modify the relevant data fields before forwarding them to the system. I can use wireshark/python for this. 

