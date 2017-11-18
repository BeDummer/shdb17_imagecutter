# script to cut images

cropdir=crops
mkdir -p $cropdir
size=512


for infile in images_rocks/*
do
	outfile="$cropdir"/"${infile%.*}"
	convert "$infile" -crop "$size"x"$size" +repage +adjoin "$outfile"_%03d.png
done

