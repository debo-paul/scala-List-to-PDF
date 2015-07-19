package infrastructure

import scala.xml._
import play.api._
import play.api.mvc._
import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.data._
import play.api.cache._
import play.api.data.Forms._
import play.api.Logger
import java.io.File;
import java.io.OutputStream;
import scalax.file.Path
import play.api.Play.current
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.fop.apps.FOUserAgent
import org.apache.fop.apps.Fop
import org.apache.fop.apps.FopFactory
import org.apache.fop.apps.MimeConstants
import java.io._

object PDFGenerator {

  def generatePDF() {
    case class StudentRecord(name: String, registrationNumber: String, physics: Option[Int], maths: Option[Int], biology: Option[Int], total: Int)
    val dummyRecords = List(
      StudentRecord("Eddard", "100101013", Some(84), Some(72), Some(92), 248),
      StudentRecord("JonSnow", "100101014", Some(95), None, Some(62), 157),
      StudentRecord("Arya", "100101015", Some(93), Some(91), Some(94), 278),
      StudentRecord("Robb", "100101016", Some(51), Some(67), Some(61), 248),
      StudentRecord("Sansa", "100101017", Some(77), Some(65), None, 179),
      StudentRecord("Dynerys", "100101018", None, Some(52), Some(45), 97))

    val buffer = new xml.NodeBuffer
    val myXML = dummyRecords.map { record =>
      val records = <record>
                      <name>{ record.name }</name>
                      <regisrationId>{ record.registrationNumber }</regisrationId>
                      { if (record.physics.isDefined) <physics>{ record.physics.get }</physics> else <physics>NA</physics> }
                      { if (record.maths.isDefined) <maths>{ record.maths.get }</maths> else <maths>NA</maths> }
                      { if (record.biology.isDefined) <biology>{ record.biology.get }</biology> else <biology>NA</biology> }
                      <total>{ record.total }</total>
                    </record>
      buffer += records
    }
    val studentRecords = <records>{ myXML }</records>
    scala.xml.XML.save(current.path.getAbsolutePath() + "/pdf/xml/studentrecords.xml", studentRecords)
    transformer()
  }

  def transformer() {

    val xml = new File(current.path.getAbsolutePath() + "/pdf/xml/studentrecords.xml")
    val xslt = new File(current.path.getAbsolutePath() + "/pdf/xml/studentsstyle.xsl")
    val pdf = new File(current.path.getAbsolutePath() + "/pdf/xml/studentrecords.pdf")
    val xslt2fo = new File(current.path.getAbsolutePath() + "/pdf/xml/xslt2fo.fo")

    val fopFactory = FopFactory.newInstance()
    val out = new java.io.FileOutputStream(xslt2fo)
    val pdfOutput = new BufferedOutputStream(new FileOutputStream(pdf))
    val factory = TransformerFactory.newInstance()
    val transformer = factory.newTransformer(new StreamSource(xslt))
    val source = new StreamSource(xml)
    val output = new StreamResult(out)
    transformer.transform(source, output)
    val fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
    val factory2 = TransformerFactory.newInstance()
    val pdfTransformer = factory.newTransformer()
    val xsltFoSource = new StreamSource(xslt2fo)
    val pdfOut = new SAXResult(fop.getDefaultHandler())
    pdfTransformer.transform(xsltFoSource, pdfOut)

  }

}