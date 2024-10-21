\set ON_ERROR_STOP 1
\timing on
begin;
-- delete the existing version of the model
delete from foiarchive.topic_docs where corpus = :'corpus';
delete from foiarchive.topics where corpus = :'corpus';

-- populates the topic model tables from stage
insert into foiarchive.topics(corpus, topic_id, title, name)
select :'corpus', id, title, name 
    from foiarchive.topics_stage;

insert into foiarchive.topic_docs(corpus, topic_id, doc_id, score)
select :'corpus', topic_id, doc_id, topic_score 
    from foiarchive.topic_doc_stage;

refresh materialized view foiarchive.corpora;
commit;
