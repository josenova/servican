

$(document).ready(function(){

/******************************************** DASHBOARD ****************************************/

// Search for clients

$("#search").keyup(function(e) {

  var q = $("#search").val();

  $.getJSON("/clients?name=" + q, function(data) {

    $("#counter").html(data.length.toString() + " resultados.");
    $("#client_list").empty();

    for (var i = 0; i < data.length; i++) { 

          $('#client_list').append('<li><a href="#" id="' + data[i].id + '">' + data[i].name + '</a></li>');
        
    }  
  });          
});


// Load single client

$('#client_list').delegate('a', 'click', function() {

  var id = $(this).attr('id');

  $.getJSON("/clients/" + id, function(data) {
      console.log(data);
      $('.column#second').show();
      $('#details h5').html(data.name);
      $('#details .email').html(data.email);
      $('#details .phone').html(data.phone).text(phone_mask(data.phone));
      $('#details .cellphone').html(data.cellphone).text(phone_mask(data.cellphone));

      $("#pets").empty();

      if (data.patients.length > 0) {        

        for (var i = 0; i < data.patients.length; i++) { 
          $('#pets').append('<li><a href="#" id="' + data.patients[i].id + '">' + data.patients[i].name + '<span>' + data.patients[i].breed.name + '</span></a></li>');
        }
        
      } else {
        $('#pets').html('Sin mascotas.');
      }

  });
});


// Mask phone numbers
function phone_mask(number) {
  number = number.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
  return number;
}

/******************************************** END DOC READY *****************************************/  
   

}); // END DOCUMENT READY










/****************************************** RESIZE FUNCTION *******************************************/

       

