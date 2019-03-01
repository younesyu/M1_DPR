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

<xsl:key
    	name="unite"
    	match="//unite"
    	use="./ref-intervenant/@ref"
/>	


<xsl:template name="intervenantsGlobal" mode="fichierGlobal">

	<xsl:document href="./intervenants.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
  <head>
    <title>Listes des intervenants</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../xsl/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../xsl/css/descr.css" />
  </head>
  <body>
      <xsl:copy-of select="$menu"/>
      <h1 id="title">Liste des intervenants</h1>
      <div class="container">
        <xsl:apply-templates select="//intervenant" />
        <xsl:for-each select="//intervenant">      
              <xsl:document href="./intervenants/{./nom}.html">
                <div class="intervenant">
                  <h2>
                    <xsl:value-of select="nom"/>
                  </h2>
                  <p>
                    email : <xsl:value-of select="mail"/>  <br />   
                    site : <xsl:value-of select="site"/>   <br /> 
                  </p>
                </div>
              </xsl:document>
          </xsl:for-each>
      </div>
	</body>
  </html>
  </xsl:document>
</xsl:template>

<xsl:template name="intervenantsParFichier">

      <xsl:for-each select="//intervenant">      
            <xsl:document href="intervenants/{./nom}.html">
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html>
      <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="../../xsl/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../../xsl/css/descr.css" />
      </head>
      <body>
          <xsl:copy-of select="$menuLv1"/>
          <h1 id="title">
            <xsl:value-of select="nom"/>
          </h1>
          <div class="info">
            <xsl:value-of select="mail"/>
            <br />   
            <xsl:value-of select="site"/> 
          </div>
          <div class="container">

				<xsl:variable name="nomProf" select="nom" /> 
        <div class="data">
        <h3> Liste des UE enseignés : </h3>
				<!-- <xsl:variable name="unites" select="//unite[id(./ref-intervenant/@ref)/nom = $nomProf]" />

				<xsl:for-each select="$unites">
					<p><a href="../unites/{./nom}.html"><xsl:value-of select="./nom"/></a></p>
				</xsl:for-each> 
			PREMIERE VERSION-->
        <ul>
				<xsl:for-each select="key('unite', @id)">
				      <li><a href="../unites/{./nom}.html"><xsl:value-of select="./nom"/></a></li>
				</xsl:for-each>
        </ul>
        </div>
        <div class="data">
          <h3> Responsable du/des parcours : </h3>
          <xsl:variable name="parcours" select="//parcours[id(./responsable/@ref)/nom = $nomProf]" />
          <ul>
          <xsl:for-each select="$parcours">
            <li><a href="../parcours/{./nom}.html"><xsl:value-of select="./nom"/></a></li>
				  </xsl:for-each>
          </ul>
        </div>
				
          </div>
				</body></html>
            </xsl:document>
        </xsl:for-each>

</xsl:template>

 <xsl:template match="intervenant">
   <div class="intervenant">
    <h2 id="{@id}">
      <xsl:value-of select="nom"/>
      </h2>
      <p>
        email : <xsl:value-of select="mail"/>  <br />   
        site : <xsl:value-of select="site"/>   <br /> 
      </p>
    </div>
  </xsl:template>

</xsl:stylesheet>
