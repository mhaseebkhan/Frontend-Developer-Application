class FrontendDeveloperTest.Routers.ProductsRouter extends Backbone.Router
  initialize: (options) ->
    @products = new FrontendDeveloperTest.Collections.ProductsCollection()
    @products.fetch()
    @products.reset options.products

  routes:
    "new"      : "newProduct"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newProduct: ->
    @view = new FrontendDeveloperTest.Views.Products.NewView(collection: @products)
    $("#products").html(@view.render().el)

  index: ->
    @view = new FrontendDeveloperTest.Views.Products.IndexView(products: @products)
    $("#products").html(@view.render().el)

  show: (id) ->
    product = @products.get(id)

    @view = new FrontendDeveloperTest.Views.Products.ShowView(model: product)
    $("#products").html(@view.render().el)

  edit: (id) ->
    product = @products.get(id)

    @view = new FrontendDeveloperTest.Views.Products.EditView(model: product)
    $("#products").html(@view.render().el)
