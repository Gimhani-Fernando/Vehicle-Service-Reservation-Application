<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/login.css">
<title> Vehicle Service Reservation App </title>
</head>
<body>
  <body>
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>VEHIVLE SERVICE RESERVATION</h3>
            <p>Please click the button to log in.</p>
          </div>
        </div>
        <form class="login-form" action="loginAction.jsp">
          <button>
          <a href="https://api.asgardeo.io/t/kelaniya/oauth2/authorize?scope=openid address country email phone profile&response_type=code&redirect_uri=http://localhost.com:8080/VehicleServiceReservationApp/oauth2client.jsp&client_id=dgCC0_KvNY9wiUklClVntC9_S4Ua">
          login</a>
          </button>
          <p class="message">You'll be redirected to asgardeo authentication</p>
        </form>
      </div>
    </div>
</body>
</body>
</html>