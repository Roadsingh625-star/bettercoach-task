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

