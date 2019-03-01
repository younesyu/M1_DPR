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
		<h1>Site web du master Informatique de l'université d'Aix-Marseille</h1>
      <xsl:copy-of select="$menu"/>
		<p>Le master Informatique a pour vocation la formation de professionnels de l'informatique au niveau bac+5. L'objectif est d'offrir aux étudiants un large spectre de compétences et de savoirs afin de rendre accessibles des emplois de haut niveau dans le monde de l'entreprise, ainsi que dans celui de la recherche, ou dans d'autres organisations. La mention informatique offre une palette de six parcours adaptés à plusieurs secteurs de l'informatique. Les diplômés auront donc accès à une grande diversité de métiers et de carrières. </p>
		
		<br /><br />

		<p>Le master comporte quatres parcours :</p>
		<ul>
		 <xsl:for-each select="//parcours">      
                <li> <p><xsl:value-of select="./nom"/> : </p> </li>
				<ul> <li><p><xsl:value-of select="./description"/> </p></li> <li> <a href="parcours/{nom}.html"><p>En savoir plus ...</p></a></li> </ul>
         </xsl:for-each>
		</ul>

		<p>Liste des intervenants </p>
    </body>
    </html>

	<xsl:call-template name="intervenantsGlobal" /> <!-- creation fichier liste des enseignant -->
	<xsl:call-template name="intervenantsParFichier" /> <!-- creation d'un fichier par enseignant -->
	<xsl:call-template name="unitesGlobal" /> <!-- creation fichier liste des unites -->
	<xsl:call-template name="unitesParFichier" /> <!-- creation d'un fichier par unite -->
	<xsl:call-template name="mesParcours" /> <!-- creation d'un fichier par parcours -->

  </xsl:template>

</xsl:stylesheet>
