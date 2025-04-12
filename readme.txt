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
├── migrations/
│   ├── combolist/
│   │   ├── V1__create_combolist_file_table.sql
│   │   ├── V2__create_combolist_entries_user_table.sql
│   │   ├── V3__create_combolist_entries_urls_table.sql
│   ├── searchx/
│   │   ├── V1__create_users_table.sql
│   │   ├── V2__create_agents_table.sql
│
├── docker-compose.yml
├── setup.sh
└── docker.sh

Folder Explanation:
======================
- **`migrations/`**: Contains versioned SQL migration scripts organized by database/module.
  Each subfolder (e.g. `combolist/`, `searchx/`) holds its own schema evolution files 
  compatible with Flyway.

- **`docker-compose.yml`**: Defines all services needed to run the environment, such as
  PostgreSQL containers for each schema.

- **`setup.sh`**: Shell script that ensures correct UID/GID ownership of PostgreSQL 
  data directories before container startup.

- **`docker.sh`**: Script that handles Docker container operations, such as starting specific 
  services and running Flyway migrations.