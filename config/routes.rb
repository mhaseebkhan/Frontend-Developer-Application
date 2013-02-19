FrontendDeveloperTest::Application.routes.draw do

  scope "/api" do
    resources :products
  end

  root to: "frontend#index"
end
