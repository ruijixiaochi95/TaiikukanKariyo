$(document).on('change', '#facility-select', function() {
  var facilityId = $(this).val();
  
  $.ajax({
    url: '<%= url_for([@gym, :reservations]) %>',
    method: 'GET',
    data: { facility_id: facilityId },
    success: function(response) {
      // 取得したデータを使用してページを更新する処理をここに追加する
    },
    error: function(xhr, status, error) {
      // エラーハンドリングの処理をここに追加する
    }
  });
});