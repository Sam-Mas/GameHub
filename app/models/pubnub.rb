class Pubnub

pubnub = Pubnub.new(
    :publish_key   => 'demo', # publish_key only required if publishing.
    :subscribe_key => 'demo', # required always
    :secret_key    => nil,    # optional - message signing
    :cipher_key    => nil,    # optional - AES 256 Crypto
    :ssl           => true    # optional - SSL 2048bit
)

end
