-- creates staging table for loading updated topic_models CSVs
create table foiarchive.topics_stage (
         title   text,
         name    text,
         id      integer
);

create table foiarchive.topic_doc_stage (
         doc_id          text,
         topic_id        integer,
         topic_score     float
);