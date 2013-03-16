define (require, exports, module)->
	BaseController = require 'shared/base_controller'
	StateCollection = require "./models/state-collection"
	StateListView = require "./views/state-list-view"

	exports.Controller = class Controller extends BaseController
		routes:
			'conf-map': 'index'
			'conf-map/:id': 'index'

		index: (params)->
			@stateCollection = new StateCollection()
			@stateCollection.fetch()
			
			@stateListView = new StateListView
				collection: @stateCollection
			$("#demo-box").html @stateListView.render().$el
			return @

	return