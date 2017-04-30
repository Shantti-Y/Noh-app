# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
   # Execute appearing and disappearing bar menu alternatively
   drp_btn  = $('#dropdown-btn')
   drp_menu = $('#dropdown-menu')
   drp_btn.on "click", () ->
      if drp_menu.css('display') == 'none'
         drp_menu.css { 'display': 'block'; }
      else
         drp_menu.css { 'display': 'none'; }

   $(window).resize ->
      if this.innerWidth >= 670
         drp_menu.css { 'display': 'none'; }
