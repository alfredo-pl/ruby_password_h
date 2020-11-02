def hackear(dicc, word)
    cont= 1
    i=0
        #postfijo
        if word.include?("123") 
            postfijo = word.delete("123")
        elsif word.include?("12")
            postfijo = word.delete("12")
        else
            postfijo = word.delete("1")
        end
        #si se palabra sin el postfijo
        encontrado = dicc.include?("#{postfijo}\n")
        if encontrado 
            while i < dicc.size
                #el valor se inserta en una variable y se remueve el salto de linea
                comparar = dicc[i].delete("\n")
                if comparar != postfijo
                    #sigue contando
                    cont +=1
                elsif comparar == postfijo    
                    #detiene el bucle    
                    i = dicc.size
                end
                i+=1
            end
            cont
        else
            puts "Palabra no encontrada asegurese si la palabra posee acento"
        end
end
#palabra a buscar
word = ARGV[0]
#indice para buscar en el diccionario
chart = word[0]
data = open("./dicc/#{chart}.txt").readlines
print hackear(data, word)
