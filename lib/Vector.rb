include Math

class Vector3D

	attr_reader :x, :y, :z
	attr_writer :x, :y, :z

	def initialize( x, y, z )
		@x = x
		@y = y
		@z = z
	end

	def to_s
		"(" + @x.inspect() + " " + @y.inspect() + " " +  @z.inspect() + ")"
	end

	def inspect
		"(" + @x.inspect() + ", " + @y.inspect() + ", " +  @z.inspect() + ")"
	end
	
	def zero()
		@x = 0
		@y = 0
		@z = 0
	end
	
	def -@()
		return  Vector3D.new(-@x, -@y, -@z)
	end

	def add!( vec )
		@x += vec.x
		@y += vec.y
		@z += vec.z
	end

	def sub!( vec )
		@x -= vec.x
		@y -= vec.y
		@z -= vec.z
	end

	def +( vec )
		return Vector3D.new( @x + vec.x, @y + vec.y, @z + vec.z )
	end

	def -( vec )
		return Vector3D.new( @x - vec.x, @y - vec.y, @z - vec.z )
	end

	def *( vec )
		return Vector3D.new( @x * vec.x, @y * vec.y, @z * vec.z )
	end

	def /( vec )
		return Vector3D.new( @x / vec.x, @y / vec.y, @z / vec.z )
	end

	def scalarAdd(scalar)
		return Vector3D.new( @x + scalar, @y + scalar, @z + scalar )
	end

	def scalarAdd!( scalar )
		@x += scalar
		@y += scalar
		@z += scalar
	end

	def scalarSub(scalar)
		return Vector3D.new( @x - scalar, @y - scalar, @z - scalar )
	end

	def scalarSub!( scalar )
		@x -= scalar
		@y -= scalar
		@z -= scalar
	end


	def scalarMul(scalar)
		return Vector3D.new( @x * scalar, @y * scalar, @z * scalar )
	end

	def scalarMul!( scalar )
		@x = @x * scalar
		@y = @y * scalar
		@z = @z * scalar
	end

	def scalarDiv(scalar)
		return Vector3D.new( @x / scalar, @y / scalar, @z / scalar )
	end

	def scalarDiv!( scalar )
		@x = @x / scalar
		@y = @y / scalar
		@z = @z / scalar
	end

	def magnitude2
		return @x * @x + @y * @y + @z * @z
	end

	def magnitude
		return sqrt(@x * @x + @y * @y + @z * @z)
	end

	def normalize!
		mag=magnitude
		@x = x / mag
		@y = y / mag
		@z = z / mag
	end
		
end

v=Vector3D.new(1,1,1)
z=Vector3D.new(1,2,3)

puts (v+z).inspect

z.add!(v)
puts z.inspect

puts v.magnitude

z.normalize!
puts z.inspect
puts z.magnitude
