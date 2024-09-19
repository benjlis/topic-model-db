#
# load-stage-tables-pg.sh ${1}
#     where ${1} is the topic model's corpus name prefix (e.g. kissinger) 
#
# assumptions:
#    - the script is invoked from the directory where it is installed
#    - the topic model csv files have been loadded in the data subdirectory

# Validate arguments and environmental variables
if [ -z "$1" ]; then
    echo "Error: No corpus name prefix provided."
    echo "Usage: $0 <corpus_name_prefix>"
    exit 1
fi
if [ -z "${DBCONNECT}" ]; then
    echo "Error: DBCONNECT environment variable must be defined."
    exit 1
fi

CORPUS=${1}
DATA_DIR=./data

heading () {
    echo
    echo "======================================================================"
    echo $1
    echo "======================================================================"
}

load_stage ()
{
    table_name="foiarchive.${1}_stage"
    csv_file="${DATA_DIR}/${CORPUS}_${1}.csv"
    if [ ! -f "$csv_file" ]; then
        echo "Error: File ${csv_file} not found."
        exit 1
    fi
    psql -X -e ${DBCONNECT} <<!EOF!
    \copy ${table_name} from '${csv_file}' delimiter ',' csv header
!EOF!
}

# Main script body
# long term retention of this backup is not needed
heading "Back up topics & topic_docs tables in case of error:"
pg_dump -t foiarchive.topics -t foiarchive.topic_docs -f ${DATA_DIR}/topic-tables.sql -v ${DBCONNECT}
#
heading "Drop and recreate the staging tables:"
psql -X -e ${DBCONNECT} -f create-stage-tables.sql
#
heading "Load CSVs into staging tables:"
load_stage topics
load_stage topic_doc
# Update  the tables from the stage tables
