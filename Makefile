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
	  wget https://storage.googleapis.com/golang/go1.4.3.darwin-amd64.tar.gz ;\
	  tar xvzf go1.4.3.darwin-amd64.tar.gz -C golang/go1.4 --strip-components=1 ;\
	  rm go1.4.3.darwin-amd64.tar.gz ;\
	  cd golang && git clone git@github.com:golang/go.git ;\
	fi
	cd golang/go && git pull
	cd golang/go/src && GOOS=darwin GOARCH=amd64 ./bootstrap.bash
	@echo

swiftlang:
	@if [ ! -d "swiftlang" ] ;\
	then \
	  mkdir swiftlang ;\
	  cd swiftlang && git clone git@github.com:apple/swift.git swift ;\
	  cd swiftlang && git clone git@github.com:apple/swift-llvm.git llvm ;\
	  cd swiftlang && git clone git@github.com:apple/swift-clang.git clang ;\
	  cd swiftlang && git clone git@github.com:apple/swift-lldb.git lldb ;\
	  cd swiftlang && git clone git@github.com:apple/swift-cmark.git cmark ;\
	  cd swiftlang && git clone git@github.com:apple/swift-llbuild.git llbuild ;\
	  cd swiftlang && git clone git@github.com:apple/swift-package-manager.git swiftpm ;\
	  cd swiftlang && git clone git@github.com:apple/swift-corelibs-xctest.git ;\
	  cd swiftlang && git clone git@github.com:apple/swift-corelibs-foundation.git ;\
	  cd swiftlang && git clone git@github.com:ninja-build/ninja.git ;\
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
	cd swiftlang/swift && utils/build-script -t
	@echo
