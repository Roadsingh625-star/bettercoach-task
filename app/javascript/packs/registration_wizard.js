$(document).on('turbolinks:load', function() {
    // Initially hide Step 2 form and show Step 1 form
    $('#step2-form').hide();
    $('#step1-form').show();
  
    // Handle Step 1 form submission
    $('#step1-next').on('click', function(event) {
      event.preventDefault();
      // Validate Step 1 fields
      let companyId = $('#company-select').val(); // Use company-select ID
      let companyProgramId = $('#company_program_id').val(); // Use company_program_id ID

      if (companyId === '') {
        alert('Please select a company.');
      } else if (companyProgramId === '') {
        alert('Please select a company program.');
      } else {
        // If Step 1 is valid, hide Step 1 form and show Step 2
        $('#step1-form').hide();
        $('#step2-form').show();
      }
    });
  
    // Handle back to Step 1 from Step 2
    $('#step2-back').on('click', function(event) {
      event.preventDefault();
      // Hide Step 2 and show Step 1
      $('#step2-form').hide();
      $('#step1-form').show();
    });
  
    // Handle Step 2 form submission
    $('#step2-submit').on('click', function(event) {
      event.preventDefault();
      // Validate Step 2 fields
      let firstName = $('#first_name').val();
      let lastName = $('#last_name').val();
      let coachId = $('#coach_id').val();
  
      if (firstName.trim() === '') {
        alert('Please enter your first name.');
      } else if (lastName.trim() === '') {
        alert('Please enter your last name.');
      } else if (coachId === '') {
        alert('Please select a coach.');
      } else {
        // If Step 2 is valid, submit the form
        $('#registration-form').submit(); // Ensure your form ID matches this
      }
    });
});
