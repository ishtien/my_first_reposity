<!-- $Id: summary.xsl 1958 2009-11-16 03:28:50Z boudreat $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
<xsl:decimal-format decimal-separator="." grouping-separator="," />
<xsl:template match="contestStandings">
<html>
<head>
	<title>
	計分板 - <xsl:value-of select="/contestStandings/standingsHeader/@title"/>
	</title>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="refresh" content="10" />
	<style type="text/css">
		html, body{
			margin: 0 auto;
		}
		div#container{
			text-align: center;
			margin: 0 auto;
		}
		table{
			border: 1px solid;
			margin: 0 auto;
		}
		tr.teamStanding:nth-child(even){background: #CFF;}
		tr.teamStanding:nth-child(odd){background: #FFC;}
		td{text-align: center;}
	</style>
</head>
<body>
	<div id="container">
		
		<h1>NCKU ACM Winter Camp</h1>
		<h2>&nbsp;</h2>
		<table>
			<xsl:call-template name="rankRow"/>
<!--			<xsl:call-template name="colorRow"/> -->
			<xsl:call-template name="teamStanding"/>
			<xsl:call-template name="rankRow"/>
<!--			<xsl:call-template name="colorRow"/> -->
			<xsl:call-template name="summary"/>
		</table>

		<p>
		最後更新時間：
		<xsl:value-of select="/contestStandings/standingsHeader/@currentDate"/>
		</p>

	</div>
</body>
</html>
</xsl:template>

<xsl:template name="summary">
	<xsl:for-each select="standingsHeader">
		<tr>
			<td colspan="4">
			總上傳數/最快解出時間/總解題數</td>
			<xsl:call-template name="problemsummary"/>
			<td><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@totalSolved"/></td>
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template name="problemsummary">
	<xsl:for-each select="/contestStandings/standingsHeader/problem">
<!-- <problemsummary attempts="246" bestSolutionTime="25" id="1" lastsolutionTime="283" numberSolved="81" title="A+ Consanguine Calculations"/> -->
		<td>
		<xsl:value-of select="@attempts"/>/<xsl:if test="@numberSolved &lt; '1'">--</xsl:if>
		<xsl:if test="@bestSolutionTime"><xsl:value-of select="@bestSolutionTime"/></xsl:if>/<xsl:value-of select="@numberSolved"/>
		</td>
	</xsl:for-each>
</xsl:template>

<xsl:template name="teamStanding">
	<xsl:for-each select="teamStanding">
		<tr class="teamStanding">
			<td class="rank"><xsl:value-of select="@rank"/></td>
			<td class="teamName"><xsl:value-of select="@teamName"/></td>
			<td class="solved"><xsl:value-of select="@solved"/></td>
			<td class="points"><xsl:value-of select="@points"/></td>
			<xsl:call-template name="problemSummaryInfo"/>
<!-- <teamStanding index="1" solved="8" problemsattempted="8" rank="1" score="1405" teamName="Warsaw University" timefirstsolved="13" timelastsolved="272" totalAttempts="19" userid="84" usersiteid="1"> -->
			<td class="totalAttempts"><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@solved"/></td>
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template name="problemSummaryInfo">
	<xsl:for-each select="problemSummaryInfo">
<!-- <problemSummaryInfo attempts="1" index="1" problemid="1" score="73" solutionTime="73"/> -->
		<td class="problemSummary">
		<xsl:value-of select="@attempts"/>/<xsl:if test="@isSolved = 'false'">--</xsl:if>
		<xsl:if test="@isSolved = 'true'"><xsl:value-of select="@solutionTime"/></xsl:if>
		</td>
	</xsl:for-each>
</xsl:template>

<xsl:template name="problemTitle">
	<xsl:for-each select="/contestStandings/standingsHeader/problem">
		<!-- <th>&#160;&#160;&#160;&#160;<strong><u><xsl:number format="A" value="@id"/></u></strong>&#160;&#160;&#160;&#160;</th> -->
		<th>&#160;&#160;&#160;&#160;<strong><u><xsl:value-of select="@title"/></u></strong>&#160;&#160;&#160;&#160;</th>
	</xsl:for-each>
</xsl:template>

<xsl:template name="problemColor">
	<xsl:for-each select="/contestStandings/standingsHeader/colorList/colors[@siteNum = 1]/problem">
		<td><center><xsl:choose><xsl:when test="@color"> <xsl:value-of select="@color"/></xsl:when><xsl:otherwise>Color<xsl:value-of select="@id"/></xsl:otherwise></xsl:choose></center></td>
	</xsl:for-each>
</xsl:template>

<xsl:template name="rankRow">
	<tr>
		<th><strong><u>排名</u></strong></th>
		<th><strong><u>隊伍名稱</u></strong></th>
		<th><strong><u>解題數</u></strong></th>
		<th><strong><u>解題時間</u></strong></th>
		<xsl:call-template name="problemTitle"/>
		<th>上傳數/解題數</th>
	</tr>
</xsl:template>

<xsl:template name="colorRow">
	<tr>
		<td></td><td></td><td></td><td></td>
		<xsl:call-template name="problemColor"/>
	</tr>
</xsl:template>
</xsl:stylesheet>
