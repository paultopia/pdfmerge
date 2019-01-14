all: build

build:
	swift build -c release -Xswiftc -static-stdlib
