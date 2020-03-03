# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# for i in 1..50
#   name = Faker::Name.name
#
#   email = Faker::Internet.safe_email(name)
#
#   user = User.new
#   user.email = email
#   user.name = name
#   user.articles = Faker::Lorem.paragraph
#   user.comments = Faker::Lorem.paragraph
#
#
#   if user.save
#     p "Saved user ##{i}: #{name}"
#     for ii in 1..50
#       artice = Article.new
#       artice.user = user
#       artice.title = title
#       artice.content = content
#       artice.comments = Faker::Lorem.paragraph
#       if artice.save
#         p "Aricle ##{ii} saved for #{name}"
#       else
#         raise artice.errors
#       end
#     end
#   else
#     raise user.errors
#   end
# end
#


for i in 1..50
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
name = "#{first_name} #{last_name}"
email = Faker::Internet.safe_email(name)
user = User.new
user.email = email
user.name = name
if user.save
  p "Saved user ##{i}: #{name} (#{email})"
  for ii in 1..50
    article = Article.new
    article.user = user
    article.title = Faker::Lorem.paragraph
    article.content = Faker::Lorem.paragraph
    if article.save
      p "Article ##{ii} saved for #{article.title}"
      for ii in 1..10
        comment = Comment.new
        comment.user = user
        comment.article = article
        comment.message = Faker::Lorem.paragraph
        if comment.save
          p "Comment ##{ii} saved for #{comment.message}"
        else
          p comment.errors
        end
      end
    else
      p article.errors
    end
  end
else
  p user.errors
end
end