require 'Vector'
require 'Particle'


class Euler

	def stepSimluaton(particle, deltaT)

		particle.accel = (particle.force.scalarDiv(particle.mass))
		particle.vel.add!( particle.accel.scalarMul(deltaT) )
		particle.pos.add!( particle.vel.scalarMul(deltaT) )
	end

end
