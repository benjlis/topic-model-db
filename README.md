# topic-model-updates
Scripts for updating a corpus-specific topic model in the FOIArchive database.

# installation
Clone this repo.

# running a topic model db update
1. Copy the topic model CSVs into the data subdirectory
2. Define an environment varable called DBCONNECT containing the database connect string
3. Run the shell script `update-topic-model.sh` in the directory where it is installed, passing it the shortcode for the corpus it is updating:
```
./update-topic-model.sh frus
```
## assumption
Postgres tools (at least psql, pg_dump) are installed and in the PATH
Also, zip and aws cli should both be installed and the latter configured to connect to HL's AWS S3 account

# what does the script do?
1. backs up the topic tables in case of error
2. creates staging tables 
3. loads the staging tables with the CSVs contents
4. replaces the topic model for the corpus specified with the contents of the staging tables
5. uploads a zip file to AWS S3 

The script provides provides progress updates and error handling. For more details, review its source. Please reach out if something isn't clear or you encouter problems.
