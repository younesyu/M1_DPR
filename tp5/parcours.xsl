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



<xsl:template name="mesParcours">
<h1>typf</h1>
<xsl:for-each select="//parcours">
    <xsl:document href="./out/parcours/nom.html">
   <h2>
    Parcours <xsl:value-of select="nom"/>
    </h2>
    <p>
      Responsable : <xsl:value-of select="responsable"/>  <br />   
      Description : <xsl:value-of select="description"/>   <br />   
      Débouchés : <liste>
        <ul>
            <xsl:for-each select="./debouche">      
                <li><p>><xsl:value-of select="."/></p></li>
            </xsl:for-each>
        </ul>
        </liste>
      Semestres : <liste><ul><xsl:for-each select="./ref-semestre">
                <li><p><xsl:value-of select="./@ref"/></p></li>
            </xsl:for-each>
            </ul>
        </liste>
    </p>
    </xsl:document>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>