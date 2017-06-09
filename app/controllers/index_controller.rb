class IndexController < ApplicationController
  # todo: Comprobar la sesion para redireccionar a la app en vez de loguearte
  def home
    
    @newUsuario = 'newUser'
    
    @no_url = 'javascript:;'
    @error = params[:error]
    
    @url_home = url_for(:controller => 'index', :action => 'home')
    
    currentUser = currentUser = session['current_user']
    
    if(!currentUser)
      @link_login_app = 'Login'
      @url_login_app = 'javascrpit:;'
    else
      @link_login_app = 'App'
      @url_login_app =  url_for(:controller => 'index', :action => 'app')
    end
  end
  
  def app 
    @sendMessage = 'newMessage'
    @no_url = 'javascript:;'
    @user = session['current_user']
    currentUser = session['current_user']
    if(!currentUser)
      redirect_to controller: 'index', action: 'home', error: 'No te has autentificado'
    end
    
    @name = currentUser.inspect
    @mytoken = currentUser.inspect
    @listUser = User.getListContact

  end
end
