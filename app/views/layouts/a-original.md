<!DOCTYPE html>
<html>
  <head>
    <title>RailsRegistrationSkeleton</title>
    <%= csrf_meta_tags %>
    <!-- Begin requirement for bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <!-- End requirement for bootstrap -->

    <%= stylesheet_link_tag    'application', media: 'all' %>
    <%= javascript_include_tag 'application' %>
  </head>

  <body>
    <section class="body-container">
    <nav id="js-main-header class="main-header main-header--static">
      <ul>
      <% if logged_in? %>
          <li>Welcome, <%= link_to "#{current_user.first_name}",  @current_user %></li>
         | <li><%= link_to "Logout", logout_path %></li>
         | <li><%= link_to "Home", root_path %></li>
      <% else %>
         | <li><%= link_to "Register", new_user_path %></li>
         | <li><%= link_to "Login", new_session_path %></li>
         | <li><%= link_to "Home", root_path %></li>
      <% end %>
      </ul>
    </nav>

    <div class="layout-header">Title</div>
    <%= yield %>
  </section>


  <!-- Begin requirement for bootstrap -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<!-- end requirement for bootstrap -->
  </body>
</html>
