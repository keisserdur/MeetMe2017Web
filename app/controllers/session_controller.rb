class SessionController < ApplicationController
  # Funcion que se encarga de leer los parametros del formulario de login, y validarlos. Dicha validacion consiste en comprobar
  # que tanto el nombre de usuario, como el telefono coincidan. Una vez comprobado puede darse dos casos, el primero es que
  # el usuario no exista o que no se hubiesen pasado los datos correctamente, en este caso escribe un texto en panalla diciendo
  # que la contraseña o usuario son incorrectos. Por otro lado en caso de ser correcto los datos de usuario, crearia la session de 
  # dicho usuario y a continuacion redirecciona a la interfaz de la aplicacion, la cual solo es acesible con autentificacion previa.
  def login
      user = User.new(name: params[:loginUser][:name],
                      tlf: params[:loginUser][:tlf])
      
      if(!createSession(user);)
        render :text => '{login:false, menssage:Contraseña o usuario erroneo}'
      else
        redirect_to controller: "index", action: "app"
      end
  end

  # Funcion que se encarga cuando es llamada de destruir la sesion actual, con todo la informacion que esta poeea y luego redireccionar
  # a la landing page principal.
  def logout
    destroySession()
    redirect_to controller: "index", action: "home"
  end
  
  # Funcion que lee una serie de parametros de un formulario, dichos parametros son todos los campones que el usuario a de escribir 
  # para registrarse. A continuacion llama al Modelo de Usur y pasa todo los datos del usuario, esta llamada puede devolver diversos
  # resultados, en caso de ser true, registra al usuario y redirecciona a la landing page principal, y en caso contrario escribe por
  # pantalla la razon de por que no se ha registrado correctamente el usuario
  def register
    user = User.new( name: params[:newUser][:name],
                      nick: params[:newUser][:nick], 
                      tlf: params[:newUser][:tlf],
                      email: params[:newUser][:email],
                      # token: 'jkl1k23jl14lkn124ñkln14',
                      # token: '654ads654asd6ads654a',
                      token: '654gad654asf654afdsasd',
                      status: 'suspendido',
                      photo: 'img_'+params[:newUser][:nick]+'.jpg',
                      lastconexion: '13:34 24/05/2017',
                      privacity: 'all',)
    
    
    status_register = User.registerUser(user)
    
    if(status_register == true)
      redirect_to action: "home",:controller=>"index", :status_register => status_register
    else
      render :text => status_register
    end
  end
  
  # Funcion que se encargara de mandar un mail de recuperacion, para el caso de que el usuaario no recuerde algun dato.
  def forgotten
    forgottenSession();
  end
  
  private def createSession (currentUser)
    if(User.loginUser(currentUser))
      session['current_user'] = User.getLoginUser(currentUser)
      return true
    end
    return false
  end
  private def destroySession
    reset_session
  end
  private def forgottenSession
  end
end
