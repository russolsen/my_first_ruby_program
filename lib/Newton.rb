require 'ClanRuby'
require 'Vector'
require 'Particle'
require 'Euler'
require 'Camera'
require 'Simulator'

include ClanRuby
include Math


#
# Initialize the core and display libs.
#
SetupCore.init()
SetupDisplay.init()

#
# Create an 640 X 480 window, 16 bits of color.
#
Display.setVideoMode( 800, 600, 16, false )

#
# Set up the simulation
#
#p=[ Particle.new( 'aaa', 900, Vector3D.new( 20,0,0), Vector3D.new(0,0,0) ),
 #     Particle.new( 'bbb', 10, Vector3D.new( 200,100,0), Vector3D.new(5,0,0) ),
#      Particle.new( 'bbb', 10, Vector3D.new( 170,100,0), Vector3D.new(0,6,0) ),
#      Particle.new( 'bbb', 10, Vector3D.new( 200,240,0), Vector3D.new(0,0,0) ),
#      Particle.new( 'bbb', 10, Vector3D.new( 240,10,0), Vector3D.new(0,0,0) ),
#      Particle.new( 'bbb', 10, Vector3D.new( 160,100,0), Vector3D.new(8,0,0) ),
#      Particle.new( 'bbb', 10, Vector3D.new( 397,10,0), Vector3D.new(0,0,0) ),
#      Particle.new( 'ccc', 10, Vector3D.new( 412,10,0), Vector3D.new(0,0,0) )
#     ]

p=[ Particle.new( 'sun',  100, Vector3D.new( 0,0,0), Vector3D.new(0,0,0) ),
       Particle.new( 'plan', 10, Vector3D.new( 100,0,0), Vector3D.new(0,4,0) ),
       Particle.new( 'plan', 10, Vector3D.new( 170,0,0), Vector3D.new(0,2.5,0) ),
       Particle.new( 'plan', 10, Vector3D.new( 0,50,0), Vector3D.new(3.9,0,0) )
      ]
      
p=[ Particle.new( 'sun',  10000, Vector3D.new( 0,0,0), Vector3D.new(0,0,0) ),
       Particle.new( 'bh',  250000, Vector3D.new( -4000,2500,0), Vector3D.new(10,-1,0) ) ]


# p=[]

for i in 0...155

	r = rand() * 5000.0
	r2 = r*r
	a = rand() * 4000.0
	b = sqrt(r2+a*a)
	
	
	p.push( Particle.new( 'plan', rand()*30.8, 
		Vector3D.new( a, b, 0.0 ),
		Vector3D.new( 0, 0,  0.0 ) ) )
end

#p=[]
#
#p.push(  Particle.new( 'plan', 20, 
#		Vector3D.new( 500, -300, 0 ),
#		Vector3D.new( -0.08, 0, 0 ) ) )
#
#p.push(  Particle.new( 'plan', 20, 
#		Vector3D.new( 0, 0, 0 ),
#		Vector3D.new( 0.08, 0, 0 ) ) )
#
#p.push(  Particle.new( 'plan', 20, 
#		Vector3D.new( -500, 300, 0 ),
#		Vector3D.new( 0.08, 0, 0 ) ) )
#
##for i in 1...20
##	p.push(  Particle.new( 'plan', 0.8, 
#		Vector3D.new( i*100, 0, 0 ),
#		Vector3D.new( 0, 0.01*(i-10), 0 ) ) )
#end

s = Simulator.new(p)
c=Camera.new(p, 0.005, -500, -500 )

p=Proc.new{ |  id, ascii, mouseX, mouseY |
	print "button handler", id, " ", ascii, "\n"
	if ( id == CL_KEY_RIGHT )
		print "right\n"
		c.x0 = c.x0 - 300
	end
	
	if ( id == CL_KEY_LEFT )
		print "right\n"
		c.x0 = c.x0 + 300
	end
	
	if ( id == CL_KEY_UP )
		print "right\n"
		c.y0 = c.y0 + 300
	end
	
	if ( id == CL_KEY_DOWN )
		print "right\n"
		c.y0 = c.y0 - 300
	end

	if (id == CL_KEY_Z )
		c.scale = c.scale*2
	end

	if ( id == CL_KEY_A )
		c.scale = c.scale*0.5
	end

	if ( id == CL_KEY_C )
		Display.fillRect( 0, 0, 800, 600, 0, 0, 0, 1)
		Display.flipDisplay()
		Display.flipDisplay()
	end
}

Input.buttonHandler=p

#
# Game loop
#
while ( ! KeyBoard.getKeycode( CL_KEY_ESCAPE) )

	s.stepSimluaton(10.0)
	# Display.fillRect( 0, 0, 800, 600, 0, 0, 0, 1)
	c.render()
	Display.flipDisplay()
	System.keepAlive(10)
end

#
# Clean up
#
SetupDisplay.deinit()
SetupCore.deinit()
