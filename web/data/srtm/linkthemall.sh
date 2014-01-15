
# Planetsplitter looks for N51E0-1.hgt instead N51E001.hgt (any double 0 then 1 digit hgt files actually).
# Dirty trick here is to create as many symlink as needed while keeping the original hgt file for other programs.
# I should modify planetsplitter, but for the sake of testing routino at this stage, this should do the trick


for DLFILE in `ls -1 | grep "[[:alnum:]]*00[0-9].hgt"`
do
        LINK=`echo $DLFILE | sed -e 's/\([[:alnum:]]*\)00\([0-9]\)/\10-\2/g'`
        ln -s $DLFILE $LINK
done

