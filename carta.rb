#Ejercicio 1

class Carta
    attr_accessor :numero, :pinta
    def initialize(numero, pinta)
        #Excepcion para numero
        raise ArgumentError, "\nArgumento numero debe estar entre 1 - 13" if (numero<1 || numero>13)
        
        #Excepcion para pinta
        raise ArgumentError, "\nArgumento pinta debe ser un String: \n* 'C' -> Corazon \n* 'D' -> Diamante \n* 'E' - Espada \n* 'T' - Trebol" if (pinta.class != String ||  !['C','D','E','T'].include?(pinta))
        @numero = numero
        @pinta = pinta
    end
end

mazo = []
5.times do |i|
    mazo.push Carta.new(rand(1..13),['C','D','E','T'].sample)
    puts "Carta #{i+1}: #{mazo[i].numero}-#{mazo[i].pinta}"
end