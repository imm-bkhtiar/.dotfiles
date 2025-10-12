function record {
  ffmpeg -thread_queue_size 1024 \
    -f x11grab -s 1366x768 -framerate 30 -i :0.0 \
    -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
    -f pulse -i alsa_input.hw_1_0 \
    -filter_complex "[1:a]volume=1[a1];[2:a]volume=7.5[a2];[a1][a2]amix=inputs=2[aout]" \
    -map 0:v -map "[aout]" \
    -c:v h264 -preset ultrafast -b:v 8000k -bufsize 8000k -crf 23 -qp 0 \
    -profile:v main -level 4.0 -pix_fmt yuv420p \
    -c:a aac -b:a 160k -ar 48000 -ac 1 \
    -movflags +faststart \
    output.mp4
}
