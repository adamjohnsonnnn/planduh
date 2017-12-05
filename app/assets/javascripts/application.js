// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require underscore
//= require gmaps/google
//= require_tree .


$('#showModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget)
  var recipient = button.data('whatever')
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})

$(document).ready(function(){

  $('#itinerary-form').on('submit', function(event){
    event.preventDefault();

     $form = $(this);
     data = $form.serialize();
     method = "PUT";
     url = $form.attr("action");

     $.ajax({
      method: method,
      data: data,
      dataType: "JSON",
      url: url
     }).done(function(response){
      window.location = "/users/" + response.user_id;
     })
  })
})
