<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">

    <xsl:output indent="yes" />

    <xsl:template match="/">
        <resultats>
            <xsl:copy-of select="//annee[every $m in (./mois/jour[last()]/numero) satisfies ($m > 28)]/numero" />
        </resultats>
    </xsl:template>

</xsl:stylesheet>
