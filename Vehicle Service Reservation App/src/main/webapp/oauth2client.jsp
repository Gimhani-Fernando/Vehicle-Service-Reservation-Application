<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="config.Config" %>

<%
    // Extract the authorization code from the request parameters
    String authorizationCode = request.getParameter("code");

    // Check if the authorization code is not null or empty
    if (authorizationCode != null && !authorizationCode.isEmpty()) {
    	// Use the configuration parameters from Config.java
        String clientId = Config.getClientId();
        String clientSecret = Config.getClientSecret();
        String redirectUri = Config.getRedirectUri();
        String tokenEndpoint = Config.getTokenEndpoint();


        try {
            // Construct the request data for token exchange
            String requestData = "code=" + authorizationCode +
                    "&grant_type=authorization_code" +
                    "&client_id=" + clientId +
                    "&client_secret=" + clientSecret +
                    "&redirect_uri=" + URLEncoder.encode(redirectUri, "UTF-8");

            // Create a URL object for the token endpoint
            URL tokenUrl = new URL(tokenEndpoint);

            // Open a connection to the token endpoint
            HttpURLConnection tokenConnection = (HttpURLConnection) tokenUrl.openConnection();

            // Set the request method to POST
            tokenConnection.setRequestMethod("POST");

            // Enable input/output streams
            tokenConnection.setDoOutput(true);

            // Write the request data to the output stream
            try (DataOutputStream tokenOutputStream = new DataOutputStream(tokenConnection.getOutputStream())) {
                tokenOutputStream.writeBytes(requestData);
                tokenOutputStream.flush();
            }

            // Get the response code from the token endpoint
            int tokenResponseCode = tokenConnection.getResponseCode();

            // Read the response data from the token endpoint
            try (BufferedReader tokenReader = new BufferedReader(new InputStreamReader(tokenConnection.getInputStream()))) {
                String tokenInputLine;
                StringBuilder tokenResponse = new StringBuilder();

                while ((tokenInputLine = tokenReader.readLine()) != null) {
                    tokenResponse.append(tokenInputLine);
                }

             	// Handle the response data here
                String responseDataStr = tokenResponse.toString();
                
                // Parse the response data as JSON
                JSONObject jsonResponse = new JSONObject(responseDataStr);

                // Extract access_token and id_token
                String access_token = jsonResponse.getString("access_token");
                String id_token = jsonResponse.getString("id_token");

                // Store tokens in session attributes
                request.getSession().setAttribute("access_token", access_token);
                request.getSession().setAttribute("id_token", id_token);
                
                response.sendRedirect("home.jsp");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        // Handle the case where the authorization code is not present
        out.println("Authorization code is missing.");
    }
%>
