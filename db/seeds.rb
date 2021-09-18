# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Article.destroy_all
Comment.destroy_all

clark = User.create(name: "Clark Kent", password: "abc123", email: "super_good_reporting@newsrail.news", bio: "Clark Kent is a normal human who has lived on earth ever since he was born at a normal age.")
peter = User.create(name: "Peter Parker", password: "abc123", email: "eight_eyed_camera@newsrail.news", bio: "Peter Parker is an accomplished photographer who has inexplicably never been seen taking photographs. His hobbies include cultivating his pet arachnids that strangely trip geiger counters.")
goku = User.create(name: "420goku420", password: "abc123", email: "lol@goku.goku", bio: "did i say 420 yet")
seph = User.create(name: "XxX_sephiroth_XxX", password: "abc123", email: "video@games")

covid = Article.create(author: clark, title: "COVID Continues to Ravage Country", content: "The death toll from COVID continues to rise as the delta strain spreads across the world (minus new zealand). The strange after-effects on the brains of the survivors are troubling and disturbing, which also means troubling.")
chaucer = Article.create(author: peter, title: "Chaucer Announces Upcoming New Book", content: "Acclaimed author Chaucer announced in a press conference this Tuesday that he had almost completed work on his newest masterpiece, 'The Canterbury Chronicles', a sequel-slash-reboot of his earlier magnum opus.\r\n\r\nScientists have not determined how he has survived this long, but eight out of ten scientists have already preordered copies of his newest book.")
kitty = Article.create(author: clark, title: "Kitty Exists Cutely", content: "According to eyewitness reports, a cat was seen crossing N. 37th St. this afternoon at approximately 9 pm. Witnesses described the cat as 'very soft-looking' and 'just the sweetest kitty'.")

flame1 = Comment.create(user: goku, article: covid, content: "i looked out my window and i dont see any covids")
flameresponse = Comment.create(user: clark, article: covid, parent: flame1, content: "Thank you for your comment! COVID molecules are too small to be visible to the naked eye.")
flame2 = Comment.create(user: seph, article: covid, parent: flame1, content: "lmao")
Comment.create(user: goku, article: covid, parent: flameresponse, content: "i will not fall for your tricks, paperboy")
flame3 = Comment.create(user: goku, article: covid, parent: flame2, content: "just WHO do u think you are laughing at here?\r\n\r\ni am a VERY IMPORTANT BUSNESMAN who could buy your entire HOUSE if i wanted to so be careful who you cross")
flame4 = Comment.create(user: seph, article: covid, parent: flame3, content: "Nice try, but I am the president of the science company that studies covid, so actually it is you who should fear me")
flame5 = Comment.create(user: goku, article: covid, parent: flame4, content: "WHAT DID YOU JUST SAY TO ME!? I'LL HAVE YOU KNOW I HAVE OVER FIVE THOUSAND CONFIREMENTS IN THE AFGHANISTAN AND HAVE ALREADY SENT AGENTS TO YOUR HOUSE KIDdo")
flame6 = Comment.create(user: seph, article: covid, parent: flame5, content: "r u 4 real")
flame7 = Comment.create(user: goku, article: covid, parent: flame6, content: "I am dead serious. Just like I am dead serious when I say that the lizard people already put ozone in the water supply.")
flame8 = Comment.create(user: seph, article: covid, parent: flame7, content: "This has gotten far too silly for me. Good day.")
flame9 = Comment.create(user: goku, article: covid, parent: flame8, content: "yeah u better run")
Comment.create(user: seph, article: covid, content: "You journalists talk a lot about stopping COVID, but why don't you ever do something about it yourselves??? I see throuhg you")

Comment.create(user: seph, article: chaucer, content: "Chaucer sucks at writing. I tried reading his book once and he couldn't spell anything right. 0/10")
multireply = Comment.create(user: clark, article: chaucer, content: "Great article, Peter! I've always loved your work.")
Comment.create(user: goku, article: chaucer, content: "I saw Chaucer live in concert once, he was okay")
Comment.create(user: seph, article: chaucer, parent: multireply, content: "Do you guys not have email??")
Comment.create(user: peter, article: chaucer, parent: multireply, content: "Thanks, Clark!")
Comment.create(user: goku, article: chaucer, parent: multireply, content: "this is pretty self-congratulatory, not gonna lie\r\n\r\nI mean, I know you're congratulating someone else, but like you both work at this website, same thing")

first_root = Comment.create(user: seph, article: kitty, content: "POST THE KITTY YOU COWARDS")
second_root = Comment.create(user: seph, article: kitty, content: "did you just forget to post a cat picture or something???")
third_root = Comment.create(user: seph, article: kitty, content: "I just don't understand, why no cat?")

def make_random_children(parent, depth, goku, kitty)
    roll = [0,1,1,2].sample
    roll.times do
        new_comment = Comment.create(user: goku, article: kitty, parent: parent, content: "THEY CAN'T POST AN ARTICLE LIKE THIS WITHOUT POSTING A CAT PICTURE\r\nSPAM SPAM SPAM SPAM SPAM UNTIL YOU GIVE US CATS")
        make_random_children(new_comment, depth + 1, goku, kitty) if depth < 17
    end
end

make_random_children(first_root, 0, goku, kitty)
make_random_children(second_root, 0, goku, kitty)
make_random_children(third_root, 0, goku, kitty)

puts "Seeding complete!"