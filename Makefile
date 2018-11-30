.PHONY: clean dist

target=genuuid
arch=darwin

$(target)-$(arch): main.go
	GOOS=$(arch) go build -o $(target)-$(arch) main.go

macos: arch=darwin
macos: $(target)-$(arch)

win: arch=windows
win: $(target)-$(arch)

linux: arch=linux
linux: $(target)-$(arch)

clean:
	rm $(target)-*
