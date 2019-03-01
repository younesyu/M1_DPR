<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:output
   method="html"                   
   version="1.0"                  
   encoding="utf-8"             
   indent="yes"                          
   xml-declaration="yes"                    
   />

<xsl:variable name="menu">
   <ul id="ulMenu">
  	<li id="liMenu"><a class="active" href="index.html">Accueil</a></li>
  	<li id="liMenu"><a href="intervenants.html">Liste Intervenant</a></li>
  	<li id="liMenu"><a href="unites.html">Liste des UE</a></li>
	</ul>
</xsl:variable>

</xsl:stylesheet>
