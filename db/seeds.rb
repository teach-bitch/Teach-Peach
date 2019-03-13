# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =========== DESTROY ===========

puts 'Purge de la DB en cours...'

User.destroy_all
Category.destroy_all
Article.destroy_all
ArticleCategory.destroy_all



ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('articles')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('article_categories')
puts 'Purge terminée.'
sleep(1)

# =========== CREATION ===========

10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    username: Faker::DcComics.unique.villain,
    birthdate: Faker::Date.birthday(9, 156))
  print '.'
end

admin = User.create!(email: "admin@admin.com", 
  password: "peepoodo", 
  first_name: "Peepoodo", 
  last_name: "Peepoodo", 
  username: "Peepoodo", 
  birthdate: Faker::Date.birthday(9, 156),
  role: 4)
puts '=== User DB created ==='


5.times do
  category = Category.create!(
    title: Faker::Construction.heavy_equipment)
  print '.' 
end
puts '=== Category DB created ==='

20.times do
  article = Article.create!(
  	user_id: User.all.sample.id,
    title: Faker::Food.fruits,
    for_adult: Faker::Boolean.boolean,
    content: Faker::GreekPhilosophers.quote)
  print '.'
end
puts '=== Article DB created ==='



50.times do
  article_categorie = ArticleCategory.create!(
    category_id: Category.all.sample.id,
    article_id: Article.all.sample.id)
  print '.'
end
puts '=== ArticleCategory DB created ==='
