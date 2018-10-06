<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output 
        method="html"
    	encoding="UTF-8"
    	doctype-public="-//W3C//DTD HTML 4.01//EN"
   	doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    	indent="yes" ></xsl:output>
	
    <!-- template 
	<xsl:template match="/">
	    <html>
		<head>
		    <title>Test de la fonction sort</title>
		</head>
		<body>
		    <xsl:for-each select="repertoire/personne">
			<xsl:sort  select="nom"></xsl:sort>
			<xsl:sort  select="prenom"></xsl:sort>
			<p><xsl:value-of select="nom" ></xsl:value-of>&#160;<xsl:value-of select="prenom" ></xsl:value-of></p>
		    </xsl:for-each>
		</body>
	    </html>			
	</xsl:template>


	<xsl:template match="/">
	    <html>
		<head>
		    <title>Test de la fonction if</title>
		</head>
		<body>
		    <xsl:for-each select="repertoire/personne">
			<xsl:if test="@sexe = 'masculin'">
			    <p><xsl:value-of select="nom" ></xsl:value-of>&#160;<xsl:value-of select="prenom" ></xsl:value-of></p>
			</xsl:if>			
		    </xsl:for-each>
		</body>
	    </html>			
	</xsl:template>

	<xsl:template match="/">
	    <html>
		<head>
		    <title>Test de la fonction sort</title>
		</head>
		<body>
		    <xsl:for-each select="repertoire/personne">
			<xsl:choose>
			    <xsl:when test="nom = 'DOE'">
				<p>Bonjour John !</p>
			    </xsl:when>
			    <xsl:when test="nom = 'POPPINS'">
				<p>Quel beau sac !</p>
			    </xsl:when>
			    <xsl:otherwise>
				<p>Qui êtes-vous ?</p>
			    </xsl:otherwise>
			</xsl:choose>
		    </xsl:for-each>
		</body>
	    </html>			
	</xsl:template>


	<xsl:template match="/">
	    <html>
		<head>
		    <title>Test de la fonction apply-templates</title>
		</head>
		<body>
		    <xsl:apply-templates select="repertoire/personne[nom='POPPINS']" ></xsl:apply-templates>
		</body>
	    </html>			
	</xsl:template>
		
	<xsl:template match="nom">
	    <p><xsl:value-of select="."></xsl:value-of></p>
	</xsl:template>
		
	<xsl:template match="prenom">
	    <p><xsl:value-of select="."></xsl:value-of></p>
	</xsl:template>

	<xsl:template match="/">
	    <xsl:variable name="couleur" select="'rouge'" ></xsl:variable>
	    
	    <html>
		<head>
		    <title>Test des variables</title>
		</head>
		<body>
		    <p><xsl:value-of select="$couleur" ></xsl:value-of></p>
		</body>
	    </html>			
	</xsl:template>

	<xsl:template match="/">	
	    <html>
		<head>
		    <title>Test des variables</title>
		</head>
		<body>
		    <xsl:for-each select="repertoire/personne">
			<xsl:variable name="sexe" select="@sexe" ></xsl:variable>
			    <xsl:variable name="nom" select="nom" ></xsl:variable>
			    <xsl:variable name="prenom" select="prenom" ></xsl:variable>
				
		    <p><xsl:value-of select="$nom"></xsl:value-of>&#160;<xsl:value-of select="$prenom"></xsl:value-of> : <xsl:value-of select="$sexe"></xsl:value-of></p>		        
		    </xsl:for-each>
		</body>
	    </html>			
	</xsl:template>

	<xsl:template match="/">	
	    <html>
		<head>
		    <title>Test de la fonction call-template</title>
		</head>
		<body>
		    <xsl:call-template name="body" ></xsl:call-template>
		</body>
	    </html>			
	</xsl:template>
		
	<xsl:template name="body">
	    <p>Contenu de la page HTML</p>
	</xsl:template>

	-->

	<xsl:template match="/">	
	    <html>
		<head>
		    <title>Test de la fonction call-template</title>
		</head>
		<body>
		    <xsl:for-each select="repertoire/personne">
			<xsl:call-template name="afficherNom">
			    <xsl:with-param name="nomFamille" select="nom" ></xsl:with-param>
			</xsl:call-template>
		    </xsl:for-each>	    
		</body>
	    </html>			
	</xsl:template>
		
	<xsl:template name="afficherNom">
	    <xsl:param name="nomFamille" ></xsl:param>
	    <xsl:param name="constante">nom de la personne</xsl:param>

	    <p><xsl:value-of select="$constante"></xsl:value-of> : <xsl:value-of select="$nomFamille"></xsl:value-of></p>
	</xsl:template>

</xsl:stylesheet>
