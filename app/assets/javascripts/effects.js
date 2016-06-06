$(function(){
    $(document).ready(function() {
        
        //dropdown lists initializer
        $('select').material_select();
        
        //datepicker initializer
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
        });
        
        $('#trip-info-form').hide();
        
        $('#trip-info-switch').on('change', function() {
            $('#trip-info-form').toggle($('#trip-info-switch').prop('checked'));
        });
  });
});