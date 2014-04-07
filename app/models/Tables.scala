package models

import play.api.db.slick.Config.driver.simple._
import com.github.tototoshi.slick.JdbcJodaSupport._
import org.joda.time.DateTime
import MemberRole._
import PaperType._
import ReviewConfidence._
import ReviewEvaluation._

trait RepoTable[M <: Model[M]] {
  this: Table[M] =>
  def id = column[Id[M]]("ID", O.AutoInc)
  def updatedAt = column[DateTime]("updatedat")
  def updatedBy = column[Id[Person]]("updatedby")
}

class TopicTable(tag: Tag) extends Table[Topic](tag, "Topic") with RepoTable[Topic] {
  def name = column[String]("name")
  def description = column[String]("description")
  def * = ((id, updatedAt, updatedBy), name, description) <> (Topic.tupled, Topic.unapply)
}

class PersonTable(tag: Tag) extends Table[Person](tag, "Person") with RepoTable[Person] {
  def firstname = column[String]("firstname")
  def lastname = column[String]("lastname")
  def organization = column[String]("organization")
  def role = column[MemberRole]("role")
  def invitedas = column[String]("invitedas")
  def email = column[String]("email")
  def * = ((id, updatedAt, updatedBy), firstname, lastname, organization, role, invitedas, email) <> (Person.tupled, Person.unapply)
}

class PaperTable(tag: Tag) extends Table[Paper](tag, "Paper") with RepoTable[Paper] {
  def title = column[String]("title")
  def format = column[PaperType]("format")
  def keywords = column[String]("keywords")
  def abstrct = column[String]("abstrct")
  def file = column[Id[File]]("file")
  def * = ((id, updatedAt, updatedBy), title, format, keywords, abstrct, file) <> (Paper.tupled, Paper.unapply)
}

class PaperTopicTable(tag: Tag) extends Table[PaperTopic](tag, "PaperTopic") with RepoTable[PaperTopic] {
  def paperid = column[Id[Paper]]("paperid")
  def topicid = column[Id[Topic]]("topicid")
  def * = ((id, updatedAt, updatedBy), paperid, topicid) <> (PaperTopic.tupled, PaperTopic.unapply)
}

class AuthorTable(tag: Tag) extends Table[Author](tag, "Author") with RepoTable[Author] {
  def paperid = column[Id[Paper]]("paperid")
  def personid = column[Id[Person]]("personid")
  def position = column[Int]("position")
  def * = ((id, updatedAt, updatedBy), paperid, personid, position) <> (Author.tupled, Author.unapply)
}

class CommentTable(tag: Tag) extends Table[Comment](tag, "Comment") with RepoTable[Comment] {
  def paperid = column[Id[Paper]]("paperid")
  def personid = column[Id[Person]]("personid")
  def content = column[String]("content")
  def * = ((id, updatedAt, updatedBy), paperid, personid, content) <> (Comment.tupled, Comment.unapply)
}

class ReviewTable(tag: Tag) extends Table[Review](tag, "Review") with RepoTable[Review] {
  def paperid = column[Id[Paper]]("paperid")
  def personid = column[Id[Person]]("personid")
  def confidence = column[ReviewConfidence]("confidence")
  def evaluation = column[ReviewEvaluation]("evaluation")
  def content = column[String]("content")
  def * = ((id, updatedAt, updatedBy), paperid, personid, confidence, evaluation, content) <> (Review.tupled, Review.unapply)
}

class FileTable(tag: Tag) extends Table[File](tag, "File") with RepoTable[File] {
  def name = column[String]("name")
  def size = column[Long]("size")
  def content = column[Array[Byte]]("content")
  def * = ((id, updatedAt, updatedBy), name, size, content) <> (File.tupled, File.unapply)
}

class EmailTable(tag: Tag) extends Table[Email](tag, "Email") with RepoTable[Email] {
  def to = column[String]("to")
  def subject = column[String]("subject")
  def content = column[String]("content")
  def * = ((id, updatedAt, updatedBy), to, subject, content) <> (Email.tupled, Email.unapply)
}