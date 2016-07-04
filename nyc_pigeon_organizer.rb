#require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_list = {}
  pigeon_names = []
  new_lvl_2_keys = data.keys #:color, :gender and :lives
  #collecting all names
  data.each do |key, value|
      pigeon_names << value.values
  end
  formatted_pigeon_names = pigeon_names.flatten.uniq #flatten the array and remove duplicates

  #build the structure of the new array
  formatted_pigeon_names.each do |pigeon|
    pigeon_list[pigeon] = {}
    new_lvl_2_keys.each do |key2|
      pigeon_list[pigeon][key2] = []
    end
  end

  #insert the old data to the new structure
  pigeon_list.each do |pigeon, stats|
    new_lvl_2_keys.each do |key2|
      data[key2].each do |key, value|
        value.each do |name|
          if name == pigeon
            pigeon_list[pigeon][key2] << key.to_s
          end
        end
      end
    end
  end
#  binding.pry
  pigeon_list
end
