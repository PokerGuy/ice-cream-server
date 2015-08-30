if Rails.env.production?
  Braintree::Configuration.environment = :production
else
  Braintree::Configuration.environment = :sandbox
end
Braintree::Configuration.merchant_id = ENV["braintree_merchant_id"]
Braintree::Configuration.public_key = ENV["braintree_public_key"]
Braintree::Configuration.private_key = ENV["braintree_private_key"]