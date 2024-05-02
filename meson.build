project('QFirehose','c')
executable('QFirehose', \
    'firehose_protocol.c', 'qfirehose.c', 'sahara.c', 'usb_linux.c', 'stream_download_protocol.c', 'md5.c', 'usb2tcp.c', \
    dependencies : [ declare_dependency(link_args: '-lpthread') ], \
    c_args : [ '-Wall', '-Wextra', '-Werror' ] \
)
