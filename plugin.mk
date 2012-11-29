publish_key = $(shell cat ~/.bees/bees.config | grep key | awk -F '=' ' { print $$2 }' )
publish_secret = $(shell cat ~/.bees/bees.config | grep secret | awk -F '=' ' { print $$2 }' )=


all: pkg

clean: clean-deps clean-pkg

deps: $(deps)

clean-deps:
	@if [ ! "$(deps)" = "" ]; then \
	  echo "rm -rf $(deps)"; \
	  rm -rf $(deps); \
	fi

pkg: pkg_files-var plugin_name-var deps clean-pkg
	mkdir pkg
	cp -a $(pkg_files) pkg
	cd pkg; zip -r ../$(plugin_name).zip *

clean-pkg: plugin_name-var
	rm -rf pkg
	rm -f $(plugin_name).zip

publish: plugin_name-var publish_key-var publish_secret-var pkg republish

republish:
	curl -F apikey=$(publish_key) -F apisecret=$(publish_secret) -F file=@$(plugin_name).zip https://clickstack-repository.cloudbees.com/upload
	


define check-val
  @if [ "$1" = "" ]; then \
    echo "Missing required Makefile variable $2"; \
    exit 1; \
  fi
endef

pkg_files-var:
	$(call check-val,$(pkg_files),pkg_files)

publish_key-var:
	$(call check-val,$(publish_key),publish_key)

publish_secret-var:
	$(call check-val,$(publish_secret),publish_secret)


plugin_name-var:
	$(call check-val,$(plugin_name),plugin_name)

publish_url-var:
	$(call check-val,$(publish_url),publish_url)
