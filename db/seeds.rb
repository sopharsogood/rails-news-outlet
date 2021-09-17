# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clark = User.create(name: "Clark Kent", password: "abc123", email: "super_good_reporting@newsrail.news", bio: "Clark Kent is a normal human who has lived on earth ever since he was born at a normal age.")
peter = User.create(name: "Peter Parker", password: "abc123", email: "eight_eyed_camera@newsrail.news", bio: "Peter Parker is an accomplished photographer who has inexplicably never been seen taking photographs. His hobbies include cultivating his pet arachnids that strangely trip geiger counters.")
goku = User.create(name: "420goku420", password: "abc123", email: "lol@goku.goku", bio: "did i say 420 yet")
seph = User.create(name: "XxX_sephiroth_XxX", password: "abc123", email: "video@games")

covid = Article.create(author: clark, title: "COVID Continues to Ravage Country", content: "The death toll from COVID continues to rise as the delta strain spreads across the world (minus new zealand). The strange after-effects on the brains of the survivors are troubling and disturbing, which also means troubling.")
chaucer = Article.create(author: peter, title: "Chaucer Announces Upcoming New Book", content: "Acclaimed author Chaucer announced in a press conference this Tuesday that he had almost completed work on his newest masterpiece, 'The Canterbury Chronicles', a sequel-slash-reboot of his earlier magnum opus.<br><br>Scientists have not determined how he has survived this long, but eight out of ten scientists have already preordered copies of his newest book.")
kitty = Article.create(author: clark, title: "Kitty Exists Cutely", content: "According to eyewitness reports, a cat was seen crossing N. 37th St. this afternoon at approximately 9 pm. Witnesses described the cat as 'very soft-looking' and 'just the sweetest kitty'.")
