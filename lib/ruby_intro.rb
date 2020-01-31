#----- SOURCES USED -----#

# https://www.geeksforgeeks.org/ruby-getters-and-setters-method/
# https://rubular.com/
# https://www.ruby-lang.org/en/documentation/
# https://stackoverflow.com/questions/2174767/extracting-the-last-n-characters-from-a-ruby-string

#----- PART 1: Arrays, Hashes, and Enumerables -----#

def sum(array)
    sum = 0;
    array.each do |n|
       sum = sum + n 
    end
    return sum
end

def max_2_sum(array)
    sum = 0;
    max_array = array.max(2)
    max_array.each do |n|
        sum = sum + n
    end
    return sum
end

def sum_to_n?(array, n)
    count = 1
    array.each do |x|
        smol_array = array.drop(count)
        count = count + 1
        smol_array.each do |y|
            if (x + y == n) then
                return true
            end
        end
    end
    return false
end

#----- PART 2: Strings and Regular Expressions -----#

def hello(name)
    return "Hello, #{name}"
end

def starts_with_consonant?(s)
    if (!s.match(/\A[A-z]/)) then                            #Ensure s starts with a letter
        return false
    end
    if (s.match(/\A[AaEeIiOoUu]/))                           #If s starts with vowel, return fals
        return false
    end
    return true
end

def binary_multiple_of_4?(s)
    if (s.match(/\D[^2-9]/) || s.match(/[2-9]/)) then        #If s has anything thats not a number
        return false                                         #or numbers 2-9, return false
    end
    
    if s.split('').last(2).join() == '00' || s == '0' then   #Check if last two digits are 0 (multiple
        return true                                          #or 4), or if s = 0, then return true
    end
   
    return false
end

#----- PART 3: Object Oriented Basics -----#

class BookInStock
   def initialize(isbn, price)
       if (isbn.empty? || price < 0 || price == 0) then
          raise ArgumentError 
       end
       @isbn = isbn
       @price = price
   end

   #getters and setters
   attr_reader :isbn
   attr_writer :isbn
   attr_reader :price
   attr_writer :price
   
   def price_as_string()
      return "$%0.2f" % [@price] 
   end
end