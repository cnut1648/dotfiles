import subprocess
from pathlib import Path
backup = Path("backup")
# get current username
username = Path.home().name
# iterate over all files in backup folder
for file in backup.glob("**/*"):
    if not file.is_file():
        continue
    dest = str(file).replace("USERNAME", username).replace("backup", "")
    Path(dest).parent.mkdir(parents=True, exist_ok=True)
    print("src:", file, "dest:", dest)
    # subprocess.run(["cp", "-r", file, dest])
    subprocess.run(["rm", "-r", dest])
