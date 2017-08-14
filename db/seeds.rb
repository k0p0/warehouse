# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Olivier", address: "101 grande rue, 95290 L'isle Adam", email: "olivier@observices.fr", password: "lewagon83")
User.create(name: "Benjamin", address: "9 avenue Corentin Cariou, 75019 Paris", email: "benjamin@lewagon.co.uk", password: "lewagon83")
User.create(name: "Adrien", address: "27 place de la république, 75011 Paris", email: "adrien@lewagon.com", password: "lewagon83")
User.create(name: "Baptiste", address: "49 avenue des champs-elysées, 75016 Paris", email: "baptiste@lewagon.com", password: "lewagon83")



Storehouse.create(name: "Equinix", address: "114 Rue Ambroise Croizat, 93200 Saint-Denis", capacity: 2300, day_price: 999, user_id: 1)
Storehouse.create(name: "Illiad", address: "29 Rue Edith Cavell, 94400 Vitry-sur-Seine", capacity: 1800, day_price: 759, user_id: 2)
Storehouse.create(name: "Une piece en plus", address: "74 Rue Vieille du Temple, 75003 Paris", capacity: 3000, day_price: 54, user_id: 3)
Storehouse.create(name: "Shurgard self storage", address: "21-23 Rue Eugène Varlin, 75010 Paris", capacity: 20, day_price: 48, user_id: 4)
Storehouse.create(name: "DGM", address: "26 Rue des Rigoles, 75020 Paris", capacity: 42, day_price: 67, user_id: 1)
Storehouse.create(name: "Blondeau", address: "14 Rue Parrot, 75012 Paris", capacity: 18, day_price: 32, user_id: 2)
Storehouse.create(name: "HomeBox", address: "8 Place Boulnois, 75017 Paris", capacity: 65, day_price: 82, user_id: 3)
Storehouse.create(name: "Flexi Stockage", address: "123 Avenue Felix Faure, 75015 Paris", capacity: 45, day_price: 69, user_id: 4)
Storehouse.create(name: "Costockage", address: "13 Rue Emmanuel Chauvière, 75015 Paris", capacity: 127, day_price: 154, user_id: 2)
Storehouse.create(name: "Paris Stockage", address: "19 Avenue Pierre Semard, 94200 Ivry-sur-Seine", capacity: 80, day_price: 119, user_id: 3)
