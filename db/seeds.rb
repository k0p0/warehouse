# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Storehouse.destroy_all

olivier = User.create(name: "Olivier", address: "101 grande rue, 95290 L'isle Adam", email: "olivier@observices.fr", password: "lewagon83")
benjamin = User.create(name: "Benjamin", address: "9 avenue Corentin Cariou, 75019 Paris", email: "benjamin@lewagon.co.uk", password: "lewagon83")
adrien = User.create(name: "Adrien", address: "27 place de la république, 75011 Paris", email: "adrien@lewagon.com", password: "lewagon83")
baptiste = User.create(name: "Baptiste", address: "49 avenue des champs-elysées, 75016 Paris", email: "baptiste@lewagon.com", password: "lewagon83")


Storehouse.create(name: "Equinix", description: "Retrouvez Notre Solution Industrielle pour Votre Espace de Stockage !", address: "114 Rue Ambroise Croizat, 93200 Saint-Denis", capacity: 2300, day_price: 999, user_id: olivier.id)
Storehouse.create(name: "Illiad", description: "Retrouvez Notre Solution Industrielle pour Votre Espace de Stockage !", address: "29 Rue Edith Cavell, 94400 Vitry-sur-Seine", capacity: 1800, day_price: 759, user_id: benjamin.id)
Storehouse.create(name: "Une piece en plus", description: "Retrouvez Notre Solution Industrielle pour Votre Espace de Stockage !", address: "74 Rue Vieille du Temple, 75003 Paris", capacity: 3000, day_price: 54, user_id: adrien.id)
Storehouse.create(name: "Shurgard self storage", description: "Retrouvez Notre Solution Industrielle pour Votre Espace de Stockage !", address: "21-23 Rue Eugène Varlin, 75010 Paris", capacity: 20, day_price: 48, user_id: baptiste.id)
Storehouse.create(name: "DGM", description: "Locaux d'activités / Entrepôts à louer pour les entreprises et les professionnels", address: "26 Rue des Rigoles, 75020 Paris", capacity: 42, day_price: 67, user_id: olivier.id)
Storehouse.create(name: "Blondeau", description: "local de stockage durable ou d'entreposage intermittent de marchandises", address: "14 Rue Parrot, 75012 Paris", capacity: 18, day_price: 32, user_id: benjamin.id)
Storehouse.create(name: "HomeBox", description: "local de stockage durable ou d'entreposage intermittent de marchandises", address: "8 Place Boulnois, 75017 Paris", capacity: 65, day_price: 82, user_id: adrien.id)
Storehouse.create(name: "Flexi Stockage", description: "Nos garde-meubles sont secs, propres et sécurisés
", address: "123 Avenue Felix Faure, 75015 Paris", capacity: 45, day_price: 69, user_id: baptiste.id)
Storehouse.create(name: "Costockage", description: "Locaux d'activités / Entrepôts à louer pour les entreprises et les professionnels", address: "13 Rue Emmanuel Chauvière, 75015 Paris", capacity: 127, day_price: 154, user_id: benjamin.id)
Storehouse.create(name: "Paris Stockage", description: "Locaux d'activités / Entrepôts à louer pour les entreprises et les professionnels", address: "19 Avenue Pierre Semard, 94200 Ivry-sur-Seine", capacity: 80, day_price: 119, user_id: adrien.id)
Storehouse.create(name: "OVH Roubaix", description: " local de stockage durable ou d'entreposage intermittent de marchandises", address: "2 rue Kellermann, 59100 Roubaix", capacity: 1000, day_price: 1229, user_id: benjamin.id)
Storehouse.create(name: "OVH Strasbourg", description: "Nos garde-meubles sont secs, propres et sécurisés
", address: "9 Rue Bassin de l'Industrie, 67000 Strasbourg", capacity: 500, day_price: 599, user_id: olivier.id)
Storehouse.create(name: "Captain Igloo", description: "Contact Us", address: " 14 Rue Saint-Yves, 35000 Rennes", capacity: 100, day_price: 200, user_id: olivier.id)
Storehouse.create(name: "Valence Storage", description: "Location de box de stockage temporaire", address: "91 Place de la Liberté, 26000 Valence", capacity: 350, day_price: 299, user_id: olivier.id)

