package models.relations

import play.api.db.slick.DB
import play.api.db.slick.Config.driver.simple._
import play.api.Play.current
import com.github.tototoshi.slick.JodaSupport._
import _root_.java.sql.Date
import org.joda.time.DateTime
import models._
import models.entities._

object ReviewConfidence extends Enumeration with BitmaskedEnumeration {
  type ReviewConfidence = Value
  val VeryLow, Low, Medium, High, VeryHigh = Value
}
import ReviewConfidence._

object ReviewEvaluation extends Enumeration with BitmaskedEnumeration {
  type ReviewEvaluation = Value
  val StrongReject, Reject, Neutral, Accept, StrongAccept = Value
}
import ReviewEvaluation._

// Submission/Member assignments and review data
case class Review(
  paperid: Int,
  memberid: Int,
  submissiondate: Option[DateTime],
  lastupdate: Option[DateTime],
  confidence: ReviewConfidence,
  evaluation: ReviewEvaluation,
  content: String
)

object Reviews extends Table[Review]("REVIEWS") {
  def paperid = column[Int]("paperid")
  def memberid = column[Int]("memberid")
  def submissiondate = column[Option[DateTime]]("submissiondate")
  def lastupdate = column[Option[DateTime]]("lastupdate")
  def confidence = column[ReviewConfidence]("confidence")
  def evaluation = column[ReviewEvaluation]("evaluation")
  def content = column[String]("content", O.DBType("text"))
  
  def pk = primaryKey("members_pk", paperid ~ memberid)
  def member = foreignKey("members_memberid_fk", memberid, Members)(_.id)
  def paper = foreignKey("members_paperid_fk", paperid, Papers)(_.id)

  def * = paperid ~ memberid ~ submissiondate ~ lastupdate ~ confidence ~ evaluation ~ content <> (Review.apply _, Review.unapply _)
}