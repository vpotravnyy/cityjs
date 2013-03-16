define (require, exports, module) ->

	class StateModel extends Backbone.Model
		urlRoot: "/state"
		