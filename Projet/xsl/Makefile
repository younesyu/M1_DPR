MAKE = make

dtd : 
	xmllint --valid --noout master.xml

xsd : 
	xmllint --schema master.xsd master.xml --noout

tidy :
	
	tidy -e www/index.html
	
	tidy -e www/ues/*.html
	
	tidy -e www/intervenants/*.html
	
	tidy -e www/parcours/*.html

web : 
	mkdir -p www
	java -jar saxon9he.jar -xsl:xsl/master.xsl master.xml
	

xq : 
	java -cp saxon9he.jar net.sf.saxon.Query "-q:xq.txt" > www/xq.html

clean : 
	rm www/*.html
	rm www/*/*.html

all:
	
 
	$(MAKE) dtd

 
	$(MAKE) xsd
	

	$(MAKE) tidy
	

	$(MAKE) web
	

	$(MAKE) xq
	