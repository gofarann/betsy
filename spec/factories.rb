FactoryGirl.define do
  factory :product do
    name "Geometry Like Woah"
    price 45345345
    user_id 2
    stock 1
    photo_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay"
    description "I drew this for you"
    retired false
  end
end
