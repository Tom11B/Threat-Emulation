# Threat-Emulation
Simple scripts to emulate malicious activity based on the MITRE ATT&amp;CK framework. The output of each script is designed to indicate success or failure for result reporting.  

### fileless_exe.ps1:

  Tests the storage and execution of malware in the registry, by default the user has write permission to this location. This can also    	be used as a test for establishing persistence.    

xml_execute.bat:

  Simulates the execution of remote code without compromising the host system. No shell is opened, the script assumes that if the code can   be downloaded and executed from a remote location that it is possible to initiate a remote shell with this attack vector.  
