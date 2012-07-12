require 'RMagick'

class HomeController < ApplicationController
  def index
  end

  def crop
    # Load image
  	image = Magick::Image.read("#{Rails.root}/public/imagen.jpg").first

    # We set the width and height of the cropped image
  	width = 400
  	height = 400
  	columns = image.columns
  	rows = image.rows

    # If there is no top position or it is greater than 0 we set it to 0
  	if !params[:hdnInpTop] or params[:hdnInpTop].to_i > 0
  		top = 0
  	else
  		top = - params[:hdnInpTop].to_i
  	end

    # If there is no left position or it is greater than 0 we set it to 0
  	if !params[:hdnInpLeft] or params[:hdnInpLeft].to_i > 0
  		left = 0
  	else
  		left = - params[:hdnInpLeft].to_i
  	end

    # We set a maximum top position, so we always fill the desired area
  	if top + height > rows
  		top = rows - height
  	end

    # We set a maximum top position, so we always fill the desired area
  	if left + width > columns
  		left = columns - width
  	end

    # We crop the image width rmagick
  	image.crop!(left,top,width,height)

    # Save the new image in a new file
  	new_file = File.new("#{Rails.root}/public/imagen2.jpg","wb")
  	new_file.write image.to_blob
  	new_file.close

  	respond_to do |format|
  		format.js
  	end
  end
end
