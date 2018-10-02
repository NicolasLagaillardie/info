<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="personne">
    <p>Une personne<!-- INTERDIT: une __donnée textuelle littérale__ avec une balise ouvrante -->
      <!-- ce n'est plus du XML ! -->
  </xsl:template>
</xsl:stylesheet>
