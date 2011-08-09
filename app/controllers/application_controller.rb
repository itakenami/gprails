class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_tema

  def set_tema
      if cookies[:tema].blank?
        cookies[:tema] = { :value => "blitzer", :expires => Time.now + 1800}
      end
      @tema = cookies[:tema]
  end

  def change_tema
    cookies[:tema] = { :value => params[:tema], :expires => Time.now + 1800}
    @tema = cookies[:tema]
    redirect_to :controller => 'analistas', :action => 'index'
  end

end
