class BitcoinsController < ApplicationController

  def index
    bitcoin = params["amount"]

    # connect to the Coindesk API
    # DON'T CHANGE THIS CODE
    # ----------------------
    require "net/http"
    require "json"
    url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    bitcoin_data = JSON.parse(response)
    # ----------------------
  
    # using Coindesk API, extract current rate of bitcoin in USD
    @usd_rate = (bitcoin_data["bpi"]["USD"]["rate_float"]).truncate(2)
  
    # calculate value in USD of user's bitcoin
    @usd_value = (@usd_rate * bitcoin.to_f).truncate(2) #much include the @ in front of every instance for that shared variable. It's like if it was spelled differently

  end
  
end