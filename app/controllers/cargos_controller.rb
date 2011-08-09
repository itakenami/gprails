class CargosController < ApplicationController

  def index
    @cargos = Cargo.all
  end

  def save

    if params[:id].blank?

      @cargo = Cargo.new(params[:cargo])

      if @cargo.save
        flash[:notice] = 'Cargo salvo com sucesso.'
        redirect_to(:action => 'index')
      else
        render :action => 'form'
      end
    else

      @cargo = Cargo.find(params[:id])

      if @cargo.update_attributes(params[:cargo])
        flash[:notice] = 'Cargo atualizado com sucesso.'
        redirect_to(:action => 'index')
      else
        render :action => 'form'
      end

    end

  end

  def view
    @cargo = Cargo.find(params[:id])
  end

  def form
    if params[:id].blank?
      @cargo = Cargo.new
    else
      @cargo = Cargo.find(params[:id])
    end
  end

  def delete
    @cargo = Cargo.find(params[:id])
    @cargo.destroy
    flash[:notice] = 'Cargo excluido com sucesso.'
    redirect_to(:action => 'index')
  end

end