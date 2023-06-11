<!doctype html>
<html lang="en">
<head>
<body>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    
    <title>feedback</title>
	
	<link rel = "icon" href ="img/logo.jpg" type = "image/x-icon">
	
	<style>
       .icon-badge-group .icon-badge-container {
          display: inline-block;
        
        }
        .icon-badge-container {
          
          position: absolute;
        }
        .icon-badge-icon {
          font-size: 30px;
          color: rgb(0 0 0 / 50%);
          position: relative;
        }
        .icon-badge {
          background-color: #979797;;
          font-size: 10px;
          color: white;
          text-align: center;
          width: 15px;
          height: 15px;
          border-radius: 49%;
          position: relative;
          top: -35px;
          left: 17px;
        }
      .footer.container-fluid.bg-dark.text-light {
          position:fixed;
          bottom:0;
      }
      .contact2 {
        font-family: "Montserrat", sans-serif;
        color: #8d97ad;
        font-weight: 300;
        /* padding: 60px 0; */
        /* margin-bottom: 170px; */
        background-position: center top;
      }

      .contact2 h1,
      .contact2 h2,
      .contact2 h3,
      .contact2 h4,
      .contact2 h5,
      .contact2 h6 {
        color: #3e4555;
      }

      .contact2 .font-weight-medium {
        font-weight: 500;
      }

      .contact2 .subtitle {
        color: #8d97ad;
        line-height: 24px;
      }

      .contact2 .bg-image {
        background-size: cover;
        position: relative;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
      }

      .contact2 .card.card-shadow {
          -webkit-box-shadow: 0px 0px 30px rgba(115, 128, 157, 0.1);
          box-shadow: 0px 0px 30px rgba(61, 109, 214, 0.774);
      }

      .contact2 .detail-box .round-social {
        margin-top: 100px;
      }

      .contact2 .round-social a {
        background: transparent;
        margin: 0 7px;
        padding: 11px 12px;
      }

      .contact2 .contact-container .links a {
        color: #8d97ad;
      }

      .contact2 .contact-container {
        position: relative;
        top: 107px;
      }

      .contact2 .btn-danger-gradiant {
        background: #ff4d7e;
        background: -webkit-linear-gradient(legacy-direction(to right), #ff4d7e 0%, #ff6a5b 100%);
        background: -webkit-gradient(linear, left top, right top, from(#ff4d7e), to(#ff6a5b));
        background: -webkit-linear-gradient(left, #ff4d7e 0%, #ff6a5b 100%);
        background: -o-linear-gradient(left, #ff4d7e 0%, #ff6a5b 100%);
        background: linear-gradient(to right, #ff4d7e 0%, #ff6a5b 100%);
      }

      .contact2 .btn-danger-gradiant:hover {
        background: #ff6a5b;
        background: -webkit-linear-gradient(legacy-direction(to right), #ff6a5b 0%, #ff4d7e 100%);
        background: -webkit-gradient(linear, left top, right top, from(#ff6a5b), to(#ff4d7e));
        background: -webkit-linear-gradient(left, #ff6a5b 0%, #ff4d7e 100%);
        background: -o-linear-gradient(left, #ff6a5b 0%, #ff4d7e 100%);
        background: linear-gradient(to right, #ff6a5b 0%, #ff4d7e 100%);
      }
    </style>
	</body>
  </head>
 <?php include 'partials/_dbconnect.php';?>
  <?php include 'partials/_nav.php';?>
	
	<!-- Start Contact -->
	
	<div class="contact-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						
						<p>Our Main Goal is Client Satisfaction</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<form  action="" method="post">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
									<div class="help-block with-errors"></div>
								</div>                                 
							</div>
							<!-- <div class="col-md-12">
								<div class="form-group">
									<input type="text" placeholder="Your Email" id="email" class="form-control" name="name" required data-error="Please enter your email">
									<div class="help-block with-errors"></div>
								</div> 
							</div> -->
							<div class="col-md-12">
								<div class="form-group">
									<select class="custom-select d-block form-control" id="guest" name="rev" required data-error="Please Select Person">
									  <option value="Exellent">Exellent</option>
									  <option value="Good">Good</option>
									  <option value="Poor">Poor</option>
									  <option value="Very Poor">Very Poor</option>
									  
									</select>
									<div class="help-block with-errors"></div>
								</div> 
							</div>
							<div class="col-md-12">
								<div class="form-group"> 
									<textarea class="form-control" id="message" placeholder="Your Message" rows="4" name="desc" data-error="Write your message" required></textarea>
									<div class="help-block with-errors"></div>
								</div>
								<div class="submit-button text-center">
									<button name="sb" class="btn btn-common" id="submit" type="submit">Send Message</button>
									<div id="msgSubmit" class="h3 text-center hidden"></div> 
									<div class="clearfix"></div> 
								</div>
							</div>
						</div>            
					</form>
					<?php
					if(isset($_POST['sb']))
					{
						$nm = $_POST['name'];
						$rev = $_POST['rev'];
						$des = $_POST['desc'];
						
						mysqli_query($conn,"insert into review(name, review, description) values('$nm','$rev','$des')");
						echo "<h2 style='color:tomato; text-align:center;'>Data Addedd SuccessFully</h2>";
					}	

					?>





				</div>
			</div>
		
		</div>
	</div>
	<!-- End Contact -->
	 <?php include 'partials/_footer.php';?> 

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTV7x3yYE6aedNXWnkByiL6NTAJuGZExiGq=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>         
    <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
  </body>
</html>
