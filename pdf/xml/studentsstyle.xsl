<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
	<xsl:template match="records">
		<fo:root language="IT">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4-portrail" page-height="297mm" page-width="210mm" margin-top="5mm" margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
					<fo:region-body margin-top="25mm" margin-bottom="20mm"/>
					<fo:region-before region-name="xsl-region-before" extent="25mm" display-align="before" precedence="true"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4-portrail">
			<fo:static-content flow-name="xsl-region-before">
					<fo:table table-layout="fixed" width="100%" font-size="10pt" background-color="#green" border-color="black" border-width="0.2mm" border-style="solid">
						FINAL EXAM MARKS
					</fo:table>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
				<fo:block space-before="3mm"/>
					<fo:table table-layout="fixed" width="100%"  font-size="7pt" background-color="blue" border-color="black" border-width="0.5mm"  text-align="center" display-align="center" space-after="5mm">
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-body font-size="100%">
							<fo:table-row height="10mm">
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">
									<fo:block>Name</fo:block>
								</fo:table-cell>
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">
									<fo:block>Registration Id</fo:block>
								</fo:table-cell>
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">
									<fo:block>Physics</fo:block>
								</fo:table-cell>
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">
									<fo:block>Maths</fo:block>
								</fo:table-cell>
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">  
									<fo:block>Biology</fo:block>
								</fo:table-cell>
								<fo:table-cell border-color="black" border-width="0.10mm" background-color="#A8A8A8" border-style="solid">  
									<fo:block>Total Marks</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="record">
								<fo:table-row height="8mm">
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="name"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="regisrationId"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="physics"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="maths"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="biology"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-color="black" border-width="0.10mm" border-style="solid">
										<fo:block>
											<xsl:value-of select="total"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block id="end-of-document">
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
