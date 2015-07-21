import feedparser
import datetime
import time
from sys import argv

def GetFeeds():
    # Opens file & creates a list of RSS feeds to parse
    # input = seperate text file called: files.list
    # output = list of URLs for RSS feeds
    
    with open('feed.list') as f:
        feeds = [line.strip() for line in f]
    return feeds 

def GetPosts(feeds):
    # downloads RSS feed with feedparser and throws results into a list
    
    # input = list of feed URLs (generated from GetFeeds)
    # output = List of Lists with stores for past 365 days
    
    stories = []
    for url in feeds:
        d = feedparser.parse(url)
        doy = datetime.datetime.now().strftime('%j')
        for post in d.entries:
            PostDate = ""
            if int(doy) - int(post.published_parsed[7]) <= 1:
                for elements in post.published_parsed[:]:
                    if elements < 10:
                        Postdate = PostDate + "0"
                    PostDate = PostDate + str(elements)
                if d.feed.title == "Latest in Anime News by Crunchyroll!":
                    d.feed.title = "Crunchyroll"
                stories.append([d.feed.title, post.title[0:], post.link[0:], PostDate])
    return stories
    
def SearchStory(stories):
    StoryMax = int(len(stories)-1)
    StoryNew = 0
    for item in stories:
        StoryNum = stories.index(item)
        if item[3] > StoryNew:
            StoryNew =  
    return
    
def BuildPage():
    # Builds page
    return


# Note 1.....
# example of how to pull data == print stories[1][0] + " : " + stories[1][1]
# [#][0] = Story title
# [#][1] = Story Links
# [#][2] = Story Post Date Integer

# Node 2.....
# for each in stories:
#     print each[0] + ': ' + each[1] + ': ' + each[2] + ': ' + each[3]

feeds = GetFeeds()
stories = GetPosts(feeds)
search = SearchStory(stories)