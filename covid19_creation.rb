require 'open-uri'
require "csv"

def write_fille(filepath, text)
  File.open(filepath, mode = "w") do |f|
    f.write(text)
  end
end

def csv_rows(download_url)
  open(download_url) do |file|
    CSV.parse(file, headers: true)
  end
end

def create_pcr_positive_daily
  text_rows = []

  download_url = "https://covid19.mhlw.go.jp/public/opendata/newly_confirmed_cases_daily.csv"
  csv_rows(download_url).each do |row|
    text_rows.push("(\"#{row[0]}\", #{row[1]})")
  end

  write_fille(
    "./sql/pcr_positive_daily.sql",
    "insert into pcr_positive_daily values\n#{text_rows.join(",\n")}\n",
  )
end

def create_pcr_tested_daily
  text_rows = []

  download_url = "https://www.mhlw.go.jp/content/pcr_tested_daily.csv"
  csv_rows(download_url).each do |row|
    text_rows.push("(\"#{row[0]}\", #{row[1] || 0})") # 欠損データあり。その場合は0を代入
  end

  write_fille(
    "./sql/pcr_tested_daily.sql",
    "insert into pcr_tested_daily values\n#{text_rows.join(",\n")}\n",
  )
end

def create_death_total
  text_rows = []

  download_url = "https://covid19.mhlw.go.jp/public/opendata/deaths_cumulative_daily.csv"
  csv_rows(download_url).each do |row|
    text_rows.push("(\"#{row[0]}\", #{row[1]})")
  end

  write_fille(
    "./sql/death_total.sql",
    "insert into death_total values\n#{text_rows.join(",\n")}\n",
  )
end

create_pcr_positive_daily
create_pcr_tested_daily
create_death_total
