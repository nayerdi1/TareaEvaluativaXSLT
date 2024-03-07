<?xml version="1.0" encoding="UTF-8"?>
<!--
    Modulo: LMSGI
    UD: 04
    Fecha: 05/03/24
    Autora: Nora Ayerdi Gomez-Cruzado
    Tarea: Tarea evaluativa 2
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>
    <xsl:template match="/club_voleibol">
        
    <html lang="es">
    
        <head>
            <link href="../plantilla/css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>
    
        <body>
            <header>
                <img src= "../plantilla/img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipo.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            
            <main>
                <h1>PARTIDOS</h1>
                <table>
                    <tr>
                        <th>PARTIDO</th>
                        <th>FECHA</th>
                        <th>RESULTADO</th>
                    </tr>
                    
                    <xsl:apply-templates select="partido">
                    <xsl:sort select="fecha" order="descending"/>
                    </xsl:apply-templates>    
                </table>			
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
        
    </xsl:template>
    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <xsl:choose>
                <xsl:when test="equipos/visitante/@puntuacion>equipos/local/@puntuacion">
                    <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>    
                </xsl:when>
                <xsl:otherwise>
                    <td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
                </xsl:otherwise>
            </xsl:choose>
            
        </tr>
    </xsl:template>
</xsl:stylesheet>