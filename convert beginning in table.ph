import requests
from bs4 import BeautifulSoup
import pandas as pd

def save_file(url, path):
    r = requests.get(url)
    with open(path, "w", encoding="utf-8") as f:
        f.write(r.text)

url = "https://www.amazon.in/s?k=iphone&crid=24716W5CVIITN&sprefix=ipho%2Caps%2C607&ref=nb_sb_ss_ts-doa-p_4_4"
headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
}

r = requests.get(url, headers=headers)
soup = BeautifulSoup(r.text, 'html.parser')
spans = soup.select("span.a-size-medium.a-color-base.a-text-normal")
prices = soup.select("span.a-price-whole")

data = []
for span, price in zip(spans, prices):
    data.append([span.string, price.text.replace(",", "")])

df = pd.DataFrame(data, columns=['Product', 'Price'])
print(df)"""
                                           Product   Price
0              Apple iPhone 14 (128 GB) - Midnight   68999
1                  Apple iPhone 14 (128 GB) - Blue   68999
2                Apple iPhone 14 (128 GB) - Purple   68999
3       Apple iPhone 14 Pro (128 GB) - Deep Purple  119999
4             Apple iPhone 14 (128 GB) - Starlight   68999
5         Apple iPhone 14 Plus (128 GB) - Midnight   76999
6                Apple iPhone 14 (128 GB) - Yellow   69999
7          Apple iPhone 13 (128GB) - (Product) RED   61990
8           Apple iPhone 12 (64GB) - (Product) RED   53999
9             Apple iPhone 14 Plus (256 GB) - Blue   86999
10            Apple iPhone 14 Plus (128 GB) - Blue   76999
11          Apple iPhone 14 Plus (128 GB) - Yellow   76999
12                  Apple iPhone 12 (64GB) - Black   53999
13  Apple iPhone 14 Pro Max (128 GB) - Space Black  127999
14          Apple iPhone 14 Plus (128 GB) - Purple   76999
15        Apple iPhone 14 (128 GB) - (Product) RED   69999
