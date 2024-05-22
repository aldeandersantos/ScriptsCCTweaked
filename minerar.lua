-- Função principal para cavar os buracos
local function executarMineracao()
    local function minerar40x40()
        local function minerarQuarentaBlocos()
            for i = 1, 40 do
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
                turtle.turnRight()

                colocarPedregulho()

                turtle.turnLeft()
                turtle.turnLeft()
            end
        end
        
        minerarQuarentaBlocos()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
        minerarQuarentaBlocos()
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
    end
    
    local function despejarItens()
        -- Despeja itens no baú
        turtle.turnRight()
        turtle.turnRight()
        for i = 1, 16 do
            turtle.select(i)
            turtle.drop()
        end
        turtle.turnRight()
        turtle.turnRight()
    end

    function colocarPedregulho()
        local itemDesejado = "minecraft:cobblestone"  -- Defina o item desejado aqui
      
        for slot = 1, 16 do  -- Itera sobre todos os slots do inventário
            turtle.select(slot)  -- Seleciona o slot atual
            local item = turtle.getItemDetail()  -- Obtém informações sobre o item no slot atual
      
            if item and item.name == itemDesejado then  -- Verifica se o item é o desejado
                turtle.place()  -- Coloca o item à frente
            end
            break
        end
      end
    
    minerar40x40()
    despejarItens()
    turtle.up()
    minerar40x40()
    turtle.down()
    despejarItens()
end


executarMineracao()
    
