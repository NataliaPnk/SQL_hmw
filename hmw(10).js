//В рамках БД audiohosting_150124 напишите след/запросы:

//1. Вывести данные об одном треке (на ваш выбор)


db.tracks.findOne(
  { duration_sec: {$lte: 60 * 2}}, 
  { title: 1, _id: 0 } 
)


//2. Вывести данные юзеров не из USA (в проекции - без страны)


db.users.find(
  { country: {$ne: 'USA'}},
  { country: 0, _id: 0}
)


//3. Вывести данные о треках продолжительностью 30 мин и более (в проекции - без первичного ключа)

db.tracks.find(
  { duration_sec: {$gte: 60 * 30}}, 
  { _id: 0 } 
)


//4. Вывести страны и имена всех клиентов 

db.users.find(
  {},
  { country: 1, fullname: 1, _id: 0 }
)