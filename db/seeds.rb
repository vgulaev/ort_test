# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Server.delete_all

Server.create(:id => 1, :name=>'Moscow')
Server.create(:id => 2, :name=>'St. Piter')
Server.create(:id => 3, :name=>'Yekat')

Bandwidth.delete_all


Bandwidth.create(:id => 1, :server_id=>1, :value => rand * 15, :interface_name => 'main')
Bandwidth.create(:id => 2, :server_id=>1, :value => rand * 15, :interface_name => 'second')

Bandwidth.create(:id => 3, :server_id=>2, :value => rand * 15, :interface_name => 'first')
Bandwidth.create(:id => 4, :server_id=>2, :value => rand * 15, :interface_name => 'additional')
