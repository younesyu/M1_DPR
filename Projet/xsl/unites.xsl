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

<xsl:document href="./unites.html">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
  <head>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="../xsl/css/main.css" />
  <link rel="stylesheet" type="text/css" href="../xsl/css/style.css" />
  </head>
  <body>
    <xsl:copy-of select="$menu"/>
    <h1 id="title">Liste des unités d'enseignements</h1>
    <div class="container">
    <xsl:apply-templates select="//unite" />
    <xsl:for-each select="//unite">      
        <xsl:document href="./unites/{./nom}.html">
          <div class="unite">
          <h2>
            <xsl:value-of select="nom"/>
          </h2>
          <p>
          crédits : <xsl:value-of select="credit"/>  <br />   
          résumé : <xsl:value-of select="resume"/>   <br />   
          lieu : <xsl:value-of select="lieu"/>  <br />  
          intervenants : <xsl:apply-templates select="ref-intervenant" /> 
        </p>
        </div>
        </xsl:document>
        </xsl:for-each>
        </div>
	</body></html>
      </xsl:document>

</xsl:template>

<xsl:template name="unitesParFichier">

        <xsl:for-each select="//unite">      
            <xsl:document href="./unites/{./nom}.html">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
    <head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../../xsl/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../xsl/css/main.css" />
    </head>
    <body>
      <xsl:copy-of select="$menuLv1"/>
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
        <h3>Intervenants : </h3> 
        <xsl:for-each select="./ref-intervenant">
                 <a href="../intervenants/{id(./@ref)/nom}.html"><xsl:value-of select="id(./@ref)/nom"/> </a>;
         </xsl:for-each>
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
   <div class="unite">
   <h2>
    <xsl:value-of select="nom"/>
    </h2>
    <p>
      <h3>Crédits : </h3> <xsl:value-of select="credit"/>  <br />   
      <br />
      <h3>Résumé : </h3> <xsl:value-of select="resume"/>   <br />   
      <br />
      <h3>Lieu : </h3> <xsl:value-of select="lieu"/>  <br />  
      <br />
      <h3>Intervenants : </h3> <xsl:apply-templates select="ref-intervenant" /> 
      <br />
    </p>
    </div>
    <xsl:apply-templates select="./plan" /> 
  </xsl:template>

  <xsl:template match="ref-intervenant">
   <a href="./intervenants/{id(@ref)/nom}.html"><xsl:value-of select="id(@ref)/nom"/> </a>&#xA0;
  </xsl:template>

</xsl:stylesheet>
