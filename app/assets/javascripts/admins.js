

$(document).ready(function(){

/******************************************** DASHBOARD ****************************************/

// SEARCH CLIENTS

$("#search").keyup(function(e) {

  var q = $("#search").val();

  $.getJSON("/clients?name=" + q, function(data) {

    $("#first .counter").html(data.length.toString() + " resultados.");
    $("#client_list").empty();

    for (var i = 0; i < data.length; i++) { 

          $('#client_list').append('<li><a href="#" id="' + data[i].id + '">' + data[i].name + '</a></li>');
        
    }  
  });          
});



// show client

$('#client_list').delegate('a', 'click', function() {
  var id = $(this).attr('id');
  showPatients(id);
  $('#new_pet #client_id').attr("value", id);
});


// create client form callback

$('#new_client').on('ajax:success',function(e, data, status, xhr){

    $(this).parent().hide();
    
  }).on('ajax:error',function(e, xhr, status, error){
      // error
});


// PATIENTS
// get patients
function showPatients(id) {

  $.getJSON("/clients/" + id, function(data) {
      console.log('showpatients')
      $('.column#second').show();
      $('.column#third').hide();

      $('#profile h5').html(data.name);
      $('#profile .email').html(data.email);
      $('#profile .phone').html(data.phone).text(phone_mask(data.phone));
      $('#profile .cellphone').html(data.cellphone).text(phone_mask(data.cellphone));

      $("#pets").empty();
      $("#second .counter").html(data.patients.length + " pacientes.");

      if (data.patients.length > 0) {        

        for (var i = 0; i < data.patients.length; i++) { 
          $('#pets').append('<li><a href="#" id="' + data.patients[i].id + '">' + data.patients[i].name + '<span>' + data.patients[i].breed.name + '</span></a></li>');
        }
        
      } else {
        $('#pets').html('Sin mascotas.');
      }

  });

}

// delete patient

$('#pet_profile').delegate('.delete', 'click', function() {
  var id = $(this).attr('id');

  $(this).parent().remove();

  $.ajax({
    url: '/appointments/' + id,
    type: 'DELETE'
  });

});


// create patient form callback

$('#new_pet').on('ajax:success',function(e, data, status, xhr){
    
    var id = $(this).children('#client_id').attr('value');

    $(this).parent().hide();
    showPatients(id);
    
  }).on('ajax:error',function(e, xhr, status, error){
      // error
});






// APPOINTMENTS

// show patient

$('#pets').delegate('a', 'click', function() {
  var id = $(this).attr('id');
  showAppointments(id);
  $('#new_appointment #patient_id').attr("value", id);
  $('#pet_profile').attr("value", id);
});


// get appointments
function showAppointments(id) {

  $.getJSON("/patients/" + id, function(data) {

      $('.column#third').show();

      $('#pet_profile h5').html(data.name);

      $("#appointments").empty();
      $("#third .counter").html(data.appointments.length + " citas.");

      if (data.appointments.length > 0) {        

        for (var i = 0; i < data.appointments.length; i++) { 
          $('#appointments').append('<li><span class="date">' + data.appointments[i].date + '</span><span class="reason"> ' + data.appointments[i].reason + '</span><a class="delete" id="'+ data.appointments[i].id +'">x</a></li>');
        }
        
      } else {
        $('#appointments').html('Sin citas.');
      }

  });

}

// delete appointment

$('#appointments').delegate('a', 'click', function() {
  var id = $(this).attr('id');

  $(this).parent().remove();

  $.ajax({
    url: '/appointments/' + id,
    type: 'DELETE'
  });

});


// client form callback

$('#new_appointment').on('ajax:success',function(e, data, status, xhr){
    
    var id = $(this).children('#patient_id').attr('value');

    $(this).parent().hide();
    showAppointments(id);
    
  }).on('ajax:error',function(e, xhr, status, error){
      // error
});




// FORMS

// Show Forms
$('.add').click(function() {
  $(this).parent().parent().children('.dark').show();
});

// Close Forms
$('.close').click(function() {
  $(this).parent().hide();
});








//HELPERS

// Mask phone numbers
function phone_mask(number) {
  number = number.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
  return number;
}

// Gender to string
function gender_mask(foo) {
  if (foo) {
    return "- Macho";
  } else {
    return '- Hembra';
  }
}
/******************************************** END DOC READY *****************************************/  
   

}); // END DOCUMENT READY












       

