class FrontendDeveloperTest.Models.Product extends Backbone.Model
  paramRoot: 'product'

class FrontendDeveloperTest.Collections.ProductsCollection extends Backbone.Collection
  model: FrontendDeveloperTest.Models.Product
  url: '/api/products'
