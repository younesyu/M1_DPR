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
	<html><head><meta charset="utf-8"/></head><body>
      <h1>Liste des intervenants</h1>
      <xsl:apply-templates select="//intervenant" />
	</body></html>
    </xsl:document>
</xsl:template>

<xsl:template name="intervenantsParFichier">

      <xsl:for-each select="//intervenant">      
            <xsl:document href="intervenants/{./nom}.html">
			<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
			<html><head><meta charset="utf-8"/></head><body>
              <h2>
                <xsl:value-of select="nom"/>
              </h2>
              <p>
                mail : <xsl:value-of select="mail"/>  <br />   
                site : <xsl:value-of select="site"/>   <br /> 
              </p>

				<xsl:variable name="nomProf" select="nom" /> 
				<h3> Liste des UE enseignés : </h3>
				<!-- <xsl:variable name="unites" select="//unite[id(./ref-intervenant/@ref)/nom = $nomProf]" />

				<xsl:for-each select="$unites">
					<p><a href="../unites/{./nom}.html"><xsl:value-of select="./nom"/></a></p>
				</xsl:for-each> 
			PREMIERE VERSION-->

				<xsl:for-each select="key('unite', @id)">
				      <p><a href="../unites/{./nom}.html"><xsl:value-of select="./nom"/></a></p>
				</xsl:for-each>
				<h3> Responsable du ou des parcour(s) : </h3>
				<xsl:variable name="parcours" select="//parcours[id(./responsable/@ref)/nom = $nomProf]" />

				<xsl:for-each select="$parcours">
					<p><a href="../parcours/{./nom}.html"><xsl:value-of select="./nom"/></a></p>

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
      mmaaaa smail : <xsl:value-of select="mail"/>  <br />   
      site : <xsl:value-of select="site"/>   <br /> 
    </p>
  </xsl:template>

</xsl:stylesheet>
