# topic-model-db
DDL and load db scripts for History Lab topics models.

Run the sql script `ddl/topic-model.sql` to install the topic model tables in an
existing schema.

To load topic models in History Lab csv format, run the following scripts in
this order:

1. `load/create-stage-tables.sql`
2. `load/load-stage-tables-pg.sh` (PostgreSQL only)
3. `load/populate-tables.sql`
5. `load/drop-stage-tables.sql`

Rename doc_id column in the topic_docs table if necessary and add referential
integrity constraint.


