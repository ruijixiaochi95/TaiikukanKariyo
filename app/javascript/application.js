$(document).on("change", "#facility-select", function() {
  var facilityId = $(this).val();
  if (facilityId) {
    $.ajax({
      url: "/gym_facility_reservations",
      method: "GET",
      data: { facility_id: facilityId },
      dataType: "script"
    });
  }
});