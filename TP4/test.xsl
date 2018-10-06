<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" ></xsl:output>

	<!-- ex1 -->
	<!--
	<xsl:template match="/">
		<xsl:for-each select="//*">
			<xsl:value-of select="name()"/>
			<xsl:text>&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
	-->

	<!-- ex2 -->
	<!--
	<xsl:key name="elements" match="*" use="name()"/>
	<xsl:template match="/">
		<xsl:for-each 
		select="//*[generate-id(.)=generate-id(key('elements',name())[1])]">
			<xsl:sort select="name()"/>
			<xsl:for-each select="key('elements', name())">
				<xsl:if test="position()=1">
					<xsl:value-of select="name()"/>
					<xsl:text>&#xa;</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	-->

	<!-- ex3 -->
	<!--
	<xsl:template match="*[not(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'conversionwarning'">
			</xsl:when>
			<xsl:when test="name() = 'template'">
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*[(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'conversionwarning'">
			</xsl:when>
			<xsl:when test="name() = 'template'">
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	-->

	<xsl:template match="*[not(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'conversionwarning'">
			</xsl:when>
			<xsl:when test="name() = 'template'">
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*[(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'section'">
				<xsl:text>&lt;</xsl:text>
				<xsl:value-of select="local-name()"/> 
				<xsl:text>&gt;</xsl:text>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="name() = 'article'">
				<xsl:text>&lt; section &gt;</xsl:text>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
