
var Survey = {
  init: function(){
    $("nav.pagination a").on("click", this.nextQuestion);
    $(".js--form input").on("submit", this.submitForm)
  },

  nextQuestion: function(event, response,status, xhr){
    console.log("next page",event)
  },



}

$(document).ready(function(){

  Survey.init();

});