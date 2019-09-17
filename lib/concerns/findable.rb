module Concerns::Findable  #the :: usually means that findable will be in a folder called concerns
    def find_by_name(name)
        self.all.find do |instance| #changed song to instance
            instance.name == name  #changed song to instance
        end
    end

    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name) # the pipes returns the first truthy value, so if the first half is true, the second half is ignored
    end
end
