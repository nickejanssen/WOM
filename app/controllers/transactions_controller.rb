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
        # current_user.cart_total_price,
        payment_method_nonce: params[:payment_method_nonce])
    end
    if @result && @result.success?
      donation.update(status: true)
      #current_user.purchase_cart_movies!
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully Completed!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
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
