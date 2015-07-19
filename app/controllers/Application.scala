package controllers

import play.api._
import play.api.mvc._
import infrastructure._

object Application extends Controller {

  def index = Action {
    PDFGenerator.generatePDF()
    Ok(views.html.index("pdf generated"))
  }

}