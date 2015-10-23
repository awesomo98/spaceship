require "gosu"
require_relative 'z_order'
require_relative 'star'

class Bomb
	attr_reader :x, :y

	
	def initialize
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@image = Gosu::Image.new("media/trump.jpg")
		@x = rand * 640
		@y = rand * 480
	end

	def draw
		@image.draw(@x, @y, ZOrder::BOMBS)
	end

	# def warp(x, y)
	# 	@x, @y = x, y
	# end
	
	def explode
		if bomb
			
		end
	end
end