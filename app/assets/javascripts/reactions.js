$(function() {
  $('input[id=reaction_gif]').change(function() {
    console.log("changed!");
    $('#pretty-input').val($(this).val().replace("C:\\fakepath\\", ""));
  });
});
