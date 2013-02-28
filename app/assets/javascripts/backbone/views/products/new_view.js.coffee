FrontendDeveloperTest.Views.Products ||= {}

class FrontendDeveloperTest.Views.Products.NewView extends Backbone.View
  el: '#products-container'
  template: JST["backbone/templates/products/new"]

  events:
    "submit #new-product": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (product) =>
        @model = product
        window.location.hash = "/#{@model.id}"

      error: (product, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
