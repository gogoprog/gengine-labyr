require('settings')

ComponentLock = {}

gengine.stateMachine(ComponentLock)

function ComponentLock:init()
    self.time = 0
end

function ComponentLock:insert()
    Game.keyLeft = Game.keyLeft + 1
    self:changeState("appearing")
end

function ComponentLock:update(dt)
    self:updateState(dt)
end

function ComponentLock:remove()
    Game.keyLeft = Game.keyLeft - 1
    Game:onKeyFound()
end

function ComponentLock.onStateEnter:appearing()
    local sprite = self.entity.sprite
    sprite.alpha = 0
    self.appearingTime = 0
    self.appearingDuration = 5
end

function ComponentLock.onStateUpdate:appearing(dt)
    local sprite = self.entity.sprite

    self.appearingTime = self.appearingTime + dt

    local at = self.appearingTime

    sprite.alpha = at / self.appearingDuration

    local e = 32 + 16 * math.cos(at * 6)

    sprite.extent = {x=e, y=e}

    if self.appearingTime >= self.appearingDuration then
        self:changeState("idle")
    end
end

function ComponentLock.onStateExit:appearing()
    local sprite = self.entity.sprite
    sprite.alpha = 1
    sprite.extent = {x=32, y=32}
end
