import requests
from requests.auth import HTTPBasicAuth

# Your Azure DevOps organization URL (change it accordingly)
organization_url = 'https://dev.azure.com/devops2'

# Personal Access Token (PAT)
personal_access_token = 'dasljkdl131jdm1oid1h20ddsmd10'

# Authentication using the PAT (Basic authentication with empty username)
auth = HTTPBasicAuth('', personal_access_token)

# API endpoint to get a list of projects
api_url = f'{organization_url}/_apis/projects?api-version=7.1-preview.1'

# Make the GET request
response = requests.get(api_url, auth=auth)

# Check if the request was successful
if response.status_code == 200:
    projects = response.json()
    print("Projects in your Azure DevOps Organization:")
    for project in projects['value']:
        print(f"- {project['name']}")
else:
    print(f"Failed to fetch data: {response.status_code} - {response.text}")
