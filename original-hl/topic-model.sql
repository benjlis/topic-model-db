-- Composite of the various topic model subschemas that existed in the 
-- original History Lab MySQL database. 
--
-- Only meant for historical reference as it does not reflect current practice.
create table topics (
    id      smallint primary key,
    title   text not null,
    name    varchar(250)
    );

create table tokens (
    id      int,
    value   text
    );

create table topic_doc (
    doc_id          varchar(31),
    topic_id        smallint,
    topic_score     float       not null /* ,
    date            timestamp, */
    primary key (doc_id, topic_id)
    );

create table topic_token (
    token_id    int,
    topic_id    smallint,
    token_score float not null,
    primary key (token_id, topic_id)
    );
