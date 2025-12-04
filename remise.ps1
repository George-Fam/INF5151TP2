plantuml -tpng .\diagramme.puml -o .
plantuml -tpng .\diagrammeclass.puml -o .
plantuml -tpng .\diagrammeETPost.puml -o .
plantuml -tpng .\diagrammeETMembre.puml -o .
Start-Sleep -Seconds 2
pandoc tp2.md -o tp2.pdf --pdf-engine=xelatex --variable mainfont="Times New Roman" --variable geometry:margin=1in -H header.tex