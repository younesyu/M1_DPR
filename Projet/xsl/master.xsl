<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

<xsl:include href="parcours.xsl" />
<xsl:include href="intervenants.xsl" />
<xsl:include href="unites.xsl" />
<xsl:include href="menu.xsl" />

<xsl:output
   method="html"                   
   version="1.0"                  
   encoding="utf-8"             
   indent="yes"                          
   xml-declaration="yes"                    
   />


  <xsl:template match="/">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
    <head>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<meta charset="utf-8"/>
      <title>Liste des enseignements</title>
    </head>
    <body>
      <xsl:copy-of select="$menu"/>
    </body>
    </html>

	<xsl:call-template name="intervenantsGlobal" /> <!-- creation fichier liste des enseignant -->
	<xsl:call-template name="intervenantsParFichier" /> <!-- creation d'un fichier par enseignant -->
	<xsl:call-template name="unitesGlobal" /> <!-- creation fichier liste des unites -->
	<xsl:call-template name="unitesParFichier" /> <!-- creation d'un fichier par unite -->
	<xsl:call-template name="mesParcours" /> <!-- creation d'un fichier par parcours -->

  </xsl:template>

</xsl:stylesheet>
