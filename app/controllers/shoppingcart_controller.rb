class ShoppingcartController < ApplicationController
  def index
    @categories = get_response('https://fakestoreapi.com/products/categories').prepend('All Categories')
    @products = get_response('https://fakestoreapi.com/products')
  end

  def product_list
    category_name = params[:category]
    if category_name == 'All Categories'
      @products = get_response('https://fakestoreapi.com/products')
    else
      @products = get_response("https://fakestoreapi.com/products/category/#{ERB::Util.url_encode(category_name)}")
    end
    render partial: 'product', collection: @products, as: :product
  end

  def add_cart
    @product = get_response("https://fakestoreapi.com/products/#{params[:product_id]}")
  end

  private
  def get_response(url)
    response = HTTParty.get(url)
    response.success? ? JSON.parse(response.body) : []
  end
end
