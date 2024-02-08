-- creates staging table for loading updted topic_models CSVs
create table tokens_stage (
	 value 	 text,
	 id 	 integer
);

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

create table topic_token_stage (
         topic   integer,
         beta    float,
         id      integer
);
