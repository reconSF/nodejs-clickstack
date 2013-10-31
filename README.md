## Node.js support on CloudBees.

# ClickStacks and CloudBees
This should work with standard node.js apps packaged up of the zip of the application directory (the dir with the package.json in it) - please do ask any questions on
https://groups.google.com/forum/#!forum/cloudbees-dev as we flesh it out.

If you want the quickest way to get going with node.js on cloudbees - fire up the clickstart:

https://github.com/CloudBees-community/nodejs-clickstart

If this is you, read on: 

Stacks are specified when you deploy an app. 

You can specify the stack to use either by name, or <name> and 
-RPLUGIN.SRC.<name>=<url> - this is called a "remote" plugin and is useful for 
getting the latest version of things.

This stack uses npm to install any required packages, and expects applications 
to be packaged up as a zip. Obvious the best way to do npm install is in a Jenkins job - which is what the ClickStart sets up for you.

# Usage



Get a sample app (eg sampleapp from this repo)
cd sampleapp
zip -r ../app.zip *

bees app:deploy -t nodejs ../app.zip 

That is it.
You can see this running at node.playground.cloudbees.net

# Version

You can select the NodeJS version to be using by passing runtime parameter node.version

-R node.version=0.11.7 

# Notes
It looks for a main.js by default. You can set a config variable of "main_js" to override this.
If a package.json is present, it will install the packages via npm.

# Updating this stack

* fork this repo (maybe)
* update ... what you need to update
* make publish

This will make a zip of the stack, and push it to a repository via your cloudbees credentials. 
You then use the resulting URL in the STACKURL above.

