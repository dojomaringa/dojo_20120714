class DependenciaTransitiva
  attr_accessor :dependencias
  
  def initialize(entrada)
    @dependencias = {}
    
    entrada.split(';').each do |conjunto|
      elementos = conjunto.split
      elemento = elementos.shift
      @dependencias[elemento] = elementos
    end
  end
  
  def gerar
    resultado = ''
    @dependencias.each do |elemento, dependencias_diretas|
      todas_dependencias = []
      gerar_recursivo(elemento, todas_dependencias)
      resultado += "#{elemento} #{todas_dependencias.sort.join(' ')} ; "
    end
    resultado.chomp(' ; ')
  end

  def gerar_recursivo(elemento, resultado)
    unless @dependencias[elemento] == nil
      @dependencias[elemento].each do |dependencia|
        unless resultado.include?(dependencia)
          resultado << dependencia
          gerar_recursivo(dependencia, resultado)
        end
      end
    end
  end
end
