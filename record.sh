ffmpeg -thread_queue_size 512 \
-f x11grab -framerate 30 -i :0.0 \
-thread_queue_size 1024 -f pulse -i alsa_output.pci-0000_00_14.2.analog-stereo.monitor \
-thread_queue_size 1024 -f pulse -i alsa_input.pci-0000_00_14.2.analog-stereo \
-filter_complex "[0:v]scale=1280:720:flags=bilinear,format=yuv420p[vout];[1:a]volume=0.3[a1];[2:a]volume=1.2[a2];[a1][a2]amix=inputs=2:normalize=1[aout]" \
-map "[vout]" -map "[aout]" \
-c:v libx264 -preset ultrafast -crf 23 -tune zerolatency \
-r 30 -profile:v main -level:v 4.1 \
-c:a aac -b:a 160k -ar 48000 -ac 1 \
-movflags +faststart \
"$HOME/Videos/output.mp4"
