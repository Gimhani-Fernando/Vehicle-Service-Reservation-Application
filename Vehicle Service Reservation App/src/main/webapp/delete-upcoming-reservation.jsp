<%@page import="config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="includes/header.jsp"%>

<div class="container">
	<div class="row">
        <div class="col-md-12">
        	<div class="card">
        		<div class="card-header">
        			<h4>Upcoming Reservations</h4>
        		</div>
        		<div class="card-body">
        			<%
						try {
							Connection con = ConnectionProvider.getCon();
							PreparedStatement ps = con.prepareStatement("select * from vehicle_service where username='Hotaru' and date >= ?");
							ps.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
							ResultSet rs = ps.executeQuery();

							if (rs.next()) {
					%>
        			<table class="table table-bordered table-striped">
        				<thead>
        					<tr>
        						<th>Booking ID</th>
        						<th>Date</th>
        						<th>Time</th>
        						<th>Location</th>
        						<th>Vehicle Number</th>
        						<th>Mileage</th>
        						<th>Message</th>
        						<th>Username</th>
        					</tr>
        				</thead>      						
        				<tbody>
        					<%
								do {
							%>
        					<tr>
        						<td><%=rs.getString(1) %></td>
        						<td><%=rs.getString(2) %></td>
        						<td><%=rs.getString(3) %></td>
        						<td><%=rs.getString(4) %></td>
        						<td><%=rs.getString(5) %></td>
        						<td><%=rs.getString(6) %></td>
        						<td><%=rs.getString(7) %></td>
        						<td><%=rs.getString(8) %></td>
        						<td>
        							<form action="delete-upcoming-reservation-action.jsp" method="post">
                                        <input type="hidden" name="bookingId" value="<%=rs.getString(1) %>">
                                        <button type="submit" class="btn btn-primary">Delete</button>
                                    </form>
        						</td>
        					</tr>
        					<%
								} while (rs.next());
							%>
        				</tbody>
        			</table>
        			<%
						} else {
					%>
					<p>No upcoming reservations found.</p>
					<%
						}
					} catch (Exception e) {
						System.out.println(e);
					}
					%>
        		</div>
        	</div>
        </div>
	</div>      
</div>

<%@include file="includes/footer.jsp"%>
