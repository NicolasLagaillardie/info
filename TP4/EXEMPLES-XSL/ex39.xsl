<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="personnes">
    <xsl:apply-templates select="personne"/>
  </xsl:template>

  <xsl:template match="personne">
    <xsl:apply-templates select="nom"/>
  </xsl:template>

  <xsl:template match="nom">
    <p><xsl:value-of select="normalize-space(prénom)"/><xsl:text> </xsl:text>
    <xsl:value-of select="normalize-space(nom_famille)"/></p>
  </xsl:template>

</xsl:stylesheet>
