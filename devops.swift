import Foundation

// Entry point: defining a function to encapsulate all logic
func fetchAzureDevOpsProjects() {
    // Replace with your Azure DevOps organization and PAT
    let organization = "ascent"
    let personalAccessToken = "qqsxsxjqblyk4u7kriekgyrdjzyf6vea3qh2z7r4lxqttfveg9us"
    
    // Base URL for Azure DevOps API
    let baseURL = "https://dev.azure.com/\(organization)/_apis/projects?api-version=7.1-preview.1"
    
    // Prepare the URL
    guard let url = URL(string: baseURL) else {
        print("Invalid URL")
        return
    }
    
    // Create a URLRequest object
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    // Add Authorization header with the Personal Access Token
    let authValue = "Basic " + Data((":".utf8) + personalAccessToken.data(using: .utf8)!).base64EncodedString()
    request.setValue(authValue, forHTTPHeaderField: "Authorization")
    
    // Perform the network request asynchronously
    DispatchQueue.global(qos: .userInitiated).async {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            // Try to decode the response into JSON (projects list)
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Projects: \(jsonResponse)")
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        
        task.resume()
        
        // Keep the program running to wait for async response
        RunLoop.main.run()
    }
}

// Call the function inside a valid context (to prevent top-level code execution)
fetchAzureDevOpsProjects()
