PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
SHAREDIR ?= $(PREFIX)/share/hyprevents

install: hyprcwd
	@install -Dm755 hyprcwd --target-directory "$(BINDIR)"
