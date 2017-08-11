class ScrapperController < ApplicationController
  require 'rest-client'
  require 'nokogiri'

  def fetch_and_add
    product_url = params["product_url"]

    request = RestClient.get "#{product_url}"
    doc = Nokogiri::HTML request.body

    title = doc.search("#productTitle").text.strip
    price = doc.search("#priceblock_ourprice").text
    image = doc.at_css(".imgTagWrapper img").attr('src')
    features = doc.search("#feature-bullets ul .a-list-item").text.gsub!(/\t/, '').split("\n").reject(&:blank?)
    number_of_reviews = doc.search("#acrCustomerReviewText").text.to_i
    # best_seller_rank =
    @product = Product.create(
      title: title,
      price: price,
      images: image,
      features: features,
      number_of_reviews: number_of_reviews
      )
    render json: @product.to_json
  end
end