VERSION=cosmonium

build-manylinux2014:
	docker run -t --rm=true -v `pwd`:/scripts -v `pwd`/build/:/build/:rw -w /build/ cosmoniumeldee/panda3d-manylinux2014 /scripts/build_manylinux2014.sh

build-ubuntu_20_04:
	docker run -t --rm=true -v `pwd`:/scripts -v `pwd`/build/:/build/:rw -w /build/ cosmoniumeldee/panda3d-ubuntu_20_04 /scripts/build_ubuntu_20_04.sh

clone:
	git clone https://www.github.com/cosmonium/panda3d.git --depth=1 --branch $(VERSION) build

clean:
	sudo rm -rf build/built build/targetroot

.PHONY: build-manylinux2014 clone clean
