import feedparser
import datetime
import time
from sys import argv

Newest = 0

def GetFeeds():
    '''
    Opens file & creates a list of RSS feeds to parse

    input = seperate text file called: files.list
    output = list of URLs for RSS feeds
    '''

    with open('feed.list') as f:
        feeds = [line.strip() for line in f]
    return feeds

def GetPosts(feeds):
    '''
    # downloads RSS feed with feedparser and throws results into a list

    input = list of feed URLs (generated from GetFeeds)
    output = List of Lists with stores for past 365 days
    '''
    stories = []
    for url in feeds:
        d = feedparser.parse(url)
        doy = datetime.datetime.now().strftime('%j')
        for post in d.entries:
            PostDate = ""
            if int(doy) - int(post.published_parsed[7]) <= 1:
                for elements in post.published_parsed[:]:
              #      if elements < 10:
              #          Postdate = PostDate + "0"
                    PostDate = PostDate + str(elements)
                if d.feed.title == "Latest in Anime News by Crunchyroll!":
                    d.feed.title = "Crunchyroll"
                stories.append([d.feed.title, post.title, post.link, PostDate])
    return stories
    
def SearchStory():
    '''
    Searches for story with newest date and returns lists
    
    input: stories (array)
    output: 
    '''
    Newest = '';
    for row in range(len(stories)):
        # defining the row to for pop call back
        RowNum = stories.index(stories[row])
        if stories[row][3] >= Newest:
            Newest = stories[row][3]
            NewStory = stories.pop(RowNum)
            return NewStory
        '''
        for col in range(len(stories[row])):
        '''
    return
    
def BuildPage():
    # Builds page
    return


# Note 1.....
# example of how to pull data == print stories[1][0] + " : " + stories[1][1]
# [#][0] = Site 
# [#][1] = Story title
# [#][2] = Story Links
# [#][3] = Story Post Date Integer

# Node 2.....
# for each in stories:
#     print each[0] + ': ' + each[1] + ': ' + each[2] + ': ' + each[3]

feeds = GetFeeds()
stories = GetPosts(feeds)
# search = SearchStory()

StoryCount = len(stories)

while StoryCount > 0:
    StoryCount = StoryCount - 1
    search = SearchStory()
    print search[3] + ": " + search[0] + "  " +search[1]
