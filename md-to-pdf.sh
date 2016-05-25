for i in *.md; do
    a=${i%.*}
    pandoc -s -S --toc -c github-markdown.css $i -o $a.html

    python html-to-pdf.py $a.html
done

for i in *.html; do
  cp $i html/$i
  rm $i
done

rm html/README.html
