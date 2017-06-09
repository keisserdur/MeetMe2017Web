class User < ActiveRecord::Base
    
    def self.loginUser(user)
        if(currentUser = User.find_by(name: user.name,tlf: user.tlf))
            return true
        end
        return false
    end
    
    def self.getLoginUser(user)
        return User.find_by(name: user.name,tlf: user.tlf)
    end
    
    def self.getUserByToken(token)
        return User.find_by(token: token)
    end
    
    def self.registerUser(user)
        dbUser = User.find_by(name: user.name)
        if(dbUser)
            return '{error: Este usuario ya existe}';
        end
        dbUser = User.find_by(tlf: user.tlf)
        if(dbUser)
            return '{error: Este tlf ya existe}';
        end
        dbUser = User.find_by(email: user.email)
        if(dbUser)
            return '{error: Este email ya existe}';
        end
        
        user.save
        return true
    end
    
    def self.getListContact
        return User.all
    end
    
    def self.registerMessage(message)
        return message.save
    end
end
