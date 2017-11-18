# script to cut images

cropdir=crops/images_rocks
size=512



for cropfile in $cropdir/*.png
	do
		width=`identify -format '%w' "$cropfile"`
		height=`identify -format '%h' "$cropfile"`
		if [ "$width" != "$height" ];
        then
            rm "$cropfile"
		fi
	done
