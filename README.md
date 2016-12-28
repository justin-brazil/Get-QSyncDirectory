# Get-QSyncDirectory

Written by Justin Brazil

Targeted Product:  QNAP Qsync NAS Synchronization utility (https://www.qnap.com/en-us/utilities)

## SYNOPSIS

Targets the QNAP QSync NAS Client Utility.  

Provides local path to specified QNAP QSync directories (allowing them to be programmatically referenced regardless of their location)
	
## DESCRIPTION

This function is designed for user of QNAP's QSync directory synchronization utility.  It can be embedded in the user's PowerShell profile in order to profide a standardized method of referencing your QSync path across multiple machines - even if the path is different on each machine.
		
Requires the QNAP QSync NAS Client Utility.  Queries the registry to enumerate all root sync directories listed in your QSync client.
		
Locates filesystem path for specified root sync directory used by QSync client, 

Returns global variable $global:QSYNCPATH for reference in other applications
	
## PARAMETER Directory

The name of the root-level sync directory you would like to target (e.g. "Scripting" or "Documents")
	
## EXAMPLE

Get-QsyncDirectory -Directory "Scripting"
