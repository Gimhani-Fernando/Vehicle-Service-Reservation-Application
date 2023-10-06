 <footer class="footer pt-5">
      <div class="container-fluid">
        <div class="row align-items-center justify-content-lg-between">
          <div class="col-lg-6">
            <ul class="nav nav-footer justify-content-center justify-content-lg-end">
              <li class="nav-item">
                © <script>
                document.write(new Date().getFullYear())
              </script>,
              made with <i class="fa fa-heart"></i> by
              <a href="" class="font-weight-bold" target="_blank">Gimhani Fernando</a>
              </li>
            </ul>
	       </div>   
        </div>
      </div>
    </footer>
  </main>
  
	  <script src="../assets/js/bootstrap.bundle.min"></script>
	  <script src="../assets/js/perfect-scrollbar.min.js"></script>
  	  <script src="../assets/js/smooth-scrollbar.min.js"></script>
  
	  <!-- Alertify JS -->
	  <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	  
	  <script>
	  <!--???????????????????if session is set only put this
			  if(session.getAttribute(message)!=null){-->
		  alertify.set('notifier','position', 'top-right');
		  alertify.success('display session message');
		  <!--unset(session(message))-->
	  </script>
	  
	</body>
</html>