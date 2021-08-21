import re
import requests
from bs4 import BeautifulSoup

def get_yahoo_news():
    # サイトからダウンロード
    url = 'https://news.yahoo.co.jp/topics/it'
    response = requests.get(url)

    # HTML解析
    soup = BeautifulSoup(response.text, "html.parser")
    elems = soup.find_all(class_="newsFeed_item")

    result = ""
    for elem in elems:
        # Yahoo広告を表示させないためにclass_="newsFeed_item_title"の無い要素は表示させないようにしている
        if elem.find(class_="newsFeed_item_title") is not None:
            title = elem.find(class_="newsFeed_item_title").contents[0]
            link = elem.find(class_="newsFeed_item_link").attrs['href']
            result += "{}\n{}\n{}\n".format(title, link, '-' * 40)

    return result

if __name__ == "__main__":
    print(get_yahoo_news())
    