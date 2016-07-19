# Current Setup

* approximately 1700 tests
* tests are run daily from a workstation
* normally 10 to 20 tests fail

# Scar Tissue

Tests I developed after painful incidents.

* Microsoft Powershell modules signed with arcane publishers' certificates.  I'm lookin' at you App-V...
* Numerous detailed tests related to the health of storage arrays and tape libraries.
* Timezones.  Enough said.
* All servers have activated licenses.

# Surprises

Unexpected things that my infrastructure tests uncovered:

* bitlocker was disabled on a VDisk containing sensitive data
* various remnants of very old decommissioned users and computers in DHCP, DNS, AD, ConfigMgr, Data Protection Manager
* services that should be running that aren't
* out-of-date Hyper-V integration services and, subsequently, Hyper-V incorrectly reporting VM's integration services versions
* early detection of a crashed printer