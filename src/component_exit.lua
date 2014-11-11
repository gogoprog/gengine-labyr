ComponentExit = {}

function ComponentExit:init()
end

function ComponentExit:insert()
end

function ComponentExit:update(dt)
end

function ComponentExit:remove()
    Game:onExitFound()
end

