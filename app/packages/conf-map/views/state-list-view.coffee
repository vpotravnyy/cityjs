define (require, exports, module)->
	StateView = require './state-view'
	tpl = require 'text!../templates/state-list-view.html'
	mapSvg = require 'text!../templates/map.svg'

	class StateListView extends Backbone.View
		id = 'stateListView'
		template: _.template tpl

		initialize: ->
			super
			console.log @collection
			@listenTo @collection, 'sync', @render


		render: ->
			@$el.html @template()

			container = $ "<ul class='list'>"
			for stateModel in @collection.models
				container.append new StateView(model: stateModel).render().$el
			@$el.append container

			@initMap @$el.find ".map"
			return @


		initMap: ($map)=>
			mapTpl = _.template mapSvg
			$map.html mapTpl()

			$map.find(".state").on 'click', (event)=>
				alert $(event.target).data("name")

			window.oblast = $map.find(".state").eq(0)
			$map.find(".state").each (el)->

				top = $(@).offset().top - $map.offset().top
				left = $(@).offset().left - $map.offset().left
				nameBox = "
					<div 
						class='name' 
						style='
							top: #{top}px;
							left: #{left}px;'>
								#{$(@).data('name')}
					</div>"
				$map.append nameBox

			$('#path22').popover
				trigger: "click"
				title: "Ололоевская область"
				content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque totam architecto ratione delectus eius saepe facilis accusamus sed corporis quas dolor numquam blanditiis laudantium fuga voluptas error quaerat ex aperiam!"
			



