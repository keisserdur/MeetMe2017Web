# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready( () ->
    token = ''
    calcMenuPos = () ->
        if( $(window).scrollTop() >= 80 )
            $('header').addClass('scrollable')
        else
            $('header').removeClass('scrollable')
            
    openModalLogin = () ->
        $('#login-modal').toggle();
    openModalRegister = () ->
        $('#register-modal').toggle();
        
    activateChat = () ->
        $('#app aside li').removeClass('active')
        $(this).addClass('active')
        token = $(this).find('token').text()
        $('#othertoken').val(token)
        
        $('#talk-to').text($(this).find('.name').text())
        $('#talk-img').attr('src', $(this).find('img').attr('src'))
        
        $('#text2Send').removeAttr('disabled')
        
        pedirChat()
            
        # setInterval( pedirChat, 6000);
        
    pedirChat = ()->
        $.post( "/user/conversation?tokencontact="+token, (data) -> (
                $( "#conversation-messages" ).html( data );
                
                lastMenssage = $('#conversation-messages .menssage-body:last-child')
                suma = lastMenssage.offset().top+lastMenssage.height()-32 # 15 y 15 de padding top y bottom del section y 2px de los bordes del mensaje
                
                if( $('#conversation-messages').height() >= suma )
                    false
                
            ) )
            
    sendMessage = () ->
        newMessage = ''
        newMessage += '<span class="menssage-body myself">'
        newMessage += '<p class="menssage-author">' + $('#myname').text() + '</p>'
        newMessage += '<p class="menssage-content">' + $('#text2Send').val() + '</p>'
        newMessage += '<span class="menssage-time">now</span>'
        newMessage += '</span>'
        
        $('#conversation-messages').append(newMessage)
        
    clearInput = () ->
        $('#text2Send').val('')
        alert('limpiar')
        
    if( $('#home') )
        calcMenuPos();
        $(window).scroll( calcMenuPos )
        
    $('.trigger-login').on('click',openModalLogin )
    $('.trigger-register').on('click',openModalRegister )
    $('#app aside li').on('click', activateChat )
    $('.send-control form').on('submit', sendMessage)
)
    


    