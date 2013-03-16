define (require, exports, module)->
	tpl = require 'text!../templates/state-view.html'

	class StateView extends Backbone.View
		template: _.template tpl
		tagName: 'li'
		className: 'stateView'

		render: ->
			@$el.html @template data: @model.attributes
			return @