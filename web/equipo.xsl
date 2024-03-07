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
                <xsl:variable name="entrenador" select="equipo/entrenador[nombre= 'Julio Velasco']/nombre"/>
                <h1><a href="{equipo/entrenador[nombre=$entrenador]/url}">
                <xsl:value-of select="equipo/entrenador[nombre=$entrenador]/nombre"/></a></h1>
                <article class="equipos">
                    <h4><xsl:value-of select="equipo[entrenador/nombre=$entrenador]/nombre"/></h4>
                    <xsl:apply-templates select="equipo[entrenador/nombre=$entrenador]/jugadores/jugador[@titular='si']"/>
                </article>
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
       
    </xsl:template>
    <xsl:template match="jugador">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:template>
</xsl:stylesheet>