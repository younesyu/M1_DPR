MAKE = make

dtd : 
	xmllint --valid --noout master.xml

xsd : 
	xmllint --schema master.xsd master.xml --noout

web : 
	mkdir -p www
	java -jar saxon.jar -xsl:xsl/master.xsl master.xml -o:www/index.html

tidy :
	
	./tidy -imq www/*.html
	
	./tidy -imq www/unites/*.html
	
	./tidy -imq www/intervenants/*.html
	
	./tidy -imq www/parcours/*.html
	
xq : 
	java -cp saxon.jar net.sf.saxon.Query "-q:xq.txt" > www/xq.html

clean : 
	rm §r www
	mkdir www

all:	
 
	$(MAKE) dtd

	$(MAKE) xsd
	
	$(MAKE) web

	$(MAKE) tidy
	
	$(MAKE) xq
	