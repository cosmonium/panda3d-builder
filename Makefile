VERSION=cosmonium

build-manylinux1:
	docker run -t --rm=true -v `pwd`:/scripts -v `pwd`/build/:/build/:rw -w /build/ cosmoniumeldee/panda3d-manylinux1 /scripts/build_manylinux1.sh

clone:
	git clone https://www.github.com/cosmonium/panda3d.git --depth=1 --branch $(VERSION) build

.PHONY: build-manylinux1 update