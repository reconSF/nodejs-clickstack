nodejs_ver =  0.10.21

plugin_name = nodejs-plugin-$(nodejs_ver)
pkg_files = LICENCE setup node.tar.gz
nodejs_src = http://nodejs.org/dist/v$(nodejs_ver)/node-v$(nodejs_ver)-linux-x64.tar.gz
deps = nodejs

nodejs:
	curl -fLo node.tar.gz "$(nodejs_src)"

include plugin.mk


