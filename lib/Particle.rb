require 'Vector'

class Particle

	attr_reader :force, :pos, :vel, :accel, :mass, :name
	attr_writer :force, :pos, :vel, :accel, :mass, :name

	def initialize( name, mass, pos, vel )
		@name=name
		@mass=mass
		@pos=pos
		@vel=vel
		@accel=Vector3D.new(0.0,0.0,0.0)
		@force=Vector3D.new(0.0,0.0,0.0)
	end

    #
    # Compute the gravitation attraction of other on this particle.
    #
    def computeGravitationalForce( other )
        #
        # The delta position vector
        #
        deltaS = other.pos - self.pos
		
        #
        # Get the sq of the distance.
        #
        distance2 = deltaS.magnitude2

		#
        # Get the distance
        #
        distance = sqrt(distance2)

        #
        # Normalize the position vector
        #
        components = deltaS.scalarDiv(distance)

        #
        # Now compute the total force of gravity
        #
        g = 10.0 * self.mass * other.mass / distance2

        #
        # Compute the components of the force
        #
        components.scalarMul!(g)

        return components
    end


	def inspect
		"Particle: " + @name + " pos: " + @pos.inspect +
		" vel: " + @vel.inspect + " accel: " + @accel.inspect 
	end
	
	def to_s
		return inspect	
	end
	

end

p1=Particle.new( "one", 10, Vector3D.new(0,0,0), Vector3D.new(1,2,3) )
p2=Particle.new( "two", 10, Vector3D.new(0,0,1), Vector3D.new(1,2,3) )
puts 'here it is'
puts p1.inspect
puts p2.inspect
puts p2.computeGravitationalForce(p1)
