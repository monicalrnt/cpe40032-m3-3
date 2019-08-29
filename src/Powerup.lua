Powerup = Class{}

function Powerup:init()
    self.width = 16
    self.height = 16
    self.x = math.random(1, VIRTUAL_WIDTH - self.width)
    self.y = VIRTUAL_HEIGHT / 2 - 20
    self.dy = 20
    
end
function Powerup:collides(target)

    --check if the left edge of either is farther to the right than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    -- check if the bottom edge of either is higher than the top edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 
    -- if neither = overlapping
    return true
end  

function Powerup:setSkin()
    if self.type == 'ball' then
        self.skin = 1
    else
        self.skin = 2
    end
end

function Powerup:update(dt)
    self.y = self.y + self.dy * dt
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin], self.x, self.y)
end
