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

<xsl:template name="unitesGlobal">

<xsl:document href="./out/unite.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html><head><meta charset="utf-8"/></head><body>
        <h1>Liste des unités d'enseignements</h1>
        <xsl:apply-templates select="//unite" />
        <xsl:for-each select="//unite">      
            <xsl:document href="./unites/{./nom}.html">
              <h2>
                <xsl:value-of select="nom"/>
              </h2>
              <p>
              crédits : <xsl:value-of select="credit"/>  <br />   
              résumé : <xsl:value-of select="resume"/>   <br />   
              lieu : <xsl:value-of select="lieu"/>  <br />  
              intervenants : <xsl:apply-templates select="ref-intervenant" /> 
            </p>
            </xsl:document>
        </xsl:for-each>
	</body></html>
      </xsl:document>

</xsl:template>

<xsl:template name="unitesParFichier">

        <xsl:for-each select="//unite">      
            <xsl:document href="./out/unites/{./nom}.html">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html><head><meta charset="utf-8"/></head><body>
              <h2>
                <xsl:value-of select="nom"/>
              </h2>
              <p>
              crédits : <xsl:value-of select="credit"/>  <br />   
              résumé : <xsl:value-of select="resume"/>   <br />   
              lieu : <xsl:value-of select="lieu"/>  <br />  
              intervenants : <xsl:apply-templates select="ref-intervenant" /> 
            </p>
		</body></html>
            </xsl:document>
        </xsl:for-each>

</xsl:template>

<xsl:template match="unite">
   <h2>
    <xsl:value-of select="nom"/>
    </h2>
    <p>
      crédits : <xsl:value-of select="credit"/>  <br />   
      résumé : <xsl:value-of select="resume"/>   <br />   
      lieu : <xsl:value-of select="lieu"/>  <br />  
      intervenants : <xsl:apply-templates select="ref-intervenant" /> 
    </p>
    <xsl:apply-templates select="./plan" /> 
  </xsl:template>

  <xsl:template match="ref-intervenant">
   <!-- <a href="intervenant.html#{@ref}"><xsl:value-of select="//intervenant[@id = current()/@ref]/nom"/> </a>&#xA0; -->
   <a href="../intervenants/{id(@ref)/nom}.html"><xsl:value-of select="id(@ref)/nom"/> </a>&#xA0;
  </xsl:template>

</xsl:stylesheet>