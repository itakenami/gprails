class AnalistasController < ApplicationController

  def index
    @analistas = Analista.all
  end

  def save

    if params[:id].blank?

      @analista = Analista.new(params[:analista])

      if @analista.save
        flash[:notice] = 'Analista salvo com sucesso.'
        redirect_to(:action => 'index')
      else
        @cargos = Cargo.all
        render :action => 'form'
      end

    else

      @analista = Analista.find(params[:id])

      if @analista.update_attributes(params[:analista])
        flash[:notice] = 'Analista atualizado com sucesso.'
        redirect_to(:action => 'index')
      else
        @cargos = Cargo.all
        render :action => 'form'
      end

    end

  end

  def view
    @analista = Analista.find(params[:id])
  end

  def form
    if params[:id].blank?
      @analista = Analista.new
    else
      @analista = Analista.find(params[:id])
    end
    @cargos = Cargo.all
  end

  def delete
    @analista = Analista.find(params[:id])
    @analista.destroy
    flash[:notice] = 'Analista excluido com sucesso.'
    redirect_to(:action => 'index')
  end

end
