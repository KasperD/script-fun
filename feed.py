import feedparser
import datetime
import time

d = feedparser.parse("http://blogsuki.com/feed/")
# d = feedparser.parse("http://www.techmeme.com/feed.xml")
doy = datetime.datetime.now().strftime('%j')
print doy

for post in d.entries:
	# print post.title
	# print post.link
	# print post.published
        # print post.published_parsed[7]
    if  (int(doy) - post.published_parsed[7]) <= 14:
        print post.title
        print post.link
        print post.published_parsed[:9]
print d.version
print "end"
