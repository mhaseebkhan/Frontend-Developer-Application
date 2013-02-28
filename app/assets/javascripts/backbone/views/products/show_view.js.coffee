FrontendDeveloperTest.Views.Products ||= {}

class FrontendDeveloperTest.Views.Products.ShowView extends Backbone.View
  el: '#products-container'
  template: JST["backbone/templates/products/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
