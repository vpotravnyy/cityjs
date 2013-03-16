define (require, exports, module) ->
	
	# Packages loading	
	demoPackage = require 'packages/demo'
	confMapPackage = require 'packages/conf-map'
	
	#Utils and other
	Utils = require 'shared/utils'

	if module.config().fakeServer
		server = require 'server'
		server.start()

	exports.App = Backbone.Router.extend {
		routes:
			'*other': 'unknownRoute'

		initialize: ->
			Utils.bindRoutes @, [
				demoPackage.Controller
        confMapPackage.Controller
			]

		unknownRoute: ->
			console.log 'unknown'
	}
	return
