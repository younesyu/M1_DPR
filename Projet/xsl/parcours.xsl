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
    <xsl:document href="./parcours/{./nom}.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="../../css/descr.css" />
    </head>
    <body>
    <h2 id="title">
    Parcours <xsl:value-of select="nom"/>
    </h2>
    <div class="container">
        <div class="data">
        <h3>Responsable : </h3> <a href="../intervenants/{id(./responsable/@ref)/nom}.html"><xsl:value-of select="id(./responsable/@ref)/nom"/> </a> <br /> <br />  
        </div>
        <div class="data">
        <h3>Description :</h3>
            <br /><br />
            <xsl:value-of select="description"/>   <br /> <br />   
        </div>
        <div class="data">
        <h3>Débouchés :</h3>
            <liste>
            <ul>
                <xsl:for-each select="./debouche">      
                    <li><p><xsl:copy-of select="."/></p></li>
                </xsl:for-each>
            </ul>
            </liste>
        </div>
        <div class="data">
        <h3>Semestres :</h3> <liste><ul><xsl:for-each select="./ref-semestre">
                    <li><xsl:value-of select="./@ref"/> : </li>
                        <liste><ul><ol><xsl:for-each select="id(@ref)/bloc-unite">
                            <li><a href="../unites/{id(./ref-unite/@ref)/nom}.html"><xsl:value-of select="id(./ref-unite/@ref)/nom"/></a></li>
                        </xsl:for-each>
                            </ol></ul>
                        </liste>
                </xsl:for-each>
                </ul>
            </liste>
        </div>
        </div>
	</body>
    </html>
    </xsl:document>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
