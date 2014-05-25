# --- Created by Slick DDL
# To stop Slick DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table "ASSIGNMENT" ("PAPERID" UUID NOT NULL,"PERSONID" UUID NOT NULL,"VALUE" BOOLEAN NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "AUTHOR" ("PAPERID" UUID NOT NULL,"PERSONID" UUID NOT NULL,"POSITION" INTEGER NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "BID" ("PAPERID" UUID NOT NULL,"PERSONID" UUID NOT NULL,"VALUE" INTEGER NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "COMMENT" ("PAPERID" UUID NOT NULL,"PERSONID" UUID NOT NULL,"CONTENT" TEXT NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "EMAIL" ("TO" TEXT NOT NULL,"SUBJECT" TEXT NOT NULL,"CONTENT" TEXT NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "FILE" ("NAME" TEXT NOT NULL,"SIZE" BIGINT NOT NULL,"CONTENT" BYTEA NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "LOGINTOKENS" ("UUID" text NOT NULL PRIMARY KEY,"EMAIL" text NOT NULL,"CREATIONTIME" TIMESTAMP NOT NULL,"EXPIRATIONTIME" TIMESTAMP NOT NULL,"ISSIGNUP" BOOLEAN NOT NULL,"ISINVITATION" BOOLEAN NOT NULL);
create table "LOGINUSERS" ("UID" TEXT NOT NULL,"PID" TEXT NOT NULL,"EMAIL" TEXT NOT NULL,"FIRSTNAME" TEXT NOT NULL,"LASTNAME" TEXT NOT NULL,"AUTHMETHOD" TEXT NOT NULL,"HASHER" TEXT,"PASSWORD" TEXT,"SALT" TEXT);
alter table "LOGINUSERS" add constraint "LOGINUSERS_PK" primary key("UID","PID");
create table "PAPER" ("TITLE" TEXT NOT NULL,"FORMAT" INTEGER NOT NULL,"KEYWORDS" TEXT NOT NULL,"ABSTRCT" TEXT NOT NULL,"NAUTHORS" INTEGER NOT NULL,"FILE" UUID,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "PAPERINDEX" ("PAPERID" UUID NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "PAPERTOPIC" ("PAPERID" UUID NOT NULL,"TOPICID" UUID NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "PERSON" ("FIRSTNAME" TEXT NOT NULL,"LASTNAME" TEXT NOT NULL,"ORGANIZATION" VARCHAR(254) NOT NULL,"EMAIL" TEXT NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "REVIEW" ("PAPERID" UUID NOT NULL,"PERSONID" UUID NOT NULL,"CONFIDENCE" INTEGER NOT NULL,"EVALUATION" INTEGER NOT NULL,"CONTENT" TEXT NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "ROLE" ("PERSONID" UUID NOT NULL,"VALUE" INTEGER NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);
create table "TOPIC" ("NAME" TEXT NOT NULL,"ID" UUID NOT NULL,"UPDATEDAT" TIMESTAMP NOT NULL,"UPDATEDBY" TEXT NOT NULL);

# --- !Downs

drop table "ASSIGNMENT";
drop table "AUTHOR";
drop table "BID";
drop table "COMMENT";
drop table "EMAIL";
drop table "FILE";
drop table "LOGINTOKENS";
alter table "LOGINUSERS" drop constraint "LOGINUSERS_PK";
drop table "LOGINUSERS";
drop table "PAPER";
drop table "PAPERINDEX";
drop table "PAPERTOPIC";
drop table "PERSON";
drop table "REVIEW";
drop table "ROLE";
drop table "TOPIC";

