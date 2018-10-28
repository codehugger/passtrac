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
//= require Chart.bundle
//= require chartkick
//= require_tree .

setTimeout(function() {
  var chart = Chartkick.charts["chart-1"];

  jQuery.get('/assets.json', function (data) {
    var positions = [];

    for (i=0; i < data.length; i++) {
      positions.push(data[i].position);
    }

    chart.updateData([
      {name: "Antennas", data: [[0,0], [0,20], [20,0], [20,20]]},
      {name: "Assets",   data: positions }]
    );
  });

}, 5000);
