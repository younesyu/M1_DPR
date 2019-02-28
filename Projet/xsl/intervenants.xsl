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

<xsl:template name="intervenantsGlobal" mode="fichierGlobal">

	<xsl:document href="./out/intervenants.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html><head><meta charset="utf-8"/></head><body>
      <h1>Liste des intervenants</h1>
      <xsl:apply-templates select="//intervenant" />
      <xsl:for-each select="//intervenant">      
            <xsl:document href="./intervenants/{./nom}.html">
              <h2>
                <xsl:value-of select="nom"/>
              </h2>
              <p>
                mail : <xsl:value-of select="mail"/>  <br />   
                site : <xsl:value-of select="site"/>   <br /> 
              </p>
            </xsl:document>
        </xsl:for-each>
	</body></html>
    </xsl:document>
</xsl:template>

<xsl:template name="intervenantsParFichier">

      <xsl:for-each select="//intervenant">      
            <xsl:document href="./out/intervenants/{./nom}.html">
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html><head><meta charset="utf-8"/></head><body>
              <h2>
                <xsl:value-of select="nom"/>
              </h2>
              <p>
                mail : <xsl:value-of select="mail"/>  <br />   
                site : <xsl:value-of select="site"/>   <br /> 
              </p>

				<h3> Liste dess UE enseignés : </h3>
				<xsl:variable name="nomProf" select="nom" /> 
				<xsl:variable name="unites" select="//unite[id(./ref-intervenant/@ref)/nom = $nomProf]" />

				<xsl:for-each select="$unites">
					<p><xsl:value-of select="./nom"/></p>

				</xsl:for-each>
				
				</body></html>
            </xsl:document>
        </xsl:for-each>

</xsl:template>

 <xsl:template match="intervenant">
   <h2 id="{@id}">
    <xsl:value-of select="nom"/>
    </h2>
    <p>
      mail : <xsl:value-of select="mail"/>  <br />   
      site : <xsl:value-of select="site"/>   <br /> 
    </p>
  </xsl:template>

</xsl:stylesheet>
