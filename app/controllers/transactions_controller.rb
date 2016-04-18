class TransactionsController < ApplicationController
  # before_action :authenticate_user!


  def new
    gon.client_token = generate_client_token
  end

  def create
    payer
    donation = Transaction.new(amount: payer[:amount], name: payer[:name])
    if donation.save
      @result = Braintree::Transaction.sale(
        amount: payer[:amount],
        :customer => {:first_name => payer[:name]},
        payment_method_nonce: params[:payment_method_nonce])
    end
    if @result && @result.success?
      donation.update(status: true)
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully Completed!"
    else
      err = []
      donation.errors.messages.each do |key,val|
        err << key.to_s.capitalize + " " + val[0].to_s
      end
      flash[:alert] = err.join("<br/>").html_safe
      gon.client_token = generate_client_token
      render :new
    end

  end


  private
  def generate_client_token
    Braintree::ClientToken.generate
  end

  def payer
    payer = {}
    payer[:amount] = params[:donate]
    if !user_signed_in?
      payer[:name] = params[:donate_name]
    else
      payer[:name] = current_user.name
    end
    payer
  end

end
