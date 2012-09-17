$(function() {
  $('.todos li').on('change', 'input[type="checkbox"]', function() {
    var todo = $(this).parent('li');
    var todoId = todo.attr('data-id');

    $.post('/todos/' + todoId + '/completion', {
      success: function() {
        todo.addClass('complete');
        return;
      }
    });
  });
});
