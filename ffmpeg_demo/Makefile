FDKAAC_VERSION=0.1.6
FDKAAC = fdk-aac-$(FDKAAC_VERSION)
X264 = x264-snapshot-20161231-2245
FFMPEG = ffmpeg-3.0.7
TARGET_OS = alpine

OUTDIR = $(abspath .)
LDFLAGS = -L$(OUTDIR)/lib
.PHONY = all clean

all: portable-$(FFMPEG).tar.gz.md5

#
# fdk-aac
#

$(FDKAAC).tar.gz:
	wget -q https://github.com/mstorsjo/fdk-aac/archive/v$(FDKAAC_VERSION).tar.gz -O $(@F)

lib/libfdk-aac.a: $(FDKAAC).tar.gz
	tar xvf $(<F)
	cd $(FDKAAC) && \
	autoreconf -fiv && \
	./configure --prefix=$(OUTDIR) --disable-shared && \
	$(MAKE) && \
	$(MAKE) install


#
# x264
#

$(X264).tar.bz2:
	wget -q http://download.videolan.org/pub/x264/snapshots/$(X264).tar.bz2
	
lib/libx264.a: $(X264).tar.bz2
	tar xvf $(<F)
	cd $(X264) && \
	./configure --prefix=$(OUTDIR) --enable-static --enable-pic --disable-shared && \
	$(MAKE) && \
	$(MAKE) install

#
# FFmpeg
#

$(FFMPEG).tar.bz2:
	wget -q https://www.ffmpeg.org/releases/$(FFMPEG).tar.bz2

$(FFMPEG): $(FFMPEG).tar.bz2
	tar xvf $(<F)

bin/ffmpeg: $(FFMPEG) \
		lib/libfdk-aac.a \
		lib/libx264.a
	cd $(FFMPEG) && \
		export PATH=$(OUTDIR)/bin:$$PATH && \
		export PKG_CONFIG_PATH=$(OUTDIR)/lib/pkgconfig && \
		./configure --prefix=$(OUTDIR) \
		--extra-cflags="-I$(OUTDIR)/include" \
		--pkg-config-flags="--static" \
		--enable-libfdk-aac \
		--enable-libx264 \
		--enable-avfilter \
		--enable-zlib \
		--enable-gpl \
		--enable-version3 \
		--enable-nonfree \
		--enable-pthreads \
		--disable-debug \
		--enable-runtime-cpudetect \
		--disable-ffserver \
		--disable-doc && \
		$(MAKE) && \
		$(MAKE) install

#
# Package
#
bin:
	mkdir -p $@

bin/manifest.txt: bin
	printf "$(FDKAAC)\n$(OPUS)\n$(X264)\n$(FFMPEG)\n$(TARGET_OS)\n" > $@

portable-$(FFMPEG).tar.gz: bin/ffmpeg bin/manifest.txt
	tar czvf $(@F) -C bin ffmpeg ffprobe manifest.txt

portable-$(FFMPEG).tar.gz.md5: portable-$(FFMPEG).tar.gz
	md5sum $< > $@

clean:
	rm -f portable-$(FFMPEG).tar.gz portable-$(FFMPEG).tar.gz.md5
	rm -f manifest.txt
	rm -rf portable-$(FFMPEG)
	rm -rf $(OUTDIR)/bin/*
	rm -rf $(OUTDIR)/lib/*
	rm -rf $(FDKAAC) $(X264) $(FFMPEG)
