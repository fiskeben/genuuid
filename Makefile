.PHONY: clean dist

target=genuuid
arch=darwin
version=$(shell git describe --tags --always)
extension=

$(target)-$(arch)-$(version)$(extension): main.go
	GOOS=$(arch) go build -o $(target)-$(arch)-$(version)$(extension) main.go

macos: arch=darwin
macos: $(target)-$(arch)-$(version)$(extension)

win: arch=windows
win: extension=.exe
win: $(target)-$(arch)-$(version)$(extension)

linux: arch=linux
linux: $(target)-$(arch)-$(version)$(extension)

clean:
	rm $(target)-*
