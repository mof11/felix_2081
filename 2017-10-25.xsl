<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Skyrim</title>
                <link rel="sylesheet" type="text/css" href="2017-10-25.css"/>
            </head>
            <body>
                <h1><xsl:apply-templates select="//title"/></h1>
                <h2><xsl:apply-templates select="//attribution"/></h2>
                <h3><xsl:apply-templates select="//subtitle"/></h3>
                
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="QuestEvent | QuestItem | epihet | character | location | faction">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>  
    </xsl:template>
    
    <xsl:template match="faction">
        <span class="{@ref}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="faction">
        <span class="{//cast/faction[@id=current()/@ref]/@alignment}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="epithet">
        <span class="epithet">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
</xsl:stylesheet>