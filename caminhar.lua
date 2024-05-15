-- Função principal para cavar os buracos
local function executarMineracao(quantidadeFrente, quantidadeLado)
    local function minerarBlocos()
        for i = 1, quantidadeFrente do
            if turtle.detect() then
                turtle.dig()
            end
            if turtle.detectDown() then
                turtle.digDown()
            end
            turtle.digDown()
            turtle.forward()
        end
        turtle.turnRight()
        turtle.turnRight()
        for i = 1, quantidadeFrente do
            turtle.forward()
        end
    end
    
    local function minerar()
        minerarBlocos()
        if quantidadeLado > 1 then
            for i = 2, quantidadeLado do
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                minerarBlocos()    
            end
            turtle.turnRight()
            for i = 2, quantidadeLado do
                turtle.forward()
            end
            turtle.turnRight()
        else
            turtle.turnRight()
            turtle.turnRight()
        end
    end
    turtle.up()
    minerar()
end

print("Digite a quantidade de blocos de frente:")
local quantidadeFrente = tonumber(read())
print("Digite a quantidade de blocos de lado:")
local quantidadeLado = tonumber(read())
executarMineracao(quantidadeFrente, quantidadeLado)