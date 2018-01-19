#!/bin/bash

datestamp() {
	date +%Y%m%d
}


[[ -d tmp ]] && rm -rf tmp; mkdir tmp
[[ -d log ]] && rm -rf log; mkdir log
[[ ! -d output/$1_archive ]] && mkdir -p output

perl perl/fix-braces.pl $1 > $1_tmp.xml

# chance according to XSLT processor
processorlocation="$(locate saxon9he.jar)"

if [ $1 == 'noesselt' ]; then
	java -cp $processorlocation net.sf.saxon.Transform -o:tmp/$1_tmp-1.tex $1_tmp.xml xslt/transform-to-tex.xsl
else
	java -cp $processorlocation net.sf.saxon.Transform -o:tmp/$1_tmp-1.tex $1_tmp.xml xslt/tei2tex.xsl
fi

perl perl/fix-whitespace.pl $1 > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/$1-preprocessing.pl > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/replace-characters.pl $1 > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/sort-bible-register.pl $1 > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/preprocess-margins.pl $1 > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/fix-typearea.pl $1 > tmp/$1_tmp-2.tex
mv tmp/$1_tmp-2.tex tmp/$1_tmp-1.tex

perl perl/define-footnotes.pl $1 > tmp/$1_tmp-2.tex
cat context/header.tex >> tmp/$1_tmp-2.tex
cat tmp/$1_tmp-1.tex >> tmp/$1_tmp-2.tex
cat context/footer.tex >> tmp/$1_tmp-2.tex

cd tmp
context $1_tmp-2.tex > ../log/log_$(datestamp).txt
cd ..

perl perl/define-footnotes.pl $1 > tmp/$1_tmp-2.tex
cat context/header.tex >> tmp/$1_tmp-2.tex

perl perl/postprocess-margins.pl $1 > tmp/$1_tmp-3.tex
perl perl/remove-moved-elements.pl $1 >> tmp/$1_tmp-2.tex
cat context/footer.tex >> tmp/$1_tmp-2.tex

notify-send "Entering second stage"

cd tmp
context $1_tmp-2.tex >> ../log/log_$(datestamp).txt
cd ..

pdftk tmp/$1_tmp-2.pdf cat output $1_$(datestamp).pdf
rm $1_tmp.xml
mv $1_$(datestamp).pdf output

# tidy up output directory: out-of-date PDFs are stored in archive
cd output
pattern="./$1_$(datestamp).pdf"
for file in ./$1_*.pdf; do
	if ! [ $file == $pattern ]; then
		mv $file $1_archive
	fi
done

notify-send "Compilation finished"