class HooksController < ApplicationController
  def stripe
  end

  def fuckfuck
    data = JSON.parse(request.body.read)
    if data['event_type']['token'] == 'fc6e4fb9f036480c511c0064b39866d4'
      puts "W" * 100
      puts "PUTAIN OUAIS"
      puts "W" * 100
    else
            puts "SHIT" * 100
#      @payment_method = data['charges']['data']['object']['payment_method']['type']
#      msg = 'Tu pago con #{@payment_method} ha sido comprobado'
#      ExampleMailer.email(data, msg)
    end
  end
end
