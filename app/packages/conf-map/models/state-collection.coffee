define (require, exports, module) ->
	StateModel = require "./state-model"

	class StateCollection extends Backbone.Collection
		url: "/state"
		model: StateModel
		