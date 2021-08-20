import re
import requests
from bs4 import BeautifulSoup

if __name__ == "__main__":

    # サイトからダウンロード
    url = 'https://news.yahoo.co.jp'
    response = requests.get(url)
    # print(response.text)

    # HTML解析
    soup = BeautifulSoup(response.text, "html.parser")
    elems = soup.find_all(href=re.compile("news.yahoo.co.jp/pickup"))
    
    for elem in elems:
        print(elem.contents[0])
        print(elem.attrs['href'])