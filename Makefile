NDK_BUILD:=/home/aaron/share-Aaron/android-ndk-r10e/ndk-build
SRC=firehose_protocol.c  qfirehose.c  sahara_protocol.c usb_linux.c stream_download_protocol.c md5.c usb2tcp.c 

CFLAGS += -Wall -Werror -O1 #-s
CFLAGS1 += -Wall -Wextra -Wwrite-strings -Werror=format-truncation=3 -Wno-unused-parameter -Wno-error=cpp -Wshadow
CFLAGS1 += -Wno-error=deprecated-declarations --std=gnu99
CFLAGS1 += -Werror
LDFLAGS += -lpthread -ldl
ifeq ($(CC),cc)
CC=${CROSS_COMPILE}gcc
endif

linux: clean
	${CC} ${CFLAGS} ${CFLAGS1} ${SRC} -o QFirehose ${LDFLAGS}
	
android: clean
	rm -rf android
	$(NDK_BUILD) V=0 APP_BUILD_SCRIPT=Android.mk NDK_PROJECT_PATH=`pwd` NDK_DEBUG=0 APP_ABI='armeabi-v7a,arm64-v8a'
	rm -rf obj
	mv libs android

clean:
	rm -rf QFirehose obj libs usb2tcp *~
