$(function(){
    $(document).ready(function() {

        // Initialize Bootstrap's tooltip
        $('[data-toggle="tooltip"]').tooltip();

        $('.clear-selection.accommodation').click(function() {
            $('.accommodation-radio').prop('checked', false);
        });

        $('.clear-selection.events').click(function() {
            $('.events-radio').prop('checked', false);
        });
        
        // $('.datetimepicker').datetimepicker();
        
        // $('#datepicker1').datetimepicker( {
        //     format: 'L'
        // });
        
        // $('#datepicker2').datetimepicker( {
        //     format: 'L'
        // });
        
        // $('#trip-info-form').hide();
        
        // $('#trip-info-switch').on('change', function() {
        //     $('#trip-info-form').toggle($('#trip-info-switch').prop('checked'));
        // });
  });
});