require 'pry-byebug'


def pet_shop_name(pet_shop)
  return name=pet_shop[:name]
end


def total_cash(pet_shop)
  return tot_cash=pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  tot_cash=total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]=tot_cash+cash
end

def pets_sold(pet_shop)
  return sold=pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,sold)
  return pet_shop[:admin][:pets_sold]=pet_shop[:admin][:pets_sold]+sold 
end

def stock_count(pet_shop)
  return nb_pets=pet_shop[:pets].length
end

def pets_by_breed(pet_shop,breed)  
  breed_list=[]
  for pet in pet_shop[:pets]
    breed_list << breed if (breed == pet[:breed])
  end
   return breed_list
end

def find_pet_by_name(pet_shop,name) 
  for pet in pet_shop[:pets]
    if (name == pet[:name])
      return pet
   end
  end
  return nil
end

def remove_pet_by_name(pet_shop,name)
  for pet in pet_shop[:pets]
    pet_shop[:pets].delete(pet) if (name == pet[:name])
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  return pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return count=customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets].push(new_pet) 
end

def customer_can_afford_pet(customer, new_pet)
  if (customer[:cash] <= new_pet[:price])
    return false
  else
    return true
  end  
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # add pet to customer
  if (pet!=nil)
    if (customer[:cash] >= pet[:price])
      customer[:pets].push(pet)
      pet_shop[:pets].delete(pet)
      pet_shop[:admin][:pets_sold]+=1
      pet_shop[:admin][:total_cash]+=pet[:price]
    else
      return "Insufficient funds"
    end
  end
end

