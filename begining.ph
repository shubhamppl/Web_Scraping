import requests 
from bs4 import BeautifulSoup
def save_file(url,path):
    r=requests.get(url)
    with open(path,"w", encoding="utf-8") as f:
        f.write(r.text)
        
url ="https://www.amazon.in/s?k=iphone&crid=24716W5CVIITN&sprefix=ipho%2Caps%2C607&ref=nb_sb_ss_ts-doa-p_4_4"     #website link
headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}

r = requests.get(url, headers=headers)
soup=BeautifulSoup(r.text,'html.parser')
spans=soup.select("span.a-size-medium.a-color-base.a-text-normal")
prices=soup.select("span.a-price-whole")
for span in spans:
    print(span.string)  
for price in prices:
    print(price.text)
"""output:
Apple iPhone 14 (128 GB) - Midnight
Apple iPhone 14 (128 GB) - Blue
Apple iPhone 14 (128 GB) - Purple
Apple iPhone 14 (128 GB) - Starlight
Apple iPhone 14 Plus (128 GB) - Midnight
Apple iPhone 14 Plus (256 GB) - Blue
Apple iPhone 14 Pro (128 GB) - Deep Purple
Apple iPhone 12 (64GB) - (Product) RED
Apple iPhone 14 (128 GB) - (Product) RED
Apple iPhone 14 (256 GB) - Purple
Apple iPhone 13 (128GB) - (Product) RED
Apple iPhone 12 (64GB) - Black
Apple iPhone 14 Plus (128 GB) - Purple
Apple iPhone 14 Plus (128 GB) - Blue
Apple iPhone 12 (64GB) - White
Apple iPhone 14 Plus (128 GB) - Starlight
68,999
68,999
68,999
68,999
76,999
86,999
1,19,999
53,999
69,999
79,999
61,990
53,999
76,999
76,999
59,900
76,999
1,199
1,199
284
283
68,999
68,999
68,999
1,199
