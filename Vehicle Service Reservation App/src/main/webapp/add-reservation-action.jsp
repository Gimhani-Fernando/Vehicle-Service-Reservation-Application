<%@page import="config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%
//Retrieve form data
String username = request.getParameter("username");
String dateStr = request.getParameter("date");
String time = request.getParameter("time");
String location = request.getParameter("location");
String vehicleRegNumber = request.getParameter("vehicle_reg_number");
String mileageStr = request.getParameter("mileage");
String message = request.getParameter("message");

//Perform basic form validation (you may need to add more validation)
//if (username == null || dateStr == null || time == null || location == null || vehicleRegNumber == null
//        || mileageStr == null || message == null) {
//    response.sendRedirect("error.jsp"); // Redirect to an error page
//    return;
//}

try{
	// Convert String to Date
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date utilDate = sdf.parse(dateStr);
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

    // Convert String to Integer (for mileage)
    int mileage = Integer.parseInt(mileageStr);
    		
 	// Convert String time to java.sql.Time
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    java.util.Date parsedTime = timeFormat.parse(time);
    java.sql.Time sqlTime = new java.sql.Time(parsedTime.getTime());

    // Perform database operations (insertion) here using the retrieved data
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into vehicle_service (date, time, location, vehicle_no, mileage, message, username) values(?,?,?,?,?,?,?)");
	// Set parameters for the prepared statement
    ps.setDate(1, sqlDate); 
    ps.setTime(2, sqlTime);
    ps.setString(3, location);
    ps.setString(4, vehicleRegNumber);
    ps.setInt(5, mileage);
    ps.setString(6, message);
    ps.setString(7, username);

    // Execute the SQL query
    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
        // Redirect to a success page or perform any other necessary action
        //response.sendRedirect("success.jsp");
    	response.sendRedirect("add-reservation.jsp?msg=valid");
    } else {
        // Redirect to an error page
        //response.sendRedirect("error.jsp");
    	response.sendRedirect("add-reservation.jsp?msg=Invalid");

    }

    // Close the resources
    ps.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    // Redirect to an error page
    //response.sendRedirect("error.jsp");
	response.sendRedirect("add-reservation.jsp?msg=exception");

}
	
%>