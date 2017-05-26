#!/bin/sh 
 
HOSTN=$( scutil --get LocalHostName );
SUBMITURL="http://smcxs001.cairns.catholic.edu.au/munki/munki-enroll/enroll.php"
COMPFIELD1=`defaults read /Library/Preferences/com.apple.RemoteDesktop Text1`



if [ "$COMPFIELD1" = "Music" ]; then
	IDENTIFIER1="_Music"
elif [ "$COMPFIELD1" = "Art" ]; then
	IDENTIFIER1="_Art"
fi

# Output for the benefit of the DeployStudio log
echo "Compfield1: $COMPFIELD1"
echo "Identifer1 is $IDENTIFIER1"

# Set the munki config
defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL "http://smcxs001.cairns.catholic.edu.au/munki"
defaults write /Library/Preferences/ManagedInstalls ClientIdentifier "$HOSTN"

# Application paths
CURL="/usr/bin/curl"

$CURL --max-time 5 --silent --get -d hostname="$HOSTN" -d identifier1="$IDENTIFIER1" "$SUBMITURL"

exit 0
