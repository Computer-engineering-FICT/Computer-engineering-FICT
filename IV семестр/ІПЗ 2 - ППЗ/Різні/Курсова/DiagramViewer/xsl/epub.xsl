<?xml version ="1.0" encoding ="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#default" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/epub/docbook.xsl"></xsl:import>
	
  <xsl:include href="http://dbdoclet.org/xsl/html/synopsis.xsl"></xsl:include>
  <xsl:include href="http://dbdoclet.org/xsl/html/themes/color.xsl"></xsl:include>

  <xsl:param name="highlight.xslthl.config">file:/c:/Program%20Files/DocBook%20Doclet/docbook/xsl/highlighting/xslthl-config.xml</xsl:param>
<xsl:param name="highlight.default.language"></xsl:param>
<xsl:param name="highlight.source">0</xsl:param>
<xsl:param name="ebnf.table.bgcolor">#f5dcb3</xsl:param>
<xsl:param name="ebnf.table.border">0</xsl:param>
<xsl:param name="ebnf.statement.terminator"></xsl:param>
<xsl:param name="ebnf.assignment"></xsl:param>
<xsl:param name="callout.list.table">0</xsl:param>
<xsl:param name="callout.graphics.path">images/callouts/</xsl:param>
<xsl:param name="callout.graphics.extension">.png</xsl:param>
<xsl:param name="callout.graphics.number.limit">15</xsl:param>
<xsl:param name="callout.defaultcolumn">60</xsl:param>
<xsl:param name="callout.unicode.start-character"></xsl:param>
<xsl:param name="callout.unicode.number.limit">10</xsl:param>
<xsl:param name="callout.unicode">0</xsl:param>
<xsl:param name="callouts.extension">0</xsl:param>
<xsl:param name="callout.graphics">0</xsl:param>
<xsl:param name="admon.style"></xsl:param>
<xsl:param name="admon.graphics.path">images/</xsl:param>
<xsl:param name="admon.graphics.extension">.png</xsl:param>
<xsl:param name="admon.textlabel">0</xsl:param>
<xsl:param name="admon.graphics">0</xsl:param>
<xsl:param name="ulink.target">_top</xsl:param>
<xsl:param name="xref.with.number.and.title">0</xsl:param>
<xsl:param name="use.role.as.xrefstyle">0</xsl:param>
<xsl:param name="collect.xref.targets">no</xsl:param>
<xsl:param name="xref.title-page.separator"></xsl:param>
<xsl:param name="xref.label-title.separator">: </xsl:param>
<xsl:param name="xref.label-page.separator"></xsl:param>
<xsl:param name="insert.xref.page.number">no</xsl:param>
<xsl:param name="olink.base.uri"></xsl:param>
<xsl:param name="targets.filename">target.db</xsl:param>
<xsl:param name="target.database.document">olinkdb.xml</xsl:param>
<xsl:param name="table.borders.with.css">0</xsl:param>
<xsl:param name="table.cell.border.color">#000000</xsl:param>
<xsl:param name="table.cell.border.style">solid</xsl:param>
<xsl:param name="table.cell.border.thickness">0.50pt</xsl:param>
<xsl:param name="table.frame.border.color">#000000</xsl:param>
<xsl:param name="table.frame.border.style">solid</xsl:param>
<xsl:param name="table.frame.border.thickness">0.50pt</xsl:param>
<xsl:param name="default.table.frame">all</xsl:param>
<xsl:param name="nominal.table.width">6.00in</xsl:param>
<xsl:param name="tablecolumns.extension">0</xsl:param>
<xsl:param name="variablelist.as.table">0</xsl:param>
<xsl:param name="variablelist.term.separator">, </xsl:param>
<xsl:param name="variablelist.term.break.after">0</xsl:param>
<xsl:param name="segmentedlist.as.table">0</xsl:param>
<xsl:param name="graphic.default.extension"></xsl:param>
<xsl:param name="preferred.mediaobject.role"></xsl:param>
<xsl:param name="use.role.for.mediaobject">0</xsl:param>
<xsl:param name="keep.relative.image.uris">0</xsl:param>
<xsl:param name="ignore.image.scaling">0</xsl:param>
<xsl:param name="use.id.as.filename">0</xsl:param>
<xsl:param name="chunk.first.sections">0</xsl:param>
<xsl:param name="chunk.section.depth">2</xsl:param>
<xsl:param name="html.stylesheet"></xsl:param>
<xsl:param name="img.src.path"></xsl:param>
<xsl:param name="rootid"></xsl:param>
<xsl:param name="base.dir">./epub/</xsl:param>
  <xsl:param name="manifest.in.base.dir" select="1"></xsl:param> 
  <xsl:param name="epub.oebps.dir" select="$base.dir"></xsl:param>
  <xsl:param name="epub.opf.filename" select="concat($epub.oebps.dir, 'content.opf')"></xsl:param> 
  <xsl:param name="epub.metainf.dir" select="concat($base.dir, 'META-INF/')"></xsl:param> 
</xsl:stylesheet>
