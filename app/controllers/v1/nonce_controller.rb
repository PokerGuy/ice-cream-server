class V1::NonceController < ApplicationController
  def index
    @nonce = Braintree::ClientToken.generate
  end
end
