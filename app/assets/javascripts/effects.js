$(function(){
    $(document).ready(function() {
        
        $('#trip-info-form').hide();
        
        $('#trip-info-switch').on('change', function() {
            $('#trip-info-form').toggle($('#trip-info-switch').prop('checked'));
        });
  });
});