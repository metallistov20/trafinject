L7 traffic injections to automate remote setting of L2/L3 network hardware.

Abstract
~~~~~~~~

Current library implements hypertext traffic injections for automation of remote setting on network-switching and -routing hardware.

Short description of functions
int iOpenSite( )
Performs ‘opening’ of web-interface of switch. I.e. simulates passing authentication data (username and password) to a authentication form (applet) and receives response with session id ( tID hexadecimal number needed for further L7 requests).

int iCloseSite( )
Simulates clicking onto ‘Logout’ button (menu entry) in web-interface of switch.

int iCreateSnmp( )
Creates SNMP group with read-write access rights with given name. Such group is necessary if once wants to access SNMP strings of switch via SNMP protocol.

int iSaveSite( )
Simulates clicking ‘Save Config’ button (menu entry) in web-interface of switch.

int iUpgradeFirmware( )
Uploads binary file with firmware image on switch, and initiates firmware writing into flash ( on switch side ) . 

int iAclGroup( )
Creates an ACL group with given ID. 

int iRebootSwitch( )
Issues request to reboot the switch immediately.

int iAssignIp( )
Assigns static IP with network mask, and receives confirmation from switch – in response packet the IP-address is already altered.

int iBindMacIp( )
Perfoms manual binding of given IP and given  MAC address .

int iEnablePort( )
Enables or disables the port (with given ID).

Workflow
~~~~~~~~

1. int iOpenSite( )
Two-stroke operation. In first message it does referencing to <http://TARGET_IP/logon/LogonRpm.htm> with POST payload containing user authentication credentials, on second actually opens the site – references page <http://TARGET_IP/> with POST payload containing user ID and level, on this the HTTPS packet with response arrives to STDOUT of shell. This response contains session ID, which is 32-digit hexadecimal, and which is valid for all other operations till current session is closed by iCloseSite operation.

2. int iCloseSite( )
Two-stroke operation. In first message it does referencing to <http://TARGET_IP/userRpm/Logout.htm> without payload, and in second – to <http://TARGET_IP/>. On this the finalizing HTTPS response arrives to STDOUT of shell. After this the session ID created on iOpenSite and used by other functions during previous steps is not valid anymore, and dynamically generated HTM-pages are destroyed ( not available for referencing ).

3. int iCreateSnmp( )
Five-stroke operation. In first message it references to <http://<TARGET_IP>> with no extra payload, in second – to <http://<TARGET_IP>/userRpm/SNMPv3CommunityConfigRpm.htm>, in third – to <http://<TARGET_IP>/userRpm/SNMPv3CommunityConfigRpm.htm/?s_userlevel=1&_tid_=<tID>>, in fourth – to to <http://<TARGET_IP>/userRpm/SNMPv3CommunityConfigRpm.htm/?txt_comname=<SNMP_GROUP>&comRight=2&comView=0&button=Add&_tid_=<tID>>, in fifth - <http://<TARGET_IP>/userRpm/SNMPv3GlobalConfigRpm.htm?snmpState=1&button=stateSubmit&_tid_=<tID>> .

4. int iSaveSite( )
Four-stroke operation. In first message it references to <http://<TARGET_IP>> with no extra payload, in second – to  <http://<TARGET_IP>/userRpm/ConfigsaveRpm.htm?s_userlevel=1&_tid_=<tID>&_tid_=<tID>>, in third – to <http://<TARGET_IP>/userRpm/ConfigsaveImg.htm>, and in fourth – to <http://<TARGET_IP>/userRpm/ConfigsaveFileRpm.htm?_tid_=<tID>>.

5. int iUpgradeFirmware( )
Five-stroke operation. In first message it references to <http://<TARGET_IP>/userRpm/FirmwareRpm.htm?s_userlevel=1&_tid_=<tID>> , in second – to <http://<TARGET_IP>/help/FirmwareHelpRpm.htm>. TODO: Presumably (this is being checked currently) this message can be omitted. Then the program passes main flow to a shell and form within shell executes two processes: first - < /usr/bin/curl -F filedata=@<LOCAL_FILENAME_OF_FIRMWARE_TO_UPLOAD> http://<TARGET_IP>/  > - on this the necessary fields in http-form get filled;
and second - < /usr/bin/curl --form submit=@<LOCAL_FILENAME_OF_FIRMWARE_TO_UPLOAD> --form submit=upgrade --form _tid_=<tID>  http://<TARGET_IP>/userRpm/FirmwareAdRpm.htm > - on this the form gets submitted. 
Finally, the main flow returns back to a program , and program references fifth page <http:///<TARGET_IP> /userRpm/FirmwareUpdateTempRpm.htm?_tid_=<tID>> - on this the server side starts procedure of uploading via HTTP protocol and writing down to a flash the firmware defined as <LOCAL_FILENAME_OF_FIRMWARE_TO_UPLOAD> . Note that after this operation server side gets not responding till flashing down is finished amd server side is rebooted. Once the new firmware contains specific settings (such as different MAC or different IP, etc) then following calls of current program should encounter this.

6. int iUpgradeFirmware( )
Two-stroke operation

7. int iAclGroup( )
Two-stroke operation

8. int iRebootSwitch( )
Two-stroke operation

9. int iAssignIp( )
Two-stroke operation

10. int iBindMacIp( )
Two-stroke operation

11. int iEnablePort( )
Two-stroke operation

...

SUMMARY
~~~~~~~


Being updated and tested on switches:
    TL-SL2218
    TL-SL2428
    TL-SL5428E


