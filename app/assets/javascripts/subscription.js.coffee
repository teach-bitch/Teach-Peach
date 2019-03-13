jQuery ->
  Stripe.setPublishableKey('pk_test_ml02wDB4M9310OGZocBmwspl')
  $('#payment-form').submit (event) ->
    $form = $(this)
    # Disable the submit button to prevent repeated clicks
    $form.find('button').prop 'disabled', true
    # Prevent form submittion
    Stripe.card.createToken $form, stripeResponseHandler
    false
  return
