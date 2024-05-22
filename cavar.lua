-- Função principal para cavar os buracos
local function executarMineracao(quantidadeArea, quantidadeBaixo)
    local function minerarBlocos()
        for i = 1, quantidadeArea do
            if turtle.detectDown() then
                turtle.digDown()
            end
            turtle.forward()
            if turtle.detect() then
                turtle.dig()
            end
            if turtle.detectUp() then
                turtle.digUp()
            end
        end
        turtle.turnRight()
        turtle.turnRight()
        for i = 1, quantidadeArea do
            turtle.forward()
        end
    end
    
    local function minerar()
        minerarBlocos()
        if quantidadeArea > 1 then
            for i = 2, quantidadeArea do
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                minerarBlocos()    
            end
            turtle.turnRight()
            for i = 2, quantidadeArea do
                turtle.forward()
            end
            turtle.turnRight()
        else
            turtle.turnRight()
            turtle.turnRight()
        end
    end
    local function minerarBaixo()
        quantidadeBaixo = quantidadeBaixo - 1
        if quantidadeBaixo >= 1 then
            for i = 1, quantidadeBaixo do
                turtle.down()
                minerar()
            end
            for i = 1, quantidadeBaixo do
                turtle.up()
            end
        end
    end
    minerar()
    minerarBaixo()
end

print("Digite a quantidade de blocos de area:")
local quantidadeArea = tonumber(read())
print("Digite a quantidade de blocos para baixo:")
local quantidadeBaixo = tonumber(read())
executarMineracao(quantidadeArea, quantidadeBaixo)