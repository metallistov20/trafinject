L7 traffic injections to automate remote setting of L2/L3 network hardware.

ABSTRACT
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

int iAclGroup()

int iRebootSwitch()
Issues request to reboot the switch immediately.

int iAssignIp()
Assigns static IP with network mask, and receives confirmation from switch – in response packet the IP-address is already altered.
int iBindMacIp()

int iEnablePort()


---






WORKFLOW
~~~~~~~~


...

SUMMARY
~~~~~~~


Being updated and tested on switches:
    TL-SL2218
    TL-SL2428
    TL-SL5428E


