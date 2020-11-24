#Ejercicio 2

class CuentaBancarias
    attr_accessor :nombre_usuario, :numero_de_cuenta, :cuenta_vip
    
    attr_reader :n

    def initialize(nombre_usuario, numero_de_cuenta, cuenta_vip = 0)
        raise ArgumentError, "Nombre de usuario debe ser String" if (nombre_usuario.class != String)
        raise ArgumentError, "Numero de cuenta solo debe contener numeros" if (numero_de_cuenta.class != Integer)
        raise ArgumentError, "VIP debe ser 0 ó 1" if (cuenta_vip.class != Integer || (cuenta_vip != 0 && cuenta_vip != 1))
        raise RangeError, "Numero de cuenta debe tener maximo 8 digitos" if (numero_de_cuenta.digits.count > 8)
    
        @nombre_usuario = nombre_usuario
        @numero_de_cuenta = numero_de_cuenta
        @cuenta_vip = cuenta_vip
        @n = 8 - numero_de_cuenta.digits.count
    end

    def numero_de_cuenta
        if @cuenta_vip == 1
            '1-' + ('0'*@n) + @numero_de_cuenta.to_s
        else
            '0-' + ('0'*@n) + @numero_de_cuenta.to_s
        end
    end
end

cuenta1 = CuentaBancarias.new("Jorge Sifontes", 112233, 1)
puts "Cuenta creada:"
puts "Usuario: #{cuenta1.nombre_usuario}"
puts "Num Cuenta: #{cuenta1.numero_de_cuenta}"