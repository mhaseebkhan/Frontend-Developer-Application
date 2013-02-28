FrontendDeveloperTest.Views.Products ||= {}

class FrontendDeveloperTest.Views.Products.IndexView extends Backbone.View
  el: "#products-container"
  template: JST["backbone/templates/products/index"]

  initialize: () ->
    @options.products.bind('reset', @addAll)

  addAll: () =>
    @options.products.each(@addOne)

  addOne: (product) =>
    view = new FrontendDeveloperTest.Views.Products.ProductView({model : product})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(products: @options.products.toJSON() ))
    @addAll()

    return this
