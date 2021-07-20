-- populates the topic model tables from stage
insert into tokens(id, value)
select id, value from tokens_stage;

insert into topics(id, title, name)
select id, title, name from topics_stage;

insert into topic_doc(topic_id, doc_id, topic_score)
select topic_id, doc_id, topic_score from topic_doc_stage;

insert into topic_token(topic_id, token_id, token_score)
select topic, id, beta from topic_token_stage;
