import Foundation

// Replace with your Azure DevOps organization and PAT
let organization = "ascent"
let personalAccessToken = "qqsxsxjqblyk4u7kriekgyrdjzyf6vea3qh2z7r4lxqttfveg9us"

// Base URL for Azure DevOps API
let baseURL = "https://dev.azure.com/\(organization)/_apis/projects?api-version=7.1-preview.1"

// Function to make API call
func getProjects() {
    // Prepare the URL
    guard let url = URL(string: baseURL) else { return }
    
    // Create a URLRequest object
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    // Add Authorization header with the Personal Access Token
    let authValue = "Basic \(Data(":" + personalAccessToken).base64EncodedString())"
    request.setValue(authValue, forHTTPHeaderField: "Authorization")
    
    // Start the network request
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
}

// Call the function to get the projects
getProjects()

// Keep the program running to wait for the async response
RunLoop.main.run()
