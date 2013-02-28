FrontendDeveloperTest::Application.routes.draw do

  devise_for :user

  scope "/api" do
    resources :products
  end

  root to: "frontend#index"
end
