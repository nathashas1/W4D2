# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all


dacy = Cat.create(birth_date: '2015/01/20',color: 'black', name: 'dacy',sex: 'F', description: 'lorem ipsum')
joe = Cat.create(birth_date: '2012/01/22',color: 'white', name: 'joe',sex: 'M', description: 'dolor sit')
steve = Cat.create(birth_date: '2014/01/20',color: 'brown', name: 'steve',sex: 'M', description: 'amate ipsum')


rent1 = CatRentalRequest.create!(cat_id: dacy.id, start_date: '2018/01/01', end_date: '2018/01/03', status: 'APPROVED')
rent2 = CatRentalRequest.create!(cat_id: dacy.id, start_date: '2018/01/10', end_date: '2018/01/13')
# rent3 = CatRentalRequest.create!(cat_id: dacy.id, start_date: '2018/01/02', end_date: '2018/01/12')
rent4 = CatRentalRequest.create!(cat_id: joe.id, start_date: '2018/02/02', end_date: '2018/02/12')
