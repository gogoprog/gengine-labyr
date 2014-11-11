dofile("game.lua")

local cameraEntity

function init()
    gengine.application.setName("Labyr")
    gengine.application.setExtent(768, 512)
end

function start()
    gengine.graphics.setClearColor(1,1,1,1)
    gengine.gui.loadFile("gui/main.html")

    cameraEntity = gengine.entity.create()
    cameraEntity:addComponent(ComponentCamera(), { extent = { x=768, y=512} }, "camera")
    cameraEntity:insert()

    Game:load()
end

function update(dt)
    Game:update(dt)

    if gengine.input.keyboard:isJustDown(27) then
        gengine.application.quit()
    end
end

function onStartClick()
    Game:playLevel(1)
end

function onContinueClick()
    Game:playNextLevel()
end