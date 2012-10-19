#
# Crude, but effective

build_dir = ./build


package: clean
	mkdir -p build
	chmod 755 setup
	zip $(build_dir)/node-clickstack.zip setup node-*.tar.gz
	echo "Now upload $(build_dir)/node-clickstack.zip"

clean:
	rm -rf $(build_dir)	

