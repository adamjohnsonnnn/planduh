
var Survey = {
  init: function(){
    $("nav.pagination a").on("click", this.nextQuestion);
    $(".js--form input").on("submit", this.submitForm)
  },

  nextQuestion: function(event, response,status, xhr){
    console.log("next page",event)
  },

  submitForm: function(e){
    console.log("HELLO")
    pageNum = $(this).attr("href").match(/page=([0-9]+)/)[1]
    $('.js-form-page').val(pageNum)
    $("form.js--form").submit()

  }

}

$(document).ready(function(){

  Survey.init();

});