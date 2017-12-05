
$('#showModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})


$(document).ready(function(){

  $('#itinerary-form').on('submit', function(event){
    event.preventDefault();
    console.log("hello world")


    console.log($(this));
     $form = $(this);
     data = $form.serialize();
     method = "PUT";
     url = $form.attr("action");
     console.log(url)

     $.ajax({
      method: method,
      data: data,
      dataType: "JSON",
      url: url
     }).done(function(response){
      console.log(response.user_id)
      window.location = "/users/" + response.user_id;
     })



  })
})

