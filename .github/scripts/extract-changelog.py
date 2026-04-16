import re
import sys

html_path = sys.argv[1] if len(sys.argv) > 1 else "/tmp/original.html"

with open(html_path) as f:
    html = f.read()

m = re.search(r'<ul class="changelog-list">(.*?)</ul>', html, re.DOTALL)
if not m:
    print("（無 changelog）")
    sys.exit(0)

items = re.findall(r'<li>(.*?)</li>', m.group(1), re.DOTALL)
for item in items:
    text = re.sub(r'<[^>]+>', '', item).strip()
    print(f"- {text}")
