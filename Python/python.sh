import os

# Directory where log files are stored
log_dir = "/var/log"   # You can change this as needed

# Size threshold in MB
size_limit_mb = 100

for filename in os.listdir(log_dir):
    if filename.endswith(".log"):
        file_path = os.path.join(log_dir, filename)
        file_size_mb = os.path.getsize(file_path) / (1024 * 1024)

        if file_size_mb > size_limit_mb:
            os.remove(file_path)
            print(f"Removed heavy log file: {filename} ({file_size_mb:.2f} MB)")
        else:
            print(f"File {filename} is OK ({file_size_mb:.2f} MB)")


# git branch
git branch devops
git checkout devops
git checkout -b future
git branch -d future
git push origin 
