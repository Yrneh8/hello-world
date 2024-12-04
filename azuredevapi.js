// Define the Azure DevOps URL and your Personal Access Token (PAT)
const orgName = "ascent";  // Replace with your Azure DevOps organization name
const projectName = "ascension";   // Replace with your Azure DevOps project name
const pat = "qqsxsxjqblyk4u7kriekgyrdjzyf6vea3qh2z7r4lxqttfveg9uz"; // Replace with your Personal Access Token
const apiUrl = `https://dev.azure.com/${orgName}/${projectName}/_apis/wit/workitems?api-version=7.1-preview.1`;

// Create base64-encoded authorization header using the PAT
const authHeader = "Basic " + btoa(":" + pat);

// Call Azure DevOps REST API to get work items
fetch(apiUrl, {
    method: 'GET',
    headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/json'
    }
})
    .then(response => {
        if (!response.ok) {
            throw new Error("Failed to fetch work items: " + response.statusText);
        }
        return response.json();  // Parse JSON response
    })
    .then(data => {
        console.log("Work Items:", data);  // Handle the response data here
    })
    .catch(error => {
        console.error("Error calling Azure DevOps API:", error);
    });
