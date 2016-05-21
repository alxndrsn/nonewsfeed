.PHONY: default clean package

VERSION=${shell jq -r .version < src/manifest.json}

default: package

clean:
	rm -rf build/

package: clean
	mkdir build || echo 'WARN ./build/ already exists.'
	cd src && zip -r ../build/nonewsfeed-${VERSION}.xpi *
	open build
