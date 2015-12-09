.PHONY: all julialang golang swiftlang

all: julialang golang swiftlang
	@echo

julialang:
	@if [ ! -d "julialang" ] ;\
	then \
	  mkdir julialang ;\
	  cd julialang && git clone git@github.com:JuliaLang/julia.git ;\
	fi
	cd julialang/julia && git pull
	cd julialang/julia && make
	@echo

golang:
	@if [ ! -d "golang" ] ;\
	then \
	  mkdir -p golang/go1.4 ;\
	  wget --version | head -n 1 ;\
	  wget https://storage.googleapis.com/golang/go1.4.3.darwin-amd64.tar.gz ;\
	  tar xvzf go1.4.3.darwin-amd64.tar.gz -C golang/go1.4 --strip-components=1 ;\
	  rm go1.4.3.darwin-amd64.tar.gz ;\
	  cd golang && git clone git@github.com:golang/go.git ;\
	fi
	cd golang/go && git pull
	rm -rf golang/go-darwin-amd64-bootstrap
	GOROOT_BOOTSTRAP="$(CURDIR)/golang/go1.4" && cd golang/go/src && GOOS=darwin GOARCH=amd64 ./bootstrap.bash
	@echo

swiftlang:
	@if [ ! -d "swiftlang" ] ;\
	then \
	  mkdir swiftlang ;\
	  git clone git@github.com:apple/swift.git swiftlang/swift ;\
	  git clone git@github.com:apple/swift-llvm.git swiftlang/llvm ;\
	  git clone git@github.com:apple/swift-clang.git swiftlang/clang ;\
	  git clone git@github.com:apple/swift-lldb.git swiftlang/lldb ;\
	  git clone git@github.com:apple/swift-cmark.git swiftlang/cmark ;\
	  git clone git@github.com:apple/swift-llbuild.git swiftlang/llbuild ;\
	  git clone git@github.com:apple/swift-package-manager.git swiftlang/swiftpm ;\
	  git clone git@github.com:apple/swift-corelibs-xctest.git swiftlang/swift-corelibs-xctest;\
	  git clone git@github.com:apple/swift-corelibs-foundation.git swiftlang/swift-corelibs-foundation ;\
	  git clone git@github.com:ninja-build/ninja.git swiftlang/ninja ;\
	fi
	cd swiftlang/swift && git pull
	cd swiftlang/llvm && git pull
	cd swiftlang/clang && git pull
	cd swiftlang/lldb && git pull
	cd swiftlang/cmark && git pull
	cd swiftlang/llbuild && git pull
	cd swiftlang/swiftpm && git pull
	cd swiftlang/swift-corelibs-xctest && git pull
	cd swiftlang/swift-corelibs-foundation && git pull
	cd swiftlang/ninja && git pull
	cd swiftlang/swift && utils/build-script
	#cd swiftlang/swift && utils/build-script -t
	@echo
