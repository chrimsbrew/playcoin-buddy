-- playcoin buddy 1.1.0
-- chrimsbrew

-- pull the number of playcoins from the system
coins = love.system.getPlayCoins()

-- play background music
source = love.audio.newSource("pcbtheme2.wav", "stream") -- stream saves memory, which shouldn't be an issue with an app like this but it can't hurt.
source:setVolume(1.0) -- max volume is 1.0
source:setLooping(true)
source:play()

function love.draw(screen)
    if screen ~= "bottom" then -- display only on top screen
        love.graphics.print("play coins: "..coins, 15, 20)
        love.graphics.print("Up/Down: +/- 1 | Right/Left: +/- 25\nX: Set 300 | Y: Set 0\nA: Save\nStart: Quit",15,100)
    end
end

-- take input from the user
function love.gamepadpressed(joystick, button)
    if button == "dpup" then -- +/-1 coin
        if coins+1 <= 300 then
            coins = coins + 1
        end
    elseif button == "dpdown" then
        if coins-1 >= 0 then
            coins = coins - 1
        end
    end

    if button == "dpleft" then -- +/-25 coins
        if coins-25 >= 0 then
            coins = coins - 25
        end
    elseif button == "dpright" then
        if coins+25 <= 300 then
            coins = coins + 25
        end
    end

    if button == "y" then -- quick 0
        coins = 0
    end

    if button == "x" then -- quick max (300)
        coins = 300
    end

    if button == "a" then
        love.system.setPlayCoins(coins) -- write playcoins to system
    end

    if button == "start" then
        love.event.quit() -- quit to hb menu
    end
end
