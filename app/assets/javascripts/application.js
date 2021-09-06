// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require bootstrap-select
//= require popper
//= require bootstrap
//= require_tree .

$(document).on('turbolinks:load', function () {

  // to load select-box-rails
  $(window).trigger('load.bs.select.data-api');


  $(document).ready(function () {
    var banner = $("#wrapper")
    var button = $("#menu-toggle")

    // handle click and add class
    button.on("click", () => {
      // alert("adfasf")
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


