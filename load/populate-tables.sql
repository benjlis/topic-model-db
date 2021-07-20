-- populates the topic model tables from stage
insert into tokens(token_id, token)
select id, value from tokens_stage;

insert into topics(topic_id, topic)
select id, name from topics_stage;

insert into topic_docs(topic_id, doc_id, score)
select topic_id, doc_id, topic_score from topic_doc_stage;

insert into topic_tokens(topic_id, token_id, score)
select id, topic, beta from topic_tokens_stage; 
