import feedparser
import datetime
import time

# d = feedparser.parse("http://blogsuki.com/feed/")
d = feedparser.parse("http://www.techmeme.com/feed.xml")
doy = datetime.datetime.now().strftime('%j')
print doy
updates = []

for post in d.entries:
    if  (int(doy) - post.published_parsed[7]) <= 14:
        duckie_date = ""
        print post.title
        print post.link
        print post.published_parsed[:9]
        for elements in post.published_parsed[:]:
            if elements < 10:
                duckie_date = duckie_date + "0"
            duckie_date = duckie_date + str(elements)
        updates.append([post.title[:0], post.link[:0], duckie_date])
print "*" * 80
print updates
