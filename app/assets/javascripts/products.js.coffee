window.FrontendDeveloperTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new FrontendDeveloperTest.Routers.ProductsRouter(products: [])
    Backbone.history.start()
