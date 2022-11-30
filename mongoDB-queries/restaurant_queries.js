db.restaurant.find();
db.restaurant.find({},{"restaurant_id":1,"name":1,"borough":1,"cuisine":1});
db.restaurant.find({},{"_id":0,"restaurant_id":1,"name":1,"borough":1,"cuisine":1});
db.restaurant.find({},{"_id":0,"restaurant_id":1,"name":1,"borough":1,"address.zipcode":1});
db.restaurant.find({"borough":"Bronx"});
db.restaurant.find({"borough":"Bronx"}).limit(5);
db.restaurant.find({"borough":"Bronx"}).skip(5);
db.restaurant.find({"grades.score":{"$gt":90}});
db.restaurant.find({"grades":{$elemMatch: {"score": {$gt: 80,$lt: 100}}}});
db.restaurant.find({"address.coord.1": {$lt: -95.754168}});
db.restaurant.find({"cuisine": {$ne: 'American '}, "grades.score": {$gt:70}, "address.coord.0":{$lt:-65.754168}});
db.restaurant.find({"cuisine": {$ne: 'American'}, "grades.score": {$gt:70}, "address.coord.1":{$lt:-65.754168}});
db.restaurant.find({"cuisine": {$ne: 'American '}, "grades.grade": "A", "borough" : {$ne : "Brooklyn"}}).sort({"cuisine":-1});
db.restaurant.find({"name":/^Wil/},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"name":/ces$/},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"name":/Reg/},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"borough":"Bronx", "cuisine": {$in: ["American ", "Chinese"]}});
db.restaurant.find({"borough": {$in: ["Staten Island", "Queens", "Bronx","Brooklyn"]}},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"borough": {$nin: ["Staten Island", "Queens", "Bronx","Brooklyn"]}},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"grades.score": {$lt: 10 } },{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({$or: [{"cuisine": {$in: ["Seafood", "American ", "Chinese"]}}, {"name":/^Wil/}]},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurant.find({"grades":  {$elemMatch : {"grade":"A", "score":11,"date":ISODate("2014-08-11T00:00:00Z")}}},{"restaurant_id":1, "name":1, "grades":1});
db.restaurant.find({"grades.1.grade":"A", "grades.1.score":9,"grades.1.date":ISODate("2014-08-11T00:00:00Z")},{"restaurant_id":1, "name":1, "grades":1});
db.restaurant.find({"address.coord.1":{$gte:42,$lte:52}},{"restaurant_id":1, "name":1, "address":1});
db.restaurant.find({},{"name":1});
db.restaurant.find({},{"name":-1});
db.restaurant.find({},{"cuisine":1,"borough":-1});
db.restaurant.find({"address.street": {$exists : true}});
db.restaurant.find({"address.coord": {$type : "double"}});
db.restaurant.find({"grades.score": {$mod : [7,0]}},{"restaurant_id":1,"name":1,"grade":1});
db.restaurant.find({"name":/mon/i},{"name":1,"borough":1,"address.coord":1,"cuisine":1});
db.restaurant.find({"name":/^Mad/},{"name":1,"borough":1,"address.coord":1,"cuisine":1});