<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="*|/">
		<xsl:apply-templates select="*/*"/>
	</xsl:template>

	<xsl:template match="*/*">
		<xsl:copy-of select="name(.)"/>
    		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
</xsl:stylesheet>
