require "gosu"
require_relative 'z_order'
require_relative 'star'
require_relative 'bomb'

class Player

	TURN_INCREMENT = 4.5
	ACCELERATION = 0.5
	COLLISION_DISTANCE = 35
	EXPLODING_DISTANCE = 25

	def initialize
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@score = 0
		@image = Gosu::Image.new("media/diver2.png")
		@beep = Gosu::Sample.new("media/poot.wav")
		@explosion = Gosu::Sample.new("media/exploscream.wav")
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def turn_left
		@angle -= TURN_INCREMENT
	end

	def turn_right
		@angle += TURN_INCREMENT
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, ACCELERATION)
		@vel_y += Gosu::offset_y(@angle, ACCELERATION)
	end

	def move
		@x += @vel_x
		@y += @vel_y

		@x %= 640
		@y %= 480

		@vel_x *= 0.95
		@vel_y *= 0.95
	end

	def draw
		@image.draw_rot(@x, @y, ZOrder::PLAYER, @angle)
	end

	def score
		@score
	end

	def collect_stars(stars)
		if stars.reject! {|star| colliding?(star)	}
			@score += 10
			@beep.play
			true
		else
			false
		end
	end

	def get_exploded(bombs)
		if bombs.reject! {|bomb| exploding?(bomb) }
			@score -= 50
			@explosion.play
			true
		else
			false
		end
	end

	private

		def colliding?(star)
			Gosu::distance(@x, @y, star.x, star.y) < COLLISION_DISTANCE
		end

		def exploding?(bomb)
			Gosu::distance(@x, @y, bomb.x, bomb.y) < EXPLODING_DISTANCE
		end

end