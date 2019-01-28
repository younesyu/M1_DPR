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

  <xsl:template match="/">
    <html>
    <head>
      <title>Liste des enseignements</title>
    </head>
    <body>
      <h1>Liste des unités d'enseignements</h1>
      <xsl:apply-templates select="//unite" />
      <h1>Liste des intervenants</h1>
      <xsl:apply-templates select="//intervenant" />
    </body>
    </html>
  </xsl:template>

  <xsl:template match="unite">
   <h2>
    <xsl:value-of select="nom"/>
    </h2>
    <p>
      crédits : <xsl:value-of select="credit"/>  <br />   
      résumé : <xsl:value-of select="resume"/>   <br />   
      lieu : <xsl:value-of select="lieu"/>  <br />  
    </p>
    <xsl:apply-templates select="./plan" /> 
  </xsl:template>

  <xsl:template match="plan">
     Plan : <liste>
       <ul>
       <xsl:for-each select="./chapitre">      
        <li>
        <p><xsl:value-of select="."/></p>
        </li>
    </xsl:for-each>
      </ul>
    </liste>

  </xsl:template>

  <xsl:template match="intervenant">
   <h2>
    <xsl:value-of select="nom"/>
    </h2>
    <p id="{@id}" >
      mail : <xsl:value-of select="mail"/>  <br />   
      site : <xsl:value-of select="site"/>   <br /> 
    </p>
  </xsl:template>

</xsl:stylesheet>