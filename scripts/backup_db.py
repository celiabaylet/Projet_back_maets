import os
import subprocess
from datetime import datetime
from pathlib import Path
from urllib.parse import urlparse

# === CONFIGURATION ===
POSTGRES_CONTAINER = "maets_postgres"  
MONGO_CONTAINER = "maets_mongo"  
BACKUP_DIR = Path("backups")  

# === Récupération de la base PostgreSQL depuis DATABASE_URL ===
database_url = os.getenv("DATABASE_URL", "postgres://maets:maets@localhost:5432/maets_dev")
parsed = urlparse(database_url)
POSTGRES_USER = parsed.username
POSTGRES_PASSWORD = parsed.password
POSTGRES_DB = parsed.path.lstrip("/")  
POSTGRES_HOST = parsed.hostname
POSTGRES_PORT = parsed.port or 5432

MONGO_URI = os.getenv("MONGO_URI", "mongodb://localhost:27017/maets")
MONGO_DB = urlparse(MONGO_URI).path.lstrip("/")

# === CRÉATION DU DOSSIER DYNAMIQUE ===
today = datetime.now().strftime("%Y-%m-%d_%H-%M")
backup_path = BACKUP_DIR / today
backup_path.mkdir(parents=True, exist_ok=True)

postgres_file = backup_path / "backup_postgres.sql"
mongo_file = backup_path / "backup_mongo.archive"

print(f" Dossier de sauvegarde : {backup_path}\n")

# === FONCTIONS ===
def run_command(cmd, output_file=None):
    try:
        if output_file:
            with open(output_file, "wb") as f:
                subprocess.run(cmd, shell=True, check=True, stdout=f)
        else:
            subprocess.run(cmd, shell=True, check=True)
        print(f" Commande réussie : {cmd}")
    except subprocess.CalledProcessError as e:
        print(f" Erreur lors de l’exécution : {cmd}")
        print(e)

# === SAUVEGARDE POSTGRESQL ===
print(" Sauvegarde de PostgreSQL...")
cmd_postgres = (
    f'docker exec {POSTGRES_CONTAINER} sh -c '
    f'"PGPASSWORD={POSTGRES_PASSWORD} pg_dump -U {POSTGRES_USER} -d {POSTGRES_DB}"'
)
run_command(cmd_postgres, postgres_file)

# === SAUVEGARDE MONGODB ===
print("\n Sauvegarde de MongoDB...")
cmd_mongo = (
    f'docker exec {MONGO_CONTAINER} sh -c '
    f'"mongodump --db={MONGO_DB} --archive"'
)
run_command(cmd_mongo, mongo_file)

# === FIN ===
print("\n Sauvegardes terminées avec succès !")
print(f" Fichiers :\n - {postgres_file}\n - {mongo_file}")
