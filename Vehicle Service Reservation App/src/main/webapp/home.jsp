<%@include file="includes/header.jsp"%>
<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page import="org.json.JSONObject" %>
<%
    // Extract the access_token and id_token from session attribute
        String accessToken = (String) request.getSession().getAttribute("access_token");
        String idToken = (String) request.getSession().getAttribute("id_token");

    // Check if the access token is not null or empty
    if (accessToken != null && !accessToken.isEmpty()) {
        // Define userinfo endpoint
        String userinfoEndpoint = "https://api.asgardeo.io/t/kelaniya/oauth2/userinfo";
        String introspectionEndpoint ="https://api.asgardeo.io/t/kelaniya/oauth2/introspect";


        try {
            // Create a URL object for the userinfo endpoint
            URL userinfoUrl = new URL(userinfoEndpoint);

            // Open a connection to the userinfo endpoint
            HttpURLConnection userinfoConnection = (HttpURLConnection) userinfoUrl.openConnection();

            // Set the request method to GET
            userinfoConnection.setRequestMethod("GET");

            // Set the Authorization header with the access token
            userinfoConnection.setRequestProperty("Authorization", "Bearer " + accessToken);

            // Get the response code from the userinfo endpoint
            int userinfoResponseCode = userinfoConnection.getResponseCode();

            // Read the response data from the userinfo endpoint
            try (BufferedReader userinfoReader = new BufferedReader(new InputStreamReader(userinfoConnection.getInputStream()))) {
                String userinfoInputLine;
                StringBuilder userinfoResponse = new StringBuilder();

                while ((userinfoInputLine = userinfoReader.readLine()) != null) {
                    userinfoResponse.append(userinfoInputLine);
                }

                // Parse the userinfo response data as JSON
                JSONObject userinfoJson = new JSONObject(userinfoResponse.toString());

                // Extract user information
                String username = userinfoJson.optString("username");
                String firstName = userinfoJson.optString("given_name");
                String lastName = userinfoJson.optString("family_name");
                String email = userinfoJson.optString("email");
                String contactNumber = userinfoJson.optString("phone_number");
             	// Extract the address object
                JSONObject addressJson = userinfoJson.optJSONObject("address");

                // Initialize country as an empty string (or any default value)
                String country = "";

                // Check if the address object is not null
                if (addressJson != null) {
                    // Retrieve the country from the address object
                    country = addressJson.optString("country");
                }

             	// Set the username as a session attribute
                request.getSession().setAttribute("username", username);

                // Display user information
%>

<div class="container">
	<div class="row">
        <div class="col-md-12">
        	<h3>Profile</h3>
        	<br>
        	<br>
        	<div class="row">
		      	<div class="col-lg-10 col-sm-1">
		        	<div class="card  mb-2">
		  				<div class="card-header p-4 pt-2">
						    <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark shadow text-center border-radius-xl mt-n4 position-absolute">
						      <i class="material-icons opacity-10">badge</i>
						    </div>
						    <div class="text-end pt-1">
						      <p class="text-sm mb-0 text-capitalize">USERNAME</p>
						      <h4 class="mb-0"><%= username %></h4>
						    </div>
						</div>
					</div>
		
		        	<div class="card  mb-2">
					  	<div class="card-header p-4 pt-2">
					    	<div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary shadow text-center border-radius-xl mt-n4 position-absolute">
					      	  <i class="material-icons opacity-10">perm_identity</i>
					    	</div>
							<div class="text-end pt-1">
						      <p class="text-sm mb-0 text-capitalize">NAME</p>
						      <h4 class="mb-0"><%= firstName +" "+lastName %></h4>
						    </div>
					  	</div>
					</div>
					
					<div class="card  mb-2">
					  	<div class="card-header p-4 pt-2 bg-transparent">
					    	<div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
					      	  <i class="material-icons opacity-10">alternate_email</i>
					    	</div>
					    	<div class="text-end pt-1">
						      <p class="text-sm mb-0 text-capitalize">EMAIL</p>
						      <h4 class="mb-0"><%= email %></h4>
						    </div>
					  	</div>
					</div>
			
			        <div class="card mb-2">
					  	<div class="card-header p-4 pt-2 bg-transparent">
					    	<div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
					      	  <i class="material-icons opacity-10">settings_phone</i>
					    	</div>
					    	<div class="text-end pt-1">
						      <p class="text-sm mb-0 text-capitalize">CONTACT NO</p>
						      <h4 class="mb-0"><%= contactNumber %></h4>
						    </div>
					  	</div>
					</div>
					
					<div class="card  mb-2">
					  	<div class="card-header p-4 pt-2">
					    	<div class="icon icon-lg icon-shape bg-gradient-secondary shadow-primary shadow text-center border-radius-xl mt-n4 position-absolute">
					      	  <i class="material-icons opacity-10">flag</i>
					    	</div>
							<div class="text-end pt-1">
						      <p class="text-sm mb-0 text-capitalize">COUNTRY</p>
						      <h4 class="mb-0"><%= country %></h4>
						    </div>
					  	</div>
					</div>
					
					
			    </div>
		
	    	</div>
    	</div>
	</div>      
</div>
    
<%@include file="includes/footer.jsp"%>
<%
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        // Handle the case where the access token is not present
        out.println("Access token is missing.");
    }
%>