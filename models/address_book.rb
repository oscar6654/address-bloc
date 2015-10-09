require_relative "entry.rb"
require "csv"
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

   # Search AddressBook for a specific entry by name
  def binary_search(name)
    lower = 0
     upper = entries.length - 1

 # #2
     while lower <= upper
 # #3
       mid = (lower + upper) / 2
       mid_name = entries[mid].name

 # #4
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
    return nil
  end
  def destroy
    @entires = []
  end
  def iterative_search(name)
    @entries.each do|entry|
      if entry.name == name
        return entry
      end
    end
    return nil
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

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 # #8
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
   end
end
