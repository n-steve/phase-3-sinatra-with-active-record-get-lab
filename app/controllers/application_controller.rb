class ApplicationController < Sinatra::Base

  # add routes
 set :default_content_type, 'application/json' 

  get '/bakeries' do
    bakery = Bakery.all 
    bakery.to_json

  end

  get '/bakeries/:id' do
    bakerys = Bakery.find(params[:id])
    bakerys.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
   bake_good = BakedGood.order(:price).reverse_order
    bake_good.to_json
  end

  get '/baked_goods/most_expensive' do
    bake_good = BakedGood.order(:price).reverse_order.first
    bake_good.to_json
  end

end
