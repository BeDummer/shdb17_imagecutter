# resize and crop image
size=256
infile=$1
outfile=${infile%.*}_$size.png

convert -resize x$size $infile $outfile
width=`identify -format '%w' "$outfile"`
shift=$((width - size))
shift=$((shift / 2))
convert -crop "$size"x$size+$shift+0 +repage -size "$size"x$size $outfile $outfile

python edge_detection.py $outfile
