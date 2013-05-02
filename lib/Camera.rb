require 'ClanRuby'
require 'Vector'
require 'Particle'
require 'Euler'


class Camera

	attr_reader :particles, :scale, :x0,  :y0
	attr_writer  :particles,  :scale , :x0,  :y0
	
	def initialize(particles, scale, x0, y0)
		#
		# Particles we will be rendering.
		#
		@particles = particles
		#
		# scale facor: world to scale pixels
		#
		@scale = scale
		#
		# location of upper left of sceen, in word coords
		#
		@x0=x0
		@y0=y0
	end
	
	#
	# Render the particles on the display according
	# to the scale and offset simply ignores the z coord
	#
	def render()

		i=0
		for p in particles
			x = ( p.pos.x - @x0) * @scale
			y = ( p.pos.y - @y0) * @scale
			renderPoint( p.name, x, y, p.mass/3000.0, 1, 1)
			i=i+1
		end
	end
	
	#
	# Given a single point in screen coords, draw it on the
	# display
	#
	def renderPoint(name, x, y, r, g, b)
		
		Display.fillRect( x, y, x+2, y+2, r, g, b, 1)
		
	end
			

		

end






