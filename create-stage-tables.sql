-- creates staging table for loading updated topic_models CSVs
drop table foiarchive.topics_stage;
create table foiarchive.topics_stage (
         title   text,
         name    text,
         id      integer
);

drop table foiarchive.topic_doc_stage;
create table foiarchive.topic_doc_stage (
         doc_id          text,
         topic_id        integer,
         topic_score     float
);