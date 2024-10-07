import requests
from datetime import datetime, timezone

# Docker Hub API URL
username = "jenkins"
repository = "jenkins"
url = f"https://hub.docker.com/v2/repositories/{username}/{repository}/tags/lts-jdk21"

def get_tags():
    response = requests.get(url)
    return response.json()

def check_for_updates():
    last_updated = get_tags()["last_updated"]
    last_updated_time = datetime.strptime(last_updated, "%Y-%m-%dT%H:%M:%S.%fZ").replace(tzinfo=timezone.utc)
    
    # 현재 시간
    now = datetime.now(timezone.utc)
    
    # 업데이트된 지 24시간 이내인 태그를 찾음
    if (now - last_updated_time).total_seconds() < 86400:  # 86400초 = 24시간
        print("OK")
    else:
        print("KO")

check_for_updates()