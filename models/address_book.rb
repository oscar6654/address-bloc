require_relative "entry.rb"
class AddressBook
  attr_accessor :entries

  def initialize
     @entries = []
  end

  def remove_entry(name, phone, email)
      delete1 = nil
      @entries.each do |item|
        if name == item.name && phone == item.phone_number && email == item.email
          delete1 = item
        end
      end
      @entries.delete(delete1)
  end

   def add_entry(name, phone, email)
     index = 0
     @entries.each do |entry|
       if name < entry.name
         break
       end
       index += 1
     end
     @entries.insert(index, Entry.new(name, phone, email))
   end
end
