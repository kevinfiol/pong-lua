local GameObject = require 'engine.GameObject'
local Enum = require 'enum'

local Paddle = GameObject:extend()

function Paddle:new(area, x, y, opts)
    opts = opts or {}
    Paddle.super.new(self, area, x, y)

    self.collision = { class = Enum.Collision.Class.Paddle }
    self.width = opts.width or 8
    self.height = opts.height or 28

    self:schema({
        width = 'number',
        height = 'number',
        collision = {
            class = 'string'
        }
    })
end

function Paddle:update(dt)
end

function Paddle:draw()
    love.graphics.rectangle(
        'line',
        self.x,
        self.y,
        self.width,
        self.height
    )
end

function Paddle:destroy()
    self.width = nil
    self.height = nil
    Paddle.super.destroy(self)
end

return Paddle