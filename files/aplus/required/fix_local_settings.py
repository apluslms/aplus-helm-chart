import os, sys

GRADER_EXTRA_HOSTNAMES = os.environ.get("GRADER_EXTRA_HOSTNAMES")
if GRADER_EXTRA_HOSTNAMES == None:
  sys.exit()

lines_to_insert = ['    "{}": "grader",\n'.format(hostname) for hostname in GRADER_EXTRA_HOSTNAMES.split(',') if hostname != ""]
  

with open("/a-plus/aplus/local_settings.py", "r") as f:
  lines = f.readlines()

idx = [idx for idx in range(len(lines)) if lines[idx].startswith("URL_TO_ALIAS")]
if len(idx) != 1:
  sys.exit()
idx = idx[0] + 1
for line in lines_to_insert:
  lines.insert(idx, line)
with open("/a-plus/aplus/local_settings.py", "w") as f:
  contents = "".join(lines)
  f.write(contents)
