//В рамках БД audiohosting_150124 напишите след/запросы:

//1. Вывести не заблокированных юзеров не из China с положительным балансом, используя метод aggregate()


db.users.aggregate([
  {
      $match: {
          is_blocked: { $ne: true },
          country: { $ne: 'China' },
          balance: { $gt: 0 }
      }
  }
])


//2. Вывести имена и баланс трех случайных не заблокированных юзеров из USA и France в порядке убывания баланса, используя метод aggregate()


db.users.aggregate([
  {
      $match: {
          is_blocked: { $ne: true },
          country: { $in: ['USA', 'France'] }
      }
  },
  { $sort: { balance: -1 } },
  { $sample: { size: 3 } },
  { $project: { fullname: 1, balance: 1, _id: 0 } }
])



//3. Разблокировать всех юзеров с положительным балансом


db.users.updateMany(
  {
      balance: { $gt: 0 },
  },
  {
      $unset: { is_blocked: null }
  }
)