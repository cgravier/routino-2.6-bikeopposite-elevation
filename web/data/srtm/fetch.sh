# fetching elevation infos for eurasia from nasa
# goto to /var/www/routino/web/data/srtm and run this script or set DEST variable below.

URL=http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/Eurasia/
DEST=./

for FILE in `curl $URL 2>&1 | grep -o -E 'href="([^"#]+)"' | cut -d'"' -f2 | grep hgt`
do
	curl $URL/$FILE -o $DEST/$FILE
	unzip $FILE
	rm -rf $FILE
done

