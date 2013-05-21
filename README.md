## Node.js support on CloudBees.

# ClickStacks and CloudBees
This should work with standard node.js apps packaged up of the zip of the application directory (the dir with the package.json in it) - please do ask any questions on
https://groups.google.com/forum/#!forum/cloudbees-dev as we flesh it out.

This repo is for people who want to extend/enhance support on CloudBees. Users of 
node.js apps can simply fire up the node.js clickstart and be happy.

If this is you, read on: 

ClickStarts are used by specifying the application type when you deploy an app. 
You can specify the stack to use either by name, or <name> and 
-RPLUGIN.SRC.<name>=<url> - this is called a "remote" plugin and is useful for 
getting the latest version of things.

This stack uses npm to install any required packages, and expects applications 
to be packaged up as a zip. 

# Usage

(assuming you aren't using the ClickStart here: https://github.com/CloudBees-community/nodejs-clickstart)

Get a sample app (eg sampleapp from this repo)
cd sampleapp
zip -r ../app.zip *

bees app:deploy -t nodejs ../app.zip 

That is it - you can also use your own ClickStack url, or a specific nodejs version via appending:

-R PLUGIN.SRC.node=https://s3.amazonaws.com/clickstacks/admin/nodejs-plugin-0.10.5.zip

STACKURL can be found (use the latest) from https://developer.cloudbees.com/bin/view/RUN/ClickStack

You can see this running at node.playground.cloudbees.net

# Notes
It looks for a main.js by default. You can set a config variable of "main_js" to override this.
If a package.json is present, it will install the packages via npm.

# Updating this stack

For example: update the node.js binary in this repo.

* fork this repo (maybe)
* update the node version in Makefile
* make publish

This will make a zip of the stack, and push it to a repository via your cloudbees credentials. 
You then use the resulting URL in the STACKURL above.

