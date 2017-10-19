# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

'use strict';

$ ->
  width = 300
  animationSpeed = 1500
  pause = 3000
  currentSlide = 1
  $slider = $('.slider')
  $slideContainer = $slider.find('.slides')
  $slides = $slideContainer.find('.slide')
  interval = undefined

  startSlider = ->
    interval = setInterval((->
      $slideContainer.animate { 'margin-left': '-=' + width }, animationSpeed, ->
        currentSlide++
        if currentSlide == $slides.length
          currentSlide = 1
          $slideContainer.css 'margin-left', 0
        return
      return
    ), pause)
    return

  stopSlider = ->
    clearInterval interval
    return

  $slider.on('mouseenter', stopSlider).on('mouseleave', startSlider)
  startSlider()
  return