<%@page import="config.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String bookingId = request.getParameter("bookingId");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("DELETE FROM vehicle_service WHERE booking_id = ?");
    ps.setString(1, bookingId);
    ps.executeUpdate();

    response.sendRedirect("delete-upcoming-reservation.jsp?msg=done"); // Redirect back to the reservations page

} catch (Exception e) {
	System.out.println(e);
    response.sendRedirect("delete-upcoming-reservation.jsp?msg=wrong"); // Redirect back to the reservations page
}
%>
