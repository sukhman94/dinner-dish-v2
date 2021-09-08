$(document).on('turbolinks:load', function () {
  // to load select-box-rails
  $(window).trigger('load.bs.select.data-api');


  $(document).ready(function () {
    var banner = $("#wrapper")
    var button = $("#menu-toggle")

    // handle click and add class
    button.on("click", function () {
      banner.toggleClass("toggled")
    })
  });

  $(document).ready(function () {
    $('select#category_id').bind('change', function () {
      val = $(this).val()
      $('.items_by_cat li:not(.' + val + ')').hide();
      $('.items_by_cat li.' + val).show();
    });
  });

  $(document).ready(function () {
    setTimeout(function () {
      $('.noti').fadeOut('fast');
    }, 3000);
    $('select#status').bind('change', function () {
      val = $(this).val()
      $('tbody tr:not(.' + val + ')').hide();
      $('tbody tr.' + val).show();
    });
  });
});
