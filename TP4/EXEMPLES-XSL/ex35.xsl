<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="personne">
    <p><xsl:value-of select="normalize-space(nom)"/></p>
  </xsl:template>
</xsl:stylesheet>
