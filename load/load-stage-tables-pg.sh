#
# load-stage-tables-pg.sh
#
# assumptions:
# . empty topic model stage tables exist in ${SCHEMA}
# . these environmental variables are defined:
#   SCHEMA: database schema that the stage tables will hold (e.g. tmp)
#   COLLECTION: name prefix for CSV files (e.g. kissinger)
#   PSQL_ARGS: psql arguments needed to connect to SQL (e.g. -U <username> -h <hostname>)
#   CSV_DIR: directory containing topic model CSVs
#

load_stage ()
{
    table_name="${SCHEMA}.${1}_stage"
    csv_file="${CSV_DIR}/${COLLECTION}_${1}.csv"
    cp_command="\copy ${table_name} from '${csv_file}' delimiter ',' csv header;"
    psql -X -e ${PSQL_ARGS} <<!EOF!
    \copy ${table_name} from '${csv_file}' delimiter ',' csv header
!EOF!
}

#earlier iterations
#cc="\copy ${SCHEMA}.tokens_stage(value, id) FROM 'data/${COLLECTION}_tokens.csv' delimiter ',' csv header;"
#echo ${cc}   | psql ${PSQL_ARGS}
#load_stage "${SCHEMA}.tokens_stage(value, id)" "data/${COLLECTION}_tokens.csv"

load_stage tokens
load_stage topics
load_stage topic_doc
load_stage topic_token
