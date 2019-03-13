jQuery ->
  Stripe.setPublishableKey( $("meta[name='stripe-key']").attr("content"))

  $('#payment-form').submit (event) ->
    $form = $(this)
    # Disable the submit button to prevent repeated clicks
    $form.find('button').prop 'disabled', true
    # Prevent form submittion
    Stripe.card.createToken $form, stripeResponseHandler
    false

stripeResponseHandler = (status, response) ->
  $form = $('#payment-form')
  if response.error
    $form.find('.payment-errors').text response.error.message
    $form.find('button').prop 'disabled', false
  else
    token = response.id
    $form.append $('<input type="hidden" name="stripeToken" />').val(token)
    $form.get(0).submit()
  return
