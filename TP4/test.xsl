<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="yes"></xsl:output>

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

	<!-- ex4 -->
	<!--
	<xsl:template match="*[not(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'section'">
				<xsl:text>&lt;section&gt;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>&lt;&#47;section&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'article'">
				<xsl:text>&lt;section&gt;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>&lt;&#47;section&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'title'">
				<xsl:text>&lt;title&gt;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>&lt;&#47;title&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'name'">
				<xsl:text>&lt;title&gt;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>&lt;&#47;title&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="local-name()"/> <xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*[(*)]">
		<xsl:choose>
			<xsl:when test="name() = 'section'">
				<xsl:text>&lt;section&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text>&lt;&#47;section&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'article'">
				<xsl:text>&lt;section&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text>&lt;&#47;section&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'title'">
				<xsl:text>&lt;title&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text>&lt;&#47;title&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="name() = 'name'">
				<xsl:text>&lt;title&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text>&lt;&#47;title&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="local-name()"/>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	-->

	<!-- this template is applied by default to all nodes and attributes -->
	<xsl:template match="@*|node()">
	<!-- just copy all my attributes and child nodes, except if there's a better template for some of them -->
	<xsl:copy>
	<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
	</xsl:template>

	<!-- this template is applied to an existing fill attribute -->
	<xsl:template match="svg:path/@fill">
	<!-- produce a fill attribute with content "red" -->
	<xsl:attribute name="fill">red</xsl:attribute>
	</xsl:template>

	<!-- this template is applied to a path node that doesn't have a fill attribute -->
	<xsl:template match="svg:path[not(@fill)]">
	<!-- copy me and my attributes and my subnodes, applying templates as necessary, and add a fill attribute set to red -->
	<xsl:copy>
	<xsl:apply-templates select="@*|node()"/>
	<xsl:attribute name="fill">red</xsl:attribute>
	</xsl:copy>
	</xsl:template>


</xsl:stylesheet>
