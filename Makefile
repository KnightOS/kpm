include .knightos/variables.make

INIT=/bin/kpm-gui

ALL_TARGETS:=$(BIN)kpm-gui $(LIB)kpm $(INCLUDE)kpm.inc

$(LIB)kpm: libkpm/kpm.asm
	mkdir -p $(LIB)
	$(AS) $(ASFLAGS) --listing $(OUT)libkpm.list libkpm/kpm.asm $(LIB)kpm

$(INCLUDE)kpm.inc:
	mkdir -p $(INCLUDE)
	cp libkpm/kpm.inc $(INCLUDE)

$(BIN)kpm-gui: kpm-gui/*.asm $(LIB)kpm
	mkdir -p $(BIN)
	$(AS) $(ASFLAGS) --listing $(OUT)main.list kpm-gui/main.asm $(BIN)kpm-gui

include .knightos/sdk.make
