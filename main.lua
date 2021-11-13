require("vector")
require("particle")

function love.load()
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	
	particles = {}
	systems = {}

	n = 10;

	for i = 1, 10 do
		x = math.random(20, 600)
		y = math.random(20, 500)
		particles[i] = Particle:create(Vector:create(x, y), 100)
		systems[i] = ParticleSystem:create(Vector:create(x, y), 100)
	end

	--system = ParticleSystem:create(Vector:create(width/2, height/2), 100)
	gravity = Vector:create(0, 0.1)

	--particle = Particle:create(Vector:create(width/2, height/2), 100)
	--particle = Particle:create(Vector:create(width/2, height/2))
end


function love.update()
	--system:applyForce(gravity)
	--system:update()

	for k,v in pairs(systems) do
		v:applyForce(gravity)
		v:update()
	end
	--particle:update()
end

function love.draw()
	--system:draw()
	--particle:draw()

	for k,v in pairs(systems) do
		v:draw()
	end

	for k,v in pairs(particles) do
		v:draw()
	end
	--particle:draw()
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then 
		for k,v in pairs(particles) do
			if math.abs(particles[k].location.x - x) < 20 and math.abs(particles[k].location.y - y) < 20 then
				systems[k].isPressed = true
				particles[k].location.x = -50
				particles[k].location.y = -50
			end
		end
   end
end