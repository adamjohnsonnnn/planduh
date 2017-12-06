      <!-- test Header -->
<header class="w3-display-container w3-content" style="max-width:1500px;">
  <!-- <img class="w3-image" src="https://i.imgur.com/W29FmAv.png" alt="The Hotel" style="min-width:1000px" width="1500" height="800" opacity="50%"> -->
  <div class="w3-display-left w3-padding w3-col l6 m8">
    <div class="w3-container w3-red">
      <h2><i class="fa w3-margin-right"></i>PlanDuh</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="/action_page.php" target="_blank">
        <div class="w3-row-padding" style="margin:0 -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-o"></i> Date</label>
            <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="date" required>
          </div>
          <div class="w3-half">
            <label><i class="fa fa-clock-o"></i> Start Time</label>
            <input class="w3-input w3-border" type="time" placeholder="time start" name="begin_time" required>
          </div>
        </div>
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-clock-o"></i> End Time</label>
            <input class="w3-input w3-border" type="time" ype="time" placeholder="time end" name="end_time" required>
          </div>

          <div class="w3-half">
            <label><i class="fa fa-globe"></i> Where to Begin?</label>
          <input class="w3-input w3-border" type="text" value="0" name="location" placeholder="where to begin? (address,)">
          </div>
        </div>

        <div class="w3-half">
            <label><i class="fa fa-money"></i> Budget</label>
          <input class="w3-input w3-border" type="text" value="0" name="location" placeholder="max budget">
          </div>
        </div>

        <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Go, PlanDuh!</button>
      </form>
    </div>
  </div>
</header>

<!-- test styling ends -->




<!-- original form code -->
<!--
<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style>



<div class="container" >
<h2 class = "form-signin-heading">Make a PlanDuh</h2>

<% if @errors %>
<ul>
  <% @errors.each do |error| %>
    <li><%= error %></li>
  <% end %>
</ul>
<% end %>

<form class="form-signin" action="/itineraries" method="POST">
<p>
  <input type="date" name="date" placeholder="date" class="form-control">
</p>
<p>
  <span>start time:</span>
  <input type="time" name="begin_time" placeholder="time start" class="form-control">
</p>

<p>
  <span>end time:</span>
  <input type="time" name="end_time" placeholder="time end" class="form-control">
</p>

<p>
  <input type="text" name="location" placeholder="Where to begin? (address)" class="form-control">
</p>

<p>
  <input type="number" name="budget" placeholder="Max budget ($)" class="form-control">
</p>

<p>
  <input type="submit" value="Go, PlanDuh!" class="btn btn-lg btn-primary btn-block">
</p>
</form>
</div> -->

      <!-- test Header -->
<!-- <div class="w3-display-container w3-content" style="max-width:1500px;">
  <img class="w3-image" src="https://i.imgur.com/W29FmAv.png" alt="The Hotel" style="min-width:1000px" width="1500" height="800" opacity="50%"> -->
  <!-- <div class="w3-display-left w3-padding w3-col l6 m8"> -->




  <!-- pagination -->


<div id="pag-links">
  <%= link_to_prev_page @questions, "previous" %>
  <%= link_to_next_page @questions, "next" %>
 </div>
