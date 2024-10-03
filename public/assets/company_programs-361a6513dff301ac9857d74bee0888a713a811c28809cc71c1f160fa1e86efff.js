function fetchCompanyPrograms(companyId) {
  const companyProgramSelect = $('#company-program-select');
  if (companyId) {
    $.ajax({
      url: `/company_programs/${companyId}`,
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        companyProgramSelect.empty();
        companyProgramSelect.append('<option value="">Choose a company program</option>'); 
        $.each(data, function(show, program) {
          companyProgramSelect.append(`<option value="${program.id}">${program.name}</option>`);
        });
      },
      error: function(error) {
        console.error('Error fetching company programs:', error);
      }
    });
  } else {
    companyProgramSelect.empty();
    companyProgramSelect.append('<option value="">Choose a company program</option>');
  }
}


$(document).ready(function() {
  // Listen for changes on the company program select element
  $('#company-program-select').change(function() {
    var selectedProgramId = $(this).val();
    
    // Call fetchCompanyCoaches with the selected program ID
    fetchCompanyCoaches(selectedProgramId);
  });
  
  // Function to fetch coaches for the selected company program
  function fetchCompanyCoaches(companyProgramId) {
    var coachSelect = $('#coach-select');
    if (companyProgramId) {
      $.ajax({
        url: '/company_programs/' + companyProgramId + '/coaches',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
          coachSelect.empty(); // Clear any existing options
          
          // Add a default option
          coachSelect.append('<option value="">Choose a coach</option>');
          
          // Loop through the fetched data and append each coach as an option
          $.each(data, function(index, coach) {
            coachSelect.append(new Option(coach.name, coach.id));
          });
        },
        error: function() {
          alert('Error fetching coaches.');
        }
      });
    } else {
      // Clear the dropdown if no company program is selected
      coachSelect.empty();
      coachSelect.append('<option value="">Choose a coach</option>');
    }
  }
});
