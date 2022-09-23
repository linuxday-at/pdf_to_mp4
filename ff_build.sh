ffmpeg -f concat -i input.txt -vf scale=1920x1080,setsar=1:1 -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
