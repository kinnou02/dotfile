.DEFAULT_GOAL := build

build: .make.build

.make.build: *.otf
	fc-cache -f -v
	touch $@
