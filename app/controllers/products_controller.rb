class ProductsController < ApplicationController


  def show
    @results = []
 #   if params [:q]
      @search_term = "yosemite"
      response = Etsy::Request.get('/listings/active',
                                  :includes => ['MainImage', 'Shop'],
                                  :keywords => @search_term)

      @count = JSON.parse(response.body)['count']

      @results = JSON.parse(response.body)['results']

      @results = @results.map do |h|
        { mainimage: h["MainImage"]["url_170x135"],
          title: h["title"],
          shop: h["Shop"]["shop_name"],
          price: h["price"],
          currency_code: h["currency_code"]
        }
      end

    render :show
 #   end
end


  # GET /products
  # GET /products.json
  
  def index
  end

  # GET /products/1
  # GET /products/1.json

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product]
    end
end
