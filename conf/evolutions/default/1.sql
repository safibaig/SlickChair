# --- Created by Slick DDL
# To stop Slick DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table "TASKS" ("id" SERIAL NOT NULL PRIMARY KEY,"label" VARCHAR(254) NOT NULL);
create table "AUTHORS" ("paperid" INTEGER NOT NULL,"position" INTEGER NOT NULL,"firstname" VARCHAR(254) NOT NULL,"lastname" VARCHAR(254) NOT NULL,"organization" VARCHAR(254) NOT NULL,"positiontitle" VARCHAR(254) NOT NULL,"email" VARCHAR(254) NOT NULL);
alter table "AUTHORS" add constraint "authors_pk" primary key("paperid","position");
create table "MEMBERS" ("id" SERIAL NOT NULL PRIMARY KEY,"securesocialuserid" VARCHAR(254) NOT NULL,"securesocialproviderid" VARCHAR(254) NOT NULL,"firstlogindate" TIMESTAMP NOT NULL,"lastlogindate" TIMESTAMP NOT NULL,"role" INTEGER NOT NULL,"firstname" VARCHAR(254) NOT NULL,"lastname" VARCHAR(254) NOT NULL,"organization" VARCHAR(254),"positiontitle" VARCHAR(254),"email" VARCHAR(254) NOT NULL);
create table "PAPERS" ("id" SERIAL NOT NULL PRIMARY KEY,"securesocialuserid" VARCHAR(254) NOT NULL,"securesocialproviderid" VARCHAR(254) NOT NULL,"submissiondate" TIMESTAMP NOT NULL,"lastupdate" TIMESTAMP NOT NULL,"accepted" BOOLEAN,"title" VARCHAR(254) NOT NULL,"format" INTEGER NOT NULL,"student" BOOLEAN NOT NULL,"keywords" VARCHAR(254) NOT NULL,"abstrct" VARCHAR(254) NOT NULL,"data" BYTEA);
create table "TOPICS" ("id" SERIAL NOT NULL PRIMARY KEY,"name" VARCHAR(254) NOT NULL,"description" VARCHAR(254));
create table "COMMENTS" ("id" SERIAL NOT NULL PRIMARY KEY,"paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"submissiondate" TIMESTAMP NOT NULL,"lastupdate" TIMESTAMP NOT NULL,"content" VARCHAR(254) NOT NULL);
create table "MEMBER_BIDS" ("paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"bid" INTEGER NOT NULL);
alter table "MEMBER_BIDS" add constraint "memberbids_pk" primary key("paperid","memberid");
create table "MEMBER_TOPICS" ("memberid" INTEGER NOT NULL,"topicid" INTEGER NOT NULL);
alter table "MEMBER_TOPICS" add constraint "membertopics_pk" primary key("memberid","topicid");
create table "PAPER_TOPICS" ("paperid" INTEGER NOT NULL,"topicid" INTEGER NOT NULL);
alter table "PAPER_TOPICS" add constraint "papertopics_pk" primary key("paperid","topicid");
create table "REVIEWS" ("paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"submissiondate" TIMESTAMP,"lastupdate" TIMESTAMP,"confidence" INTEGER NOT NULL,"evaluation" INTEGER NOT NULL,"content" text NOT NULL);
alter table "REVIEWS" add constraint "members_pk" primary key("paperid","memberid");
create table "SECURE_SOCIAL_TOKENS" ("uuid" VARCHAR(254) NOT NULL PRIMARY KEY,"email" VARCHAR(254) NOT NULL,"creationtime" TIMESTAMP NOT NULL,"expirationtime" TIMESTAMP NOT NULL,"issignup" BOOLEAN NOT NULL);
create table "SECURE_SOCIAL_USERS" ("uid" VARCHAR(254) NOT NULL,"pid" VARCHAR(254) NOT NULL,"email" VARCHAR(254) NOT NULL,"firstname" VARCHAR(254) NOT NULL,"lastname" VARCHAR(254) NOT NULL,"avatarurl" VARCHAR(254),"authmethod" VARCHAR(254) NOT NULL,"hasher" VARCHAR(254),"password" VARCHAR(254),"salt" VARCHAR(254));
alter table "SECURE_SOCIAL_USERS" add constraint "securesocialusers_pk" primary key("uid","pid");
create table "LOGS" ("id" SERIAL NOT NULL PRIMARY KEY,"date" TIMESTAMP NOT NULL,"entry" VARCHAR(254) NOT NULL);
create table "SENTMAILS" ("id" SERIAL NOT NULL PRIMARY KEY,"sent" TIMESTAMP NOT NULL,"to" VARCHAR(254) NOT NULL,"subject" VARCHAR(254) NOT NULL,"body" VARCHAR(254) NOT NULL);
create table "SETTINGS" ("name" VARCHAR(254) NOT NULL PRIMARY KEY,"value" VARCHAR(254) NOT NULL);
create table "TEMPLATES" ("id" SERIAL NOT NULL PRIMARY KEY,"name" VARCHAR(254) NOT NULL,"subject" VARCHAR(254) NOT NULL,"body" VARCHAR(254) NOT NULL);
alter table "AUTHORS" add constraint "authors_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBERS" add constraint "members_secur  esocialuser_fk" foreign key("securesocialuserid","securesocialproviderid") references "SECURE_SOCIAL_USERS"("uid","pid") on update NO ACTION on delete NO ACTION;
alter table "PAPERS" add constraint "papers_securesocialuser_fk" foreign key("securesocialuserid","securesocialproviderid") references "SECURE_SOCIAL_USERS"("uid","pid") on update NO ACTION on delete NO ACTION;
alter table "COMMENTS" add constraint "comments_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "COMMENTS" add constraint "comments_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_BIDS" add constraint "memberbids_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_BIDS" add constraint "memberbids_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_TOPICS" add constraint "membertopics_topic_fk" foreign key("topicid") references "TOPICS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_TOPICS" add constraint "membertopics_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "PAPER_TOPICS" add constraint "papertopics_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "PAPER_TOPICS" add constraint "papertopics_topicid_fk" foreign key("topicid") references "TOPICS"("id") on update NO ACTION on delete NO ACTION;
alter table "REVIEWS" add constraint "members_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "REVIEWS" add constraint "members_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;

# --- !Downs

alter table "AUTHORS" drop constraint "authors_paperid_fk";
alter table "MEMBERS" drop constraint "members_secur  esocialuser_fk";
alter table "PAPERS" drop constraint "papers_securesocialuser_fk";
alter table "COMMENTS" drop constraint "comments_paperid_fk";
alter table "COMMENTS" drop constraint "comments_memberid_fk";
alter table "MEMBER_BIDS" drop constraint "memberbids_paperid_fk";
alter table "MEMBER_BIDS" drop constraint "memberbids_memberid_fk";
alter table "MEMBER_TOPICS" drop constraint "membertopics_topic_fk";
alter table "MEMBER_TOPICS" drop constraint "membertopics_memberid_fk";
alter table "PAPER_TOPICS" drop constraint "papertopics_paperid_fk";
alter table "PAPER_TOPICS" drop constraint "papertopics_topicid_fk";
alter table "REVIEWS" drop constraint "members_paperid_fk";
alter table "REVIEWS" drop constraint "members_memberid_fk";
drop table "TASKS";
alter table "AUTHORS" drop constraint "authors_pk";
drop table "AUTHORS";
drop table "MEMBERS";
drop table "PAPERS";
drop table "TOPICS";
drop table "COMMENTS";
alter table "MEMBER_BIDS" drop constraint "memberbids_pk";
drop table "MEMBER_BIDS";
alter table "MEMBER_TOPICS" drop constraint "membertopics_pk";
drop table "MEMBER_TOPICS";
alter table "PAPER_TOPICS" drop constraint "papertopics_pk";
drop table "PAPER_TOPICS";
alter table "REVIEWS" drop constraint "members_pk";
drop table "REVIEWS";
drop table "SECURE_SOCIAL_TOKENS";
alter table "SECURE_SOCIAL_USERS" drop constraint "securesocialusers_pk";
drop table "SECURE_SOCIAL_USERS";
drop table "LOGS";
drop table "SENTMAILS";
drop table "SETTINGS";
drop table "TEMPLATES";

