
CourseLink.delete_all
Week.delete_all
Assignment.delete_all


CourseLink.create!([{ url: "https://getmagic.com", title: "Get magic" }])
CourseLink.create!([{ url: "https://medium.com/ideo-stories/chatbots-ultimate-prototyping-tool-e4e2831967f3#.3pif99l08", title: "chatbots-ultimate-prototyping-tool" }])
CourseLink.create!([{ url: "http://www.bloomberg.com/news/articles/2015-09-17/who-needs-an-interface-anyway-", title: "Zero UI" }])
CourseLink.create!([{ url: "https://digit.co", title: "Digit article" }])

Week.create!([{ topic: "Get magic", beginning: DateTime.new(2016,10,25,12) }])
Week.create!([{ topic: "chatbots-ultimate-prototyping-tool", beginning: DateTime.new(2016,10,25,12) }])
Week.create!([{ topic: "Zero UI", beginning: DateTime.new(2016,10,25,12) }])
Week.create!([{ topic: "Digit article", beginning: DateTime.new(2016,10,25,12) }])
Week.create!([{ topic: "A Beginner’s Guide to HTTP and REST", beginning: DateTime.new(2016,11,1,12) }])

Assignment.create!([{ description: "Build on Week 1 and prepare a JSON-Based ", week_id: 2, url: " https://daraghbyrne.github.io/onlineprototypes2016/assignments/skills-dev-2/", due_date: DateTime.new(2016,11,8,12) }])
Assignment.create!([{ description: "Build a basic web app/api that provides information on this course ", week_id: 1, url: " https://daraghbyrne.github.io/onlineprototypes2016/assignments/skills-dev-1/", due_date: DateTime.new(2016,11,01,12) }])