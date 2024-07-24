# Fixer
 Fix for the CrowdStrike incident

Homepage and instructions:

https://www.pedrof.com/blog/en/projects/fixer-for-crowdstrike-incident/

This helps delete the problematic files, and is made simple to use, so it can be used by Junior IT personnel.

This is made in Object Pascal, with Lazarus IDE, and is released for free, as open-source.

Features

* Simple and intuitive
* Ability to first check for the problematic files (C-00000291*.sys), without changing anything on the system
* 1-Click removal of the problematic files
* Ability to Enable and Disable the Windows Safe Mode – both from the App and from the WinPE bootable ISO
* Does not require the use of command line
* Works fully offline and does not contact any servers (eg. does not “phone home”)
* Free and open-source

How to use the App

1. Boot into Safe mode or Windows Recovery Environment
2. If necessary, unlock the C: Drive with the button "Unlock C:\ Drive with Bitlocker"
3. Run the application and click "FIX IT"
3. Reboot


## Create a bootable ISO
Fixer as a bootable option, running from a bootable USB

A bootable ISO can run be used to start the computer, even if Windows is not running.

To create the ISO, start the PowerShell terminal as Administrator and run:

`irm https://www.pedrof.com/fixer.ps1 | iex`

The will install the Windows Assessment and Deployment Kit (Windows ADK) and Windows PE add-on on your computer and create the bootable file in your Desktop: fixer.iso

To then create a a USB drive, use Rufus, with the default options.

System requirements:

* Windows 10 or Windows 11
* Internet access: approximately 3.4 GB will be downloaded
* Space requirements: 9 GB of available space