<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <TEI>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>
                            <xsl:value-of select="normalize-space(mek2/dc_title/main)"/>
                            <xsl:if test="mek2/dc_title/subtitle != ''">
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                            </xsl:if> : ELTeC edition</title>
                        <!--<title type="sub">
                            <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                        </title>-->
                        <!-- <title type="sub">ELTeC edition</title>-->
                        <author ref="viaf:na">
                                <xsl:for-each select="mek2/dc_creator/FamilyName">
                                    <xsl:value-of select="normalize-space(.)"/>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                                <xsl:for-each select="mek2/dc_creator/GivenName">
                                    <xsl:value-of select="normalize-space(.)"/>
                                </xsl:for-each>
                        </author>
                        <respStmt>
                            <resp>ELTeC conversion</resp>
                            <name>Palkó Gábor<ref target="https://viaf.org/viaf/65989506"/>
                            </name>
                            <name>Fellegi Zsófia</name>
                            <name>Takács Emma</name>
                        </respStmt>
                    </titleStmt>
                    <extent>
                        <measure unit="words">na</measure>
                        <measure unit="pages">na</measure>
                        <measure unit="vols"></measure>
                    </extent>
                    <publicationStmt>
                        <p>Published as part of ELTeC</p>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl type="digitalSource">
                            <title>
                                <xsl:value-of select="normalize-space(mek2/dc_title/main)"/>
                                <xsl:if test="mek2/dc_title/subtitle != ''">
                                    <xsl:text> : </xsl:text>
                                    <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                                </xsl:if>
                            </title>
                            <date>
                                <xsl:for-each select="mek2/dc_date">
                                    <xsl:if
                                        test="contains(./mekevent, 'MEK-be való felvétel időpontja')">
                                        <xsl:value-of select="normalize-space(./date)"/>
                                    </xsl:if>
                                </xsl:for-each>
                            </date>
                            <!-- <title type="sub">
                                    <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                                </title>-->
                            <publisher>Magyar Elektronikus Könyvtárért Egyesület</publisher>
                            <ref>
                                <xsl:attribute name="target">
                                    <xsl:value-of select="normalize-space(mek2/dc_identifier/URL)"/>
                                </xsl:attribute>
                            </ref>

                            <respStmt>
                                <resp>Original Electronic Edition</resp>
                                <xsl:for-each select="mek2/dc_contributor">
                                    <xsl:if test="./role, 'elektronikus szerkesztés'">
                                        <name>
                                            <xsl:for-each select="./FamilyName">
                                                <xsl:value-of select="normalize-space(.)"/>
                                                <xsl:text> </xsl:text>
                                            </xsl:for-each>
                                            <xsl:for-each select="./GivenName">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </name>
                                    </xsl:if>
                                </xsl:for-each>
                            </respStmt>
                            <relatedItem type="source">
                                <bibl type="digitalSource">
                                    <title>
                                        <xsl:value-of select="normalize-space(mek2/dc_title/main)"/>
                                        <xsl:if test="mek2/dc_title/subtitle != ''">
                                            <xsl:text> : </xsl:text>
                                            <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                                        </xsl:if>
                                    </title>
                                    <!--<title type="sub">
                                            <xsl:value-of
                                                select="normalize-space(mek2/dc_title/subtitle)"/>
                                        </title>-->
                                    <date>
                                        <xsl:for-each select="mek2/dc_date">
                                            <xsl:if
                                                test="contains(./mekevent, 'MEK-be való felvétel időpontja')">
                                                <xsl:value-of select="normalize-space(./date)"/>
                                            </xsl:if>
                                        </xsl:for-each>

                                    </date>
                                    <ref>
                                        <xsl:attribute name="target">
                                            <xsl:value-of
                                                select="normalize-space(mek2/dc_source/act_URL)"/>
                                        </xsl:attribute>
                                    </ref>
                                </bibl>

                            </relatedItem>
                            <relatedItem type="source">
                                <bibl type="printSource">
                                    <xsl:choose>
                                        <xsl:when test="contains(mek2/PrintedSource, ';OSZK:')">
                                            <xsl:value-of
                                                select="normalize-space(substring-before(mek2/PrintedSource, ';OSZK:'))"/>
                                            <ref>
                                                <xsl:attribute name="target">
                                                  <xsl:value-of
                                                  select="normalize-space(substring-after(mek2/PrintedSource, 'OSZK:'))"
                                                  />
                                                </xsl:attribute>
                                            </ref>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="normalize-space(mek2/PrintedSource)"/>
                                        </xsl:otherwise>

                                    </xsl:choose>
                                </bibl>
                            </relatedItem>
                        </bibl>
                        <bibl type="firstEdition">
                            <title>
                                <xsl:value-of select="normalize-space(mek2/dc_title/main)"/>
                                <xsl:if test="mek2/dc_title/subtitle != ''">
                                    <xsl:text> : </xsl:text>
                                    <xsl:value-of select="normalize-space(mek2/dc_title/subtitle)"/>
                                </xsl:if>
                            </title>
                            <author>
                                    <xsl:for-each select="mek2/dc_creator/FamilyName">
                                        <xsl:value-of select="normalize-space(.)"/>
                                        <xsl:text> </xsl:text>
                                    </xsl:for-each>
                                    <xsl:for-each select="mek2/dc_creator/GivenName">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:for-each>                                    
                                
                            </author>
                            <date>na</date>
                        </bibl>
                    </sourceDesc>

                </fileDesc>

                <encodingDesc n="eltec-0">
                    <p/>
                </encodingDesc>
                <profileDesc>
                    <langUsage>
                        <language ident="hu"/>
                    </langUsage>
                    <textDesc>
                        <authorGender xmlns="http://distantreading.net/eltec/ns" key=""/>
                        <size xmlns="http://distantreading.net/eltec/ns" key=""/>
                        <canonicity xmlns="http://distantreading.net/eltec/ns" key=""/>
                        <timeSlot xmlns="http://distantreading.net/eltec/ns" key=""/>
                    </textDesc>
                </profileDesc>
                <revisionDesc>
                    <change when="2019-04-18"/>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <div> </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
</xsl:stylesheet>
