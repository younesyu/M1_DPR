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

<xsl:for-each select="//parcours">
    <xsl:document href="./out/parcours/{./nom}.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html><head><meta charset="utf-8"/></head><body>
   <h2>
    Parcours <xsl:value-of select="nom"/>
    </h2>
    <p>
      Responsable : <a href="../intervenants/{id(./responsable/@ref)/nom}.html"><xsl:value-of select="id(./responsable/@ref)/nom"/> </a> <br /> <br />  
      Description : <xsl:value-of select="description"/>   <br /> <br />   
      Débouchés : <liste>
        <ul>
            <xsl:for-each select="./debouche">      
                <li><p><xsl:value-of select="."/></p></li>
            </xsl:for-each>
        </ul>
        </liste>
      Semestres : <liste><ul><xsl:for-each select="./ref-semestre">
                <li><xsl:value-of select="./@ref"/> : </li>
					<liste><ul><ol><xsl:for-each select="id(@ref)/bloc-unite">

               			 <li><a href="../unites/{id(./ref-unite/@ref)/nom}.html"><xsl:value-of select="id(./ref-unite/@ref)/nom"/></a></li>
					
           			 </xsl:for-each>
            			</ol></ul>
        			</liste>
            </xsl:for-each>
            </ul>
        </liste>
    </p>
	</body></html>
    </xsl:document>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
