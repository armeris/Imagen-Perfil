# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@cropImage = (target, container, coordinateContainer, topCoord, leftCoord) ->
	$(container).draggable({containtment:'parent'	})
	$(container).bind('drag',(e) ->
		cropCutFromTop = $(container).position($(coordinateContainer).position()).top;
		cropCutFromLeft = $(container).position($(coordinateContainer).position()).left;
		$(topCoord).val(cropCutFromTop);
		$(leftCoord).val(cropCutFromLeft);
	);