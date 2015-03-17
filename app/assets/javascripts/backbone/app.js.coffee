@Seats = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    footerRegion: "#footer"
    contentRegion: "#content"


  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()


  #use ruby like implicit return...
  # This will return the app object
  App
