require "sqlite3"

class Bookdb

def cre_table
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL)
      CREATE TABLE IF NOT EXISTS books
        (name TEXT, price INTEGER)
    SQL
  end
  puts "booksテーブルを生成しました。"
end


def in_table
  data = {
    name: "楽しいRuby",
    price: 2600
  }
  data2 = {
    name: "優しいRuby",
    price: 13000
  }
  data3 = {
    name: "楽しいC",
    price: 50000
  }
  data4 = {
    name: "優しいC",
    price: 1000
  }
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL , data)
      INSERT INTO books VALUES(:name, :price)
    SQL
  end
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL , data2)
      INSERT INTO books VALUES(:name, :price)
    SQL
  end
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL , data3)
      INSERT INTO books VALUES(:name, :price)
    SQL
  end
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL , data4)
      INSERT INTO books VALUES(:name, :price)
    SQL
  end
  puts "データを入れました。"
end


def ser_table
  ret = []
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL){|row| ret << row.join(" ") }
      SELECT name, price
      FROM books
      WHERE price >= 10000
      AND name like "%楽しい%"
    SQL
  end
  puts "●値段が10000以上で、名前に楽しいを含んだデータは以下の通りです。"
  puts ret.map{|line| line + "\n"}.join
end


def ord_table
  ret = []
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL){|row| ret << row.join(" ") }
      SELECT name, price
      FROM books
      order by name asc ,price desc
    SQL
  end
  puts "●名前を昇順、値段を降順に並べ替えたデータは以下の通りです。"
  puts ret.map{|line| line + "\n"}.join
end


def upd_table
  SQLite3::Database.open("book.db") do |db|
    db.execute(<<-SQL){|rows| p rows}
      UPDATE books 
      set price = 2500
      where name = "楽しいRuby"
    SQL
  end
  puts "楽しいRubyのpriceを2500円に変更しました。"
end


end

book_db = Bookdb.new
book_db.cre_table   #テーブル生成する
book_db.in_table    #データを入れる
book_db.ser_table   #データを出力する
book_db.ord_table   #データを並べ替える
book_db.upd_table   #データをアップデートする

#ruby book_db.rb