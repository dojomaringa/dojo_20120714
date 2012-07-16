require_relative 'dependencia_transitiva'

describe DependenciaTransitiva do
  it 'Testa tudo' do
    dependencias = DependenciaTransitiva.new('A B C ; B C E ; C G ; D A F ; E F ; F H')
    dependencias.gerar.should == 'A B C E F G H ; B C E F G H ; C G ; D A B C E F G H ; E F H ; F H'
    p dependencias.gerar
  end
end
