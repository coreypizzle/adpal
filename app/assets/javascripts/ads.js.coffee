# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  ad.setupForm()

 ad = 
 	setupForm: ->
 		$('#new_ad').submit ->
 			$('input[type=submit]').attr('disabled', true)
 			if $('#card_number').length
 				ad.processCard()
 				false
 			else
 				true

 	processCard: ->
 		card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, ad.handleStripeResponse)

  handleStripeResponse: (status, response) ->
  	if status == 200
  		$('#ad_stripe_card_token').val(response.id)
  		$('#new_ad')[0].submit()
  	else
  		alert(response.error.message)
  		$('input[type=submit]').attr('disabled', false)