# delete anything that already exists
Link.delete_all

# create a bunch of data to test with
Link.create!([{ placeholder: "who", msg: "Daksh Jayaswal" } ])
Link.create!([{ placeholder: "why", msg: "Programming for online prototypes"  } ])
Link.create!([{ placeholder: "where", msg: "CMU, Pittsburgh" } ])
Link.create!([{ placeholder: "how", msg: "Magic" } ])