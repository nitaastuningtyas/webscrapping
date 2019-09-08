# Title     : Twitter API Scraping
# Objective : To Scrap Twitter with API
# Author    : Hernitasari

# Step 1: Install and load rtweet package 

install.packages("rtweet")
library(rtweet)

install.packages("devtools")
library(devtools)
install_github("mkearney/rtweet")
library(rtweet)

# Step 2: API Authorization 

# Find out how to get consumer_key and consumer_secret here: 
# https://www.nurandi.id/blog/twitter-authentication-dengan-r/
# https://www.nurandi.id/blog/rtweet-crawling-data-twitter-menggunakan-r/


#Consumer API keys
#(API_KEY)
token <- create_token(
consumer_key = "sTmBFgTzeeX4YE8lPQ9KgUOk3",
consumer_secret = "G46vKXEKYbWhyvr6z78r2oYiDJOkyRUBqKuoepGewqYko7Nlaa") 


token <- create_token(
  consumer_key = "sTmBFgTzeeX4YE8lPQ9KgUOk3",
  consumer_secret = "G46vKXEKYbWhyvr6z78r2oYiDJOkyRUBqKuoepGewqYko7Nlaa",
  access_token = "1163449194205478912-fWwz4LMQEMDZys63URYScYDOQ6WyBZ",
  access_secret = "3nos4DIL3Sunq3EYVPTSePyuPAFO3BtBIcnNr09DW4HtK")


# Step 3: Crawling Data Twitter 

# Define your twitter username 
my_username='NAstuningtyas'

# Setelah proses otentikasi berhasil, kita siap untuk menambang data (crawling) dari Twitter. Untuk kepeluan ini, rtweet mengemas berbagai fungsi yang cukup lengkap, di antaranya:
#   
# search_tweets() : mencari tweet dengan kata kunci tertentu
# lookup_users() : menampilkan data detail dari satu atau lebih user(s)
# get_timelines() : menampilkan status/tweet yang pernah diposting oleh user tertentu aka timeline
# get_followers() : menampilkan list followers dari user tertentu
# get_friends() : menampilkan list fiends/followings atau yang di-follow user tentu
# dan masih banyak yang lain seperti untuk menampilkan retweet, siapa yang me-retweet, mendapatkan list favorite, menampilkan trending topics, cleansing tweet, dan juga ekspor data ke file csv.

# find 1000 tweets with keywords: "bubarkanKPAI"
tweet <- search_tweets(q = "bubarkanKPAI", n = 1000)

# to know the column names of tweet 
colnames(tweet)
dim(tweet)

# let's take a look at three columns
k <- tweet[,c("created_at", "screen_name", "text")]

k

# Menampilkan timeline atau status/tweet terbaru yang pernah di-posting oleh satu atau beberapa user(s). Setiap user akan ditampilkan hingga maksimal 3.200 tweet.
# menampilkan timeline dari NAstuningtyas
timeline <- get_timeline(my_username)

# filter or select three columns
timeline[,c("created_at", "source", "text")]

# Menampilkan data detail dari satu atau lebih akun/user(s).
user <- lookup_users(my_username)

# filter or select three columns
user[,c("created_at", "screen_name", "name", "location", "description")]

head(user)

followers <- get_followers()
followings <- get_friends()
lookup_users(followings$user_id)


