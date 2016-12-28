#####################SCRIPT_CONTROLS##
#!#Name:  FUNCTION:  Get-QSyncDirectory
#!#Author:  Justin Brazil
#!#Description:  Targets the QNAP QSync NAS Client Utility.  Provides local path to specified QNAP QSync directories,\ allowing them to be programmatically referenced regardless of their location.
#!#Tags:  QNAP, QSync, Client, Profile, Sync, Directory, QSYNCPATH, NAS, Storage, Registry
#!#Type: Function, Script
#!#Product:  PowerShell,Get-QSyncDirectory
#!#Modes: Scripting
#!#Notes:  Returns global variable $global:QSYNCPATH for reference in other applications
#!#Link:  www.githun.com/justin-brazil, https://www.qnap.com/en-us/utilities
#!#Group: Profile Utilities
#!#Special:  
####################/SCRIPT_CONTROLS##


function Get-QSyncDirectory
<#
	.SYNOPSIS
		Provides local path to specified QNAP QSync directories (allowing them to be programmatically referenced regardless of their location on disk)
	
	.DESCRIPTION
		This function is designed for user of QNAP's QSync directory synchronization utility.  It can be embedded in the user's PowerShell profile in order to profide a standardized method of referencing your QSync path across multiple machines - even if the path is different on each machine.
		
		Requires the QNAP QSync NAS Client Utility.  Queries the registry to enumerate all root sync directories listed in your QSync client.
		
		Locates filesystem path for specified root sync directory used by QSync client, 

		Returns global variable $global:QSYNCPATH for reference in other applications
	
	.PARAMETER Directory
		The name of the root-level sync directory you would like to target (e.g. "Scripting" or "Documents")
	
	.EXAMPLE
		Get-QsyncDirectory -Directory "Scripting"

	.NOTES
		Additional information about the function.
#>
{
	param
	(
		[Parameter(Mandatory = $true,
				   Position = 0,
				   HelpMessage = 'The desired root sync directory')]
		[string]$Directory
	)
	$global:QSYNCPATH = (Get-ItemProperty -Path HKCU:\Software\QNAP\Qsync -Name ShowOverlayPathList).ShowOverlayPathList.Split(",") | Where { $_ -LIKE $Directory}
	return $global:QSYNCPATH
}