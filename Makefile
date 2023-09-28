VERSION = 1
PATCHLEVEL = 0
SUBLEVEL = 0
EXTRAVERSION = beta
FULLVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-$(EXTRAVERSION)

MAKEFILES =
CONFIG = -DVERSION=$(VERSION) -DPATCHLEVEL=$(PATCHLEVEL) -DSUBLEVEL=$(SUBLEVEL) -DEXTRAVERSION=$(EXTRAVERSION)
INCLUDE =

SOURCES =
OUTPUT = bin/main
CC = gcc
CFLAGS = -Wall


include sources.mk
include $(MAKEFILES)

include config.mk

all: init build

init:
	mkdir -p bin

build: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) $(CFLAGS) $(CONFIG) $(INCLUDE) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) $(CONFIG) $(INCLUDE) -c $< -o $@

clean:
	rm -f $(SOURCES:%.c=%.o) $(OUTPUT)

version:
	@echo $(FULLVERSION)