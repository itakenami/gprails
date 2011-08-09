module ApplicationHelper



  def bloco(nome, &block)

    str = "<b>Inicio</b><br>"
    str << "#{nome} escreveu: #{capture(&block)}"
    str << "<br><b>Fim</b>"
    raw str

  end

  def linha(nome)
    str = "#{nome}, Bem Vindo ao Rails"
    raw str
  end

  def info(opts={})
    str = "seu nome é #{opts[:nome]} e seu sobrenome é #{opts[:sobrenome]}"
    raw str
  end

end
