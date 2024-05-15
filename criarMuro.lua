-- Função principal para cavar os buracos
local function executarMineracao(quantidadeFrente, quantidadeLado)
    local function construirMuro()
        local c = 1
        for i = 1, quantidadeFrente do
            if turtle.detect() then
                turtle.dig()
            end
            if turtle.detectDown() then
                turtle.digDown()
            end
            if turtle.detectUp() then
                turtle.digUp()
            end
            while turtle.getItemCount() == 0 do
                c = c + 1
                turtle.select(c)
                if c == 16 then
                    print("Nao tem mais item de construção")
                    break
                elseif turtle.getItemCount() > 0 then
                    break
                end
            end
            turtle.placeDown()
            turtle.forward()
        end
        turtle.turnRight()
        turtle.turnRight()
    end
    
    local function construir()
        construirMuro()
        turtle.up()
        turtle.forward()
        construirMuro() 
    end
    turtle.up()
    construir()
end

print("Digite a quantidade de blocos de frente:")
local quantidadeFrente = tonumber(read())
executarMineracao(quantidadeFrente)