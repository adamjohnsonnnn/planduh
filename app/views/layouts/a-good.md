<!doctype html>
<html lang="en">
  <head>
    <title>PlanDuh</title>
    <%= csrf_meta_tags %>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%= stylesheet_link_tag    'application', media: 'all' %>
    <%= javascript_include_tag 'application' %>
  </head>
  <body>
   <sec
   tion class="body-container">
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
  </body>
</html>