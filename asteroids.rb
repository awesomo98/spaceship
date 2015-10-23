require "gosu"
require_relative 'z_order'
require_relative 'star'

class Asteroids

	
	def initialize
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@image = Gosu::Image.new("media/trump.jpg")
	end

	def draw
		@image.draw(@x, @y, ZOrder::ASTEROIDS, @angle)
	end
end