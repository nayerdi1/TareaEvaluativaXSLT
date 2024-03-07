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
            
            <main class="principal">   
                    <xsl:apply-templates select="tienda/articulo"/>     
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>        
    </xsl:template>
    <xsl:template match="articulo">
        <article>
            <section>
                <img class="articulo" src="{@foto}"/>			
            </section>
            <section>
                <h2><xsl:value-of select="precio"/></h2>
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <ul>
                    <xsl:apply-templates select="comentarios"/>
                </ul>
            </section>
        </article>
    </xsl:template>
    <xsl:template match="comentarios">
        <li><xsl:value-of select= "@fecha"/>: <xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>