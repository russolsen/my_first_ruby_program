
require 'Particle'
require 'Euler'
require 'Camera'

class Simulator

	attr_reader :particles
	
	def initialize(particles)
		#
		# Array of particles.
		#
		@particles=particles
		#
		# Strategy object for doing the integration
		#
		@integrator=Euler.new
	end
	
	#
	# Compute the distnaces squared between all the particles.
	# d squared is used in serveral of the calculations, so we
	# compute and store it in one step.
	#
	def computeForces
	
		#
		# First Clear out the forces on the particles
		#
		for p1 in @particles
			p1.force.zero()
		end
		
		for p1 in @particles
			for p2 in @particles
				if ( p1 == p2 )
					break
				end
				
				#
        			# The delta position vector
        			#		
        			deltaS = p2.pos - p1.pos
		
        			#
        			# Get the sq of the distance.
        			#
        			distance2 = deltaS.magnitude2

				#
        			# Get the distance
        			#
        			distance = sqrt(distance2)
				
				if ( distance > 100 )
        				#
        				# Normalize the position vector
        				#
        				force = deltaS.scalarDiv(distance)

        				#
        				# Now compute the total force of gravity
        				#
        				g = 10.0 * p1.mass * p2.mass / distance2

        				#
        				# Compute the components of the force
        				#
        				force.scalarMul!(g)

        				p1.force.add!( force )
					p2.force.sub!( force )
				end
			end
		end
	end

    #
    # Compute the gravitation attraction of other on this particle.
    #
    def computeGravitationalForce( p1, p2 )
 


    end
	
	def stepSimluaton(deltaT)
		computeForces()
		for p in @particles
			@integrator.stepSimluaton(p,deltaT)
		end
	end
		

end




