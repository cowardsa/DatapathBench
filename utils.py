import shutil
import re
import subprocess
################################################################################
# Helper Functions
################################################################################
def run(cmd, stdout=None):
    """Run a shell command and optionally redirect stdout."""
    if stdout:
        with open(stdout, 'w') as f:
            subprocess.run(cmd, shell=True, stdout=f, stderr=subprocess.STDOUT)
    else:
        subprocess.run(cmd, shell=True, check=True)

def can_run_command(command):
    """Check if a command is available on the system."""
    return shutil.which(command) is not None

def grep_stat(filename, pattern, group=1):
    """Extract a number from a file using a regex pattern."""
    with open(filename) as f:
        for line in f:
            m = re.search(pattern, line)
            if m:
                return m.group(group)
    return ""