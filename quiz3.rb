class Dog
 attr_accessor :name, :breed
 	def initialize(name, breed)
 		@name=name
 		@breed=breed
 	end

end

new_dog=Dog.new("Fido", "terrier")
puts new_dog.name
puts new_dog.breed
new_dog.name="Buddy"
new_dog.breed="yorkie"
puts new_dog.name
puts new_dog.breed
