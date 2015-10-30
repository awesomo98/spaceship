require 'gosu'
require_relative 'z_order'

class Alien
	attr_reader :x, :y

	def initialize
		@image = Gosu::Image.new("media/alien.jpg")
		@x = rand * 640
		@y = rand * 480
	end

	def draw
		@image.draw(@x, @y, ZOrder::ALIEN)
	end
end