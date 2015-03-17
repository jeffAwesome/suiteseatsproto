// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require lib/underscore
//= require lib/backbone
//= require lib/backbone.marionette
//= require backbone/app
//= require_tree ./backbone/apps
//
			$(document).ready(function() {
				$('.menu').click(function() {
						$('.mobilemenu').slideToggle("fast");
						$(this).toggleClass('menu');
						$(this).toggleClass('closemenu');
				});
				$('.closemenu').click(function() {
						$('.mobilemenu').slideToggle("fast");
						$(this).toggleClass('closemenu');
						$(this).toggleClass('menu');
				});
			});


