require 'json'
class UserController < ApplicationController
  def get_user_info
    # Para pasarlo como JSON es necesario poner JSON.generate(@user), pero este tiene que ser un array
    @user = User.find(params[:id])
  end
  
  def get_list_contact
    @userlist = User.all 
  end
  
  def get_conversation ()
    tokenContact = params['tokencontact']
    currentUser = session['current_user']
    # messages = Message.all
    
    messages = Message.select('*').where('(tokenuser = :tokenorigin AND tokencontact = :tokendestine) OR (tokenuser = :tokendestine AND tokencontact = :tokenorigin)', {tokenorigin: currentUser['token'], tokendestine: tokenContact} )
    result = ''
    previuosDay = ''
   
   if (messages)
    for message in messages
      origin = (message.tokenuser == currentUser['token']) ? 'myself' : 'otherself'
      author = User.getUserByToken(message.tokenuser)
      
      if(previuosDay != message.day.inspect)
        result+= '<span class="separator-day"><p>' + message.day.to_s + '</p></span>'
      end
      previuosDay = message.day.inspect
      
      
      result+= '<span class="menssage-body ' + origin + '">'
      result+= '<p class="menssage-author">' + author.name.to_s + '</p>'
      result+= '<p class="menssage-content">' + message.content.to_s + '</p>'
      result+= '<span class="menssage-time">' + message.time.to_s + '</span>'
      result+= '</span>'
    end
  end
    
    render :text => result
  end
  
  def sync_contacts
  end
  
  def new_contact
    
  end
  
  def edit_contact
  end
  
  def remove_contact
  end
  
  def sendMessage
    currentUser = session['current_user']
    
    time = Time.new
    
    ceroDay = (time.day<=9) ? '0' : '' 
    ceroMonth = (time.month<=9) ? '0' : '' 
    ceroHour = (time.hour<=9) ? '0' : '' 
    ceroMin = (time.min<=9) ? '0' : ''
    
    puts  timeDMY =  ceroDay + time.day.inspect + '/' + ceroMonth + time.month.inspect + '/' + time.year.inspect
    puts  timeHM = ceroHour + (time.hour).inspect + ':' + ceroMin + time.min.inspect
    
    message = Message.new( tokenuser: currentUser['token'],
                            content: params[:newMessage][:menssage],
                            tokencontact: params[:newMessage][:tokencontact],
                            day: timeDMY,
                            time: timeHM,)
    User.registerMessage(message)
    
  end

end
