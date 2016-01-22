FactoryGirl.define do
  factory :product do
    name "Geometry Like Woah"
    price 100
    user_id "2"
    stock "1"
    photo_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay"
    description "I drew this just for you."
    retired false
    weight 100
    length 10
    width 10
    height 10
  end

  factory :product_2, class: Product do
    name "Geometry Like Woah 2"
    price 2000
    user_id "2"
    stock "1"
    photo_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay"
    description "I drew this just for you."
    retired false
    weight 100
    length 10
    width 10
    height 10
  end

  factory :product_3, class: Product do
    name "Another Product"
    price 25
    user_id "2"
    stock "1"
    photo_url "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeCvOq-lfd-xau5kCj_RZ5WOD1wldXJybYd9abKVYwZKaGAay"
    description "I drew this just for you."
    retired false
    weight 100
    length 10
    width 10
    height 10
  end

  factory :user do
    username "Burp"
    email_address "thing@thing.com"
    password "this"
    password_confirmation "this"
    name "Burp"
    street_address "2146 Sherman Ave"
    city "Evanston"
    state "IL"
    zip 60201
  end

  factory :order do
    status "pending"
    cc_name "John Carlisle"
    email_address "jcarl@gmail.com"
    mailing_address "653 Gorge Way"
    cc_number 5110538084994719
    cc_exp "06/18"
    cc_cvv "674"
    city "Hinsdale"
    state "IL"
    zip 60521
  end
end
