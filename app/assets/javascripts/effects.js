$(function(){
    $(document).ready(function() {
        
        $('.datetimepicker').datetimepicker();
        
        $('#datepicker1').datetimepicker( {
            format: 'L'
        });
        
        $('#datepicker2').datetimepicker( {
            format: 'L'
        });
        
        $('#trip-info-form').hide();
        
        $('#trip-info-switch').on('change', function() {
            $('#trip-info-form').toggle($('#trip-info-switch').prop('checked'));
        });
  });
});