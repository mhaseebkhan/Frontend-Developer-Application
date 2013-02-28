FrontendDeveloperTest.Views.Products ||= {}

class FrontendDeveloperTest.Views.Products.EditView extends Backbone.View
  el: '#products-container'
  template: JST["backbone/templates/products/edit"]

  events:
    "submit #edit-product": "update"

  initialize: ->
    @render()

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (product) =>
        @model = product
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON()))

    this.$("form").backboneLink(@model)

    return this
