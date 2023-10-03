<%@include file="includes/header.jsp"%>

<div class="container">
	<div class="row">
        <div class="col-md-12">
        	<div class="card">
        		<div class="card-header">
        			<h4>Add Reservation</h4>
        		</div>
        		<div class="card-body">
        			<div class="row">
        				<div class="col-md-12">
					        <label for="username">Username</label>
					        <input type="text" name="username" placeholder="Enter username" class="form-control" required>
					    </div>
					    <div class="col-md-6">
					        <label for="date">Date</label>
					        <input type="date" name="date" placeholder="Enter date" class="form-control" required>
					    </div>
					    <div class="col-md-6">
					        <label for="time">Time</label>
					        <select name="time" class="form-control" required>
					            <option value="10AM">10 AM</option>
					            <option value="11AM">11 AM</option>
					            <option value="12PM">12 PM</option>
					        </select>
					    </div>
					    <div class="col-md-12">
					        <label for="location">Location</label>
					        <select name="location" class="form-control" required>
					            <option value="district1">District 1</option>
					            <option value="district2">District 2</option>
					        </select>
					    </div>  
					    <div class="col-md-6">
					        <label for="vehicle_reg_number">Vehicle Registration Number</label>
					        <input type="text" name="vehicle_reg_number" placeholder="Enter vehicle registration number" class="form-control" required>
					    </div>
					    <div class="col-md-6">
					        <label for="mileage">Current Mileage</label>
					        <input type="text" name="mileage" placeholder="Enter current mileage" class="form-control" required>
					    </div>          	
					    <div class="col-md-12">
					        <label for="message">Message</label>
					        <textarea rows="3" name="message" placeholder="Enter message" class="form-control" required></textarea>
					    </div>
        			</div>
        			
        		</div>
        	</div>
        </div>
	</div>      
</div>
    
<%@include file="includes/footer.jsp"%>