MAKE = make

dtd : 
	xmllint --valid --noout master.xml

xsd : 
	xmllint --schema master.xsd master.xml --noout

web : 
	mkdir -p www
	java -jar saxon.jar -xsl:xsl/master.xsl master.xml -o:www/index.html
	

tidy :
	
	./tidy -im -asxhtml -indent www/index.html
	
	./tidy -im -asxhtml -indent www/unites/*.html
	
	./tidy -im -asxhtml -indent www/intervenants/*.html
	
	./tidy -im -asxhtml -indent www/parcours/*.html
	

xq : 
	java -cp saxon.jar net.sf.saxon.Query "-q:xq.txt" > www/xq.html

clean : 
	rm www/*.html
	rm www/*/*.html

all:
	
 
	$(MAKE) dtd

 
	$(MAKE) xsd
	
	$(MAKE) web

	$(MAKE) tidy
	

	$(MAKE) xq
	