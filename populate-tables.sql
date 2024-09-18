-- populates the topic model tables from stage
insert into topics(corpus, topic_id, title, name)
select :'corpus', id, title, name 
    from topics_stage;

insert into topic_docs(corpus, topic_id, doc_id, score)
select :'corpus', topic_id, doc_id, topic_score 
    from topic_doc_stage;

