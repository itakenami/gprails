class ProjetosController < ApplicationController

  def index
    @projetos = Projeto.all

  end

  def save
    #puts params[:projeto].inspect
    if params[:id].blank?

      @projeto = Projeto.new(params[:projeto])

      if @projeto.save
        flash[:notice] = 'Projeto salvo com sucesso.'
        redirect_to(:action => 'index')
      else
        @analistas = Analista.all
        render :action => 'form'
      end

    else

      @projeto = Projeto.find(params[:id])

      if @projeto.update_attributes(params[:projeto])
        flash[:notice] = 'Projeto atualizado com sucesso.'
        redirect_to(:action => 'index')
      else
        @analistas = Analista.all
        render :action => 'form'
      end

    end

  end

  def view
    @projeto = Projeto.find(params[:id])
  end

  def form
    if params[:id].blank?
      @projeto = Projeto.new
    else
      @projeto = Projeto.find(params[:id])
    end
    @analistas = Analista.all
  end

  def delete
    @projeto = Projeto.find(params[:id])
    @projeto.destroy
    flash[:notice] = 'Projeto excluido com sucesso.'
    redirect_to(:action => 'index')
  end

end