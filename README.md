# topic-model-updates
Scripts for updating a corpus-specific topic models in the FOIArchive database.

# installation
Clone this repo.

# running a topic model db update
1. Copy the topic model CSVs into the data subdirectory
2. Define an environment varable called DBCONNECT containing the database connect string
3. Run the shell script `update-topic-model.sh` in the directory where it is installed, passing it the shortcode for the corpus it is updating:
```
topic-model-updates % ./update-topic-model.sh frus
```
## assumption
Postgres tools (at least psql, pg_dump) are installed and in the PATH

# what does the script do?
1. backs up the topic tables in case of error
2. creates staging tables 
3. loads the staging tables with the CSVs contents
4. replaces the topic model for the corpus specified with the contents of the staging tables 

The script provides provides progress updates and error handling. For more details, review its source. Please reach out if something isn't clear or you encouter problems.