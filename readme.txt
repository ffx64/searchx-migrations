===========================================================================================
                                    SearchX Database
===========================================================================================

This repository is responsible for versioning the database migrations of **SearchX**. 
The project uses **Flyway** to manage and version database migrations within **Docker** 
containers. The main goal is to automate the application of migrations, using SQL scripts 
and Docker Compose for different databases, ensuring a consistent and controlled update 
process.

-------------------------------------------------------------------------------------------
                                    Database Files
-------------------------------------------------------------------------------------------

This is where all the magic (and madness) happens. You've got your data, migrations,
and Docker setup here. Hopefully, you know what you're doing.

-------------------------------------------------------------------------------------------
                                    Project Structure
-------------------------------------------------------------------------------------------

searchx-migrations/
│
├── docker/
│   ├── combolist/
│   │   └── docker-compose.yml
│   ├── discord_messages/                                 # Example
│   │   └── docker-compose.yml                            # Example
│
├── migrations/
│   ├── combolist/
│   │   ├── V1__create_combolist_file_table.sql
│   │   ├── V2__create_combolist_entries_user_table.sql
│   │   ├── V3__create_combolist_entries_urls_table.sql
│   ├── discord_messages/                                 # Example
│   │   ├── V1__create_users_table.sql                    # Example
│   │   ├── V2__create_guilds_table.sql                   # Example
│   │   ├── V3__create_messages_table.sql                 # Example
│
└── run_migrations.py

Folder Explanation:
======================
- **`docker/`**: Contains Docker Compose files for each database, with service-specific 
  configurations.
- **`migrations/`**: Contains SQL migration files for different databases.
- **`run_migrations.py`**: Python script that automates the execution of Docker Compose 
  and the application of migrations.