# Munki Enroll

A set of scripts to automatically enroll clients in Munki, allowing for a very flexible manifest structure.

This version is my slight rescripting of the original, Copyright (c) 2012 Cody Eding, to suit my organisation.
See below and LICENSE file for licensing details.

## Why Munki Enroll?

My organization has a very homogenous environment consisting of several identical deployments. We deploy machines with a core manifest ("__core"). Separate labs have a sub manifest such as ("_Art", "_Music"). This works wonderfully, until computer three in room 28 needs a special piece of software.

Munki Enroll allows us this flexibility. A computer is deployed with a generic manifest, and Munki Enroll changes the manifest to a new manifest unique to that computer . The new unique manifest contains the generic manifest (and others if required) as included_manifests keys, allowing us to easily target the whole lab and each individual computer.

### Wait, Doesn't Munki Do This Already?

Munki can target systems based on hostnames or serial numbers. However, each manifest must be created by hand. Munki Enroll allows us to create unique manifests automatically, and to allow them to contain more generic included_manifests for large-scale software management.

## Installation

Munki Enroll requires PHP to be working on the webserver hosting your Munki repository.

Copy the "munki-enroll" folder to the root of your Munki repository (the same directory as pkgs, pkginfo, manifests and catalogs). 

Copy the script "munki_enroll.sh" to the DeployStudio scripts folder.

That's it! Be sure to make note of the full URL path to the enroll.php file.

## Client Configuration

Make sure to include the full URL path to the enroll.php file on your Munki repository.

	SUBMITURL="https://munki/munki-enroll/enroll.php"



## Caveats

Currently, Munki Enroll lacks any kind of error checking. It works perfectly fine in my environment without it. Your mileage may vary.

Your web server must have access to write to your Munki repository. I suggest combining SSL and Basic Authentication (you're doing this anyway, right?) on your Munki repository to help keep nefarious things out. To do this, edit the CURL command in munki_enroll.sh to include the following flag:

	--user "USERNAME:PASSWORD;" 

## License

Munki Enroll, like the contained CFPropertyList project, is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).