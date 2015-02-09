Rails.application.routes.draw do
  resource :products, :only => [:index, :show]
end