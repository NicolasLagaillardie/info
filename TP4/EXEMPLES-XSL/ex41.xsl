<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="personnes">
    <html>
      <xsl:apply-templates/>
    </html>
  </xsl:template>

  <xsl:template match="nom">
    <p><xsl:value-of select="nom_famille"/>,
      <xsl:value-of select="prénom"/></p>
  </xsl:template>

</xsl:stylesheet>
