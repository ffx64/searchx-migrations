import subprocess
import os
import time

def run_docker_compose(directory):
    print(f"Running migrations in directory: {directory}...")

    command = ["docker-compose", "up", "--build", "--abort-on-container-exit"]

    try:
        subprocess.check_call(command, cwd=directory)
        print(f"Migrations for {directory} applied successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error running migrations for {directory}: {e}")

def check_migration_status(directory):
    print(f"Checking migration status in directory: {directory}...")
    
    command = ["docker-compose", "exec", "flyway", "info"]
    
    try:
        subprocess.check_call(command, cwd=directory)
    except subprocess.CalledProcessError as e:
        print(f"Error checking migration status for {directory}: {e}")

def find_docker_directories(base_dir):
    directories = []
    for subdir in os.listdir(base_dir):
        subdir_path = os.path.join(base_dir, subdir)
        if os.path.isdir(subdir_path) and 'docker-compose.yml' in os.listdir(subdir_path):
            directories.append(subdir_path)
    return directories

def main():
    base_docker_dir = os.path.join(os.getcwd(), "docker")

    docker_dirs = find_docker_directories(base_docker_dir)

    for docker_dir in docker_dirs:
        migration_dir = os.path.join(os.getcwd(), "migrations", os.path.basename(docker_dir))

        if os.path.exists(migration_dir) and os.listdir(migration_dir):
            run_docker_compose(docker_dir)
            check_migration_status(docker_dir)
        else:
            print(f"No migrations found for {docker_dir}. Skipping...")

        print("Waiting 5 seconds before running migrations for the next directory...")
        time.sleep(5)

if __name__ == "__main__":
    main()
import subprocess
import os
import time

def run_docker_compose(directory):
    print(f"Running migrations in directory: {directory}...")

    command = ["docker-compose", "up", "--build", "--abort-on-container-exit"]

    try:
        subprocess.check_call(command, cwd=directory)
        print(f"Migrations for {directory} applied successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error running migrations for {directory}: {e}")

def check_migration_status(directory):
    print(f"Checking migration status in directory: {directory}...")
    
    command = ["docker-compose", "exec", "flyway", "info"]
    
    try:
        subprocess.check_call(command, cwd=directory)
    except subprocess.CalledProcessError as e:
        print(f"Error checking migration status for {directory}: {e}")

def find_docker_directories(base_dir):
    directories = []
    for subdir in os.listdir(base_dir):
        subdir_path = os.path.join(base_dir, subdir)
        if os.path.isdir(subdir_path) and 'docker-compose.yml' in os.listdir(subdir_path):
            directories.append(subdir_path)
    return directories

def main():
    base_docker_dir = os.path.join(os.getcwd(), "docker")

    docker_dirs = find_docker_directories(base_docker_dir)

    for docker_dir in docker_dirs:
        migration_dir = os.path.join(os.getcwd(), "migrations", os.path.basename(docker_dir))

        if os.path.exists(migration_dir) and os.listdir(migration_dir):
            run_docker_compose(docker_dir)
            check_migration_status(docker_dir)
        else:
            print(f"No migrations found for {docker_dir}. Skipping...")

        print("Waiting 5 seconds before running migrations for the next directory...")
        time.sleep(5)

if __name__ == "__main__":
    main()
