# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clients = Client.create([
  { name: 'Edes' },
  { name: 'Cooperativa obrera' }
]);

ContactPerson.create([
  {
    name:'Juan Gomez',
    email:'juan.gomez@edes.com',
    phone:'291405434',
    position:'gerente',
    decision_maker: true,
    client: clients.first
  },
  {
    name:'Jose Padro',
    email:'jose.prado@edes.com',
    phone:'291324234',
    position:'vendedor',
    decision_maker: false,
    client: clients.first
  }
]);