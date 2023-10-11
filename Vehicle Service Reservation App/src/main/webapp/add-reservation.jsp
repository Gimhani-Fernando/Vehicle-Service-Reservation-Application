<%@include file="includes/header.jsp"%>

<% String username =  (String)request.getSession().getAttribute("username"); %>

<div class="container">
	<div class="row">
        <div class="col-md-12">
        	<div class="card">
        		<div class="card-header">
        			<h4>Add Reservation</h4>
        		</div>
        		<div class="card-body">
        			<form action="add-reservation-action.jsp" method="post">
	        			<div class="row">
	        				<div class="col-md-12 mb-3">
						        <label for="username">Username</label>
								<!-- Display the username as non-editable text -->
                                <input type="text" name="username" value="<%= username %>" class="form-control" readonly>

						    </div>
						    <div class="col-md-6 mb-3">
						        <label for="date">Date</label>
						        <input type="date" name="date" placeholder="Enter date" class="form-control" required>
						    </div>
						    <div class="col-md-6 mb-3">
						        <label for="time">Time</label>
						        <select name="time" class="form-control" required>
						            <option value="10:00:00">10:00 A.M.</option>
						            <option value="11:00:00">11:00 A.M.</option>
						            <option value="12:00:00">12:00 P.M.</option>
						        </select>
						    </div>
						    <div class="col-md-12 mb-3">
						        <label for="location">Location</label>
						        <select name="location" class="form-control" required>
						            <option value="Ampara">Ampara</option>
						            <option value="Anuradhapura">Anuradhapura</option>
						            <option value="Badulla">Badulla</option>
						            <option value="Batticaloa">Batticaloa</option>
						            <option value="Colombo">Colombo</option>
						            <option value="Galle">Galle</option>
						            <option value="Gampaha">Gampaha</option>
						            <option value="Hambantota">Hambantota</option>
						            <option value="Jaffna">Jaffna</option>
						            <option value="Kalutara">Kalutara</option>
						            <option value="Kandy">Kandy</option>
						            <option value="Kegalle">Kegalle</option>
						            <option value="Kilinochchi">Kilinochchi</option>
						            <option value="Kurunegala">Kurunegala</option>
						            <option value="Mannar">Mannar</option>
						            <option value="Matale">Matale</option>
						            <option value="Matara">Matara</option>
						            <option value="Monaragala">Monaragala</option>
						            <option value="Mullaitivu">Mullaitivu</option>
						            <option value="Nuwara Eliya">Nuwara Eliya</option>
						            <option value="Polonnaruwa">Polonnaruwa</option>
						            <option value="Puttalam">Puttalam</option>
						            <option value="Ratnapura">Ratnapura</option>
						            <option value="Trincomalee">Trincomalee</option>
						            <option value="Vavuniya">Vavuniya</option>					            
						        </select>
						    </div>  
						    <div class="col-md-6 mb-3">
						        <label for="vehicle_reg_number">Vehicle Registration Number</label>
						        <input type="text" name="vehicle_reg_number" placeholder="Enter vehicle registration number" class="form-control" required>
						    </div>
						    <div class="col-md-6 mb-3">
						        <label for="mileage">Current Mileage</label>
						        <input type="text" name="mileage" placeholder="Enter current mileage" class="form-control" required>
						    </div>          	
						    <div class="col-md-12 mb-3">
						        <label for="message">Message</label>
						        <textarea rows="3" name="message" placeholder="Enter message" class="form-control" required></textarea>
						    </div>
						    <div>
						    	<button type="submit" class="btn btn-primary" name="add_reservation_btn">Save</button>
						    </div>
	        			</div>
	        		</form>	
        		</div>
        	</div>
        </div>
	</div>      
</div>


<script>
    // JavaScript for date validation
    document.getElementById('date').addEventListener('change', function () {
        var selectedDate = new Date(this.value);
        var currentDate = new Date();
        
        // Check if the selected date is after the current date and not a Sunday (where 0 is Sunday, 1 is Monday, etc.)
        if (selectedDate <= currentDate || selectedDate.getDay() === 0) {
            document.getElementById('date-error').innerText = 'Please select a valid date (after today and not a Sunday).';
        } else {
            document.getElementById('date-error').innerText = '';
        }
    });
</script>
    
<%@include file="includes/footer.jsp"%>