<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

<xsl:output
   method="xhtml"                                   
   encoding="utf-8"             
   indent="yes"                                            
   />

<xsl:variable name="menu">
   <ul id="ulMenu">
  	<li id="liMenu"><a href="index.html">Accueil</a></li>
  	<li id="liMenu"><a href="intervenants.html">Intervenants</a></li>
  	<li id="liMenu"><a href="unites.html">Enseignements</a></li>
	</ul>
</xsl:variable>

<xsl:variable name="menuLv1">
   <ul id="ulMenu">
  	<li id="liMenu"><a href="../index.html">Accueil</a></li>
  	<li id="liMenu"><a href="../intervenants.html">Intervenants</a></li>
  	<li id="liMenu"><a href="../unites.html">Enseignements</a></li>
	</ul>
</xsl:variable>

</xsl:stylesheet>
