
PaddleAI = Class{}


function PaddleAI:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
    self.disabled = false;
    self.coolDown = 0
end

function PaddleAI:disable()
    self.disabled = true
end

function PaddleAI:enable()
    self.disabled = false;
end

function PaddleAI:update(ball, dt)

    -- +++ Costomized Code +++
    -- +++ PaddleAI +++
    
    -- run down any set coolDown-time
    self.coolDown = self.coolDown - dt

    if self.coolDown < 0 and self.disabled == false then 
        -- only executes if any cooldowntime is run out and if the 
        -- AI is enabled

        -- AI-Algorythem
        --   if ball is above player move up
        --   if ball is lower player move down
        if ball.y <= self.y then 
            self.dy = -200 
        else
            self.dy = 200 
        end
    end   
    


    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)

    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end


function PaddleAI:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end