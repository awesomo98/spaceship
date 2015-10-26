require "gosu"
require_relative 'z_order'

class Laser
	attr_accessor :x, :y, :width, :height, :speed
  
  # def self.load_sound(window)
  #   @fire_sound ||= Gosu::Sample.new(window, 'media/laser.wav')
  # end
  
  def initialize(window, ship, x, y, color1 = 0xffd936f1, color2 = 0xff000000)
    @window = window
    @ship = ship
    @x = x
    @y = y
    @width = 2
    @height = 20
    @speed = 10.0
    @image = Gosu::Image.new("media/laser.gif")
    # @color1 = Gosu::Color.new(color1)
    # @color2 = Gosu::Color.new(color2)
    # @snd = self.class.load_sound(@window)
    # @muted = false
  end
  
  # def update
  #   @y -= @speed
  #   if (@x > @window.width or @y > @window.height or @x < 0.0 or @y < 0.0)
  #     @ship.remove_shot(self)
  #   end
  # end
  
  def draw    
    @image.draw(@x, @y, ZOrder::LASERS)
  end

  
end

