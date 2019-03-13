jQuery ->
<<<<<<< HEAD
  Stripe.setPublishableKey( $("meta[name='stripe-key']").attr("content"))

=======
  Stripe.setPublishableKey('pk_test_ml02wDB4M9310OGZocBmwspl')
>>>>>>> 8c0db5ef87ee0c6f8eb7fc27cc1e8d1ee5c43fc1
  $('#payment-form').submit (event) ->
    $form = $(this)
    # Disable the submit button to prevent repeated clicks
    $form.find('button').prop 'disabled', true
    # Prevent form submittion
    Stripe.card.createToken $form, stripeResponseHandler
    false
<<<<<<< HEAD

stripeResponseHandler = (status, response) ->
  $form = $('#payment-form')
  if response.error
    $form.find('.payment-errors').text response.error.message
    $form.find('button').prop 'disabled', false
  else
    token = response.id
    $form.append $('<input type="hidden" name="stripeToken" />').val(token)
    $form.get(0).submit()
=======
>>>>>>> 8c0db5ef87ee0c6f8eb7fc27cc1e8d1ee5c43fc1
  return
