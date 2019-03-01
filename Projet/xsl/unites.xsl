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

<xsl:document href="./unite.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
  <head>
  <meta charset="utf-8"/>
  </head>
  <body>
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
	</body>
  </html>
      </xsl:document>

</xsl:template>

<xsl:template name="unitesParFichier">

        <xsl:for-each select="//unite">      
            <xsl:document href="./unites/{./nom}.html">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
    <head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../../css/descr.css" />
    </head>
    <body>
      <h2 id="title">
        <xsl:value-of select="nom"/>
      </h2>
      <div class="info">
        <xsl:variable name="idUe" select="@id" /> 
      <xsl:value-of select="$idUe"/>
      </div>
      <div class="container">
        <div class="data">
        <h3>Crédits : </h3> <xsl:value-of select="credit"/>  <br />   
        <br />
        <h3>Résumé : </h3> <xsl:value-of select="resume"/>   <br />   
        <br />
        <h3>Lieu : </h3> <xsl:value-of select="lieu"/>  <br />  
        <br />
        <h3>Intervenants : </h3> <xsl:apply-templates select="ref-intervenant" /> 
        <br />
        </div>
        <div class="data">
        <p> Cette UE apparait dans le ou les parcours suivant :</p>
        <xsl:variable name="idUe" select="@id" /> 
        <xsl:variable name="idSemestre" select="//ref-unite[@ref = $idUe ]/../../@id" />
        <xsl:variable name="parcours" select="//ref-semestre[./@ref = $idSemestre ]/.." />
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
