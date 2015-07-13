import feedparser
import datetime

d = feedparser.parse("http://blogsuki.com/feed/")

for post in d.entries:
	print post.title
	print post.link
	print post.published 
	print post.published_parsed

today = datetime.datetime.now()
day_of_year = today.strftime('%j')
print day_of_year
print d.version
print "end"