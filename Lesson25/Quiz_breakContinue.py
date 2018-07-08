# HINT: modify the headlines list to verify your loop works with different inputs
headlines = ["Local Bear Eaten by Man",
             "Legislature Announces New Laws",
             "Peasant Discovers Violence Inherent in System",
             "Cat Rescues Fireman Stuck in Tree",
             "Brave Knight Runs Away",
             "Papperbok Review: Totally Triffic"]

news_ticker = ""
# write your loop here
print(len(news_ticker))
for item in headlines:
    news_ticker=news_ticker+item+" "
    if len(news_ticker)>=140:
        print("Length limit reached")
        news_ticker = news_ticker[:140]
        break
print("New Length {}".format(len(news_ticker)))
print(news_ticker)