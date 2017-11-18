# script to cut images

cropdir=crops
mkdir -p $cropdir
size=512


for infile in *
do
	outfile="$cropdir"/"${infile%.*}"
	convert $infile -crop "$size"x"$size" +repage +adjoin "$outfile"_%03d.jpg
done

for cropfile in "$cropdir"/*.jpg
	do
		width=`identify -format '%w' $cropfile`
		height=`identify -format '%h' $cropfile`
		if ["$width" -ne "$height"]
			then rm $cropfile
		fi
	done
