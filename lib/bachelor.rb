def get_first_name_of_season_winner(data, season)
  result = nil
  data.each do |season_number, attributes_array|
    if season_number == season
      attributes_array.each do |hash|
        hash.each do |attribute, value|
          if attribute == "status" && value == "Winner"
            hash.each do |attribute2, value2|
              if attribute2 == "name"
                result = value2.split(" ").shift.to_s
              end
            end
          end
        end
      end
    end
  end
  result
end

def get_contestant_name(data, occupation)
  result = nil
  data.each do |season_number, attributes_array|
    attributes_array.each do |hash|
      hash.each do |attribute, value|
        if attribute == "occupation" && value == occupation
          hash.each do |attribute, value|
            if attribute == "name"
              result = value
            end
          end
        end
      end
    end
  end
  result
end

def count_contestants_by_hometown(data, hometown)
  result = 0
  data.each do |season_number, attributes_array|
    attributes_array.each do |hash|
      hash.each do |attribute, value|
        if attribute == "hometown" && value == hometown
          result += 1
        end
      end
    end
  end
  result
end

def get_occupation(data, hometown)
  data.each do |season_number, attributes_array|
    attributes_array.each do |hash|
      hash.find do |attribute, value|
        if attribute == "hometown" && value == hometown
          return hash["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total = 0
  counter = 0
  data.each do |season_number, attributes_array|
    if season_number == season
      attributes_array.each do |hash|
        hash.each do |attribute, value|
          if attribute == "age"
            total += value.to_f
            counter += 1
          end
        end
      end
    end
  end
  (total/counter).round
end
