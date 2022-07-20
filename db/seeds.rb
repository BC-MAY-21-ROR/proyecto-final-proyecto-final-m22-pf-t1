# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(name: "Productos")

Category.create(name: "Servicios")



Subcategory.create(name: "Cabello", category_id:2)

Subcategory.create(name: "Uñas", category_id:2)

Subcategory.create(name: "Maquillaje", category_id:2)



Category.create(name: "Productos")
Category.create(name: "Servicios")

Subcategory.create(name: "Cabello", category_id:2)
Subcategory.create(name: "Uñas", category_id:2)
Subcategory.create(name: "Maquillaje", category_id:2)

Business.create(name: "Lindo Salon", nit: "906090", country: "Colombia", city: "Valledupar", 
                telephone: "5736407", email: "lindosalon@mail.com", user_id: 1)

Stylist.create(dni:	"201",	name:	"Diana Ospina",	actived: true, telephone:	"3000000001",	role: "Estilista", business_id: 1 )
Stylist.create(dni:	"202",	name:	"Eugenia Hernandes",	actived: true, telephone:	"3000000002",	role: "Estilista", business_id: 1 )
Stylist.create(dni:	"203",	name:	"Julian Ordonez",	actived: true, telephone:	"3000000003",	role: "Manicurista", business_id: 1 )
Stylist.create(dni:	"204",	name:	"Pilar Bocanegra",	actived: true, telephone:	"3000000004",	role: "Manicurista", business_id: 1 )
Stylist.create(dni:	"205",	name:	"Marlon Moreno",	actived: true, telephone:	"3000000005",	role: "Maquillador", business_id: 1 )


Product.create( reference: "C1", name: "Corte De Cabello", price:	20_000, cannon: 0.5, category_id: 2 )
Product.create( reference: "C2", name: "Corte Barba", price:	10_000, cannon: 0.5, category_id: 2 )
Product.create( reference: "C3", name: "Mechas", price: 100_000, cannon: 0.5, category_id: 2 )
Product.create( reference: "U1", name: "Manicure", price:	10_000, cannon: 0.4, category_id: 2 )
Product.create( reference: "U2", name: "Pedicure", price:	10_000, cannon: 0.4, category_id: 2 )
Product.create( reference: "M1", name: "Rostro", price: 50_000, cannon: 0.6, category_id: 2 )
Product.create( reference: "P1", name: "Brillo Secante - Masglo", price: 7_000, cannon: 0, category_id: 1 )
Product.create( reference: "P2", name: "Base Tuleno - Masglo", price: 7_000, cannon: 0, category_id: 1 )


Customer.create(dni:	"101",	full_name:	"Ivan Sampedro",	telephone:	"5700101",	birthday:	"10-abr",	email:	"ivan@mail.com", business_id: 1 )
Customer.create(dni:	"102",	full_name:	"Liz Barrena",	telephone:	"5700102",	birthday:	"20-nov",	email:	"liz@mail.com", business_id: 1)
Customer.create(dni:	"103",	full_name:	"Felicity Ramirez",	telephone:	"5700103",	birthday:	"13-feb",	email:	"felicity@mail.com", business_id: 1)
Customer.create(dni:	"104",	full_name:	"Evelyn Bravo",	telephone:	"5700104",	birthday:	"30-nov",	email:	"evelyn@mail.com", business_id: 1)
Customer.create(dni:	"105",	full_name:	"Sofia Torregrosa",	telephone:	"5700105",	birthday:	"12-sep",	email:	"sofia@mail.com", business_id: 1)
Customer.create(dni:	"106",	full_name:	"Ronaldo Benjumea",	telephone:	"5700106",	birthday:	"2-jun",	email:	"ronaldo@mail.com", business_id: 1)
Customer.create(dni:	"107",	full_name:	"Vivian Aguilar",	telephone:	"5700107",	birthday:	"3-oct",	email:	"vivian@mail.com", business_id: 1)
Customer.create(dni:	"108",	full_name:	"Daphnee Saez",	telephone:	"5700108",	birthday:	"10-nov",	email:	"daphnee@mail.com", business_id: 1)
Customer.create(dni:	"109",	full_name:	"Nora Navarro",	telephone:	"5700109",	birthday:	"19-sep",	email:	"nora@mail.com", business_id: 1)
Customer.create(dni:	"110",	full_name:	"Pedro Barrera",	telephone:	"5700110",	birthday:	"18-jul",	email:	"pedro@mail.com", business_id: 1)