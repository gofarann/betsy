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

  factory :order do
    status "pending"
    cc_name "John Carlisle"
    email_address "jcarl@gmail.com"
    mailing_address "653 Gorge Way"
    cc_number 5110538084994719
    cc_exp "06/18"
    cc_cvv "674"
    zip 19583
  end
end
