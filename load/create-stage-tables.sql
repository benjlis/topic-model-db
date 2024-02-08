-- creates staging table for loading updated topic_models CSVs
create table topics_stage (
         title   text,
         name    text,
         id      integer
);

create table topic_doc_stage (
         doc_id          text,
         topic_id        integer,
         topic_score     float,
         topicsum        float,
         top75           integer
);
-- TBD remove tokens_stage and topic_token_stage
-- create table tokens_stage (
--	 value 	 text,
--	 id 	 integer
--);
-- create table topic_token_stage (
--         topic   integer,
--         beta    float,
--         id      integer
--);
