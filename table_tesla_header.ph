
import requests
from bs4 import BeautifulSoup

def save_file(url, path):
    r = requests.get(url)
    with open(path, "w", encoding="utf-8") as f:
        f.write(r.text)

url = "https://finance.yahoo.com/quote/TSLA/history?period1=1653337588&period2=1684873588&interval=1mo&filter=history&frequency=1mo&includeAdjustedClose=true"
headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
}
r = requests.get(url, headers=headers)
soup = BeautifulSoup(r.text, 'html.parser')

table1 = soup.find('table', attrs={'data-test':'historical-prices'})

if table1:
    headers = []
    for i in table1.find_all('th'):
        title = i.text
        headers.append(title)
else:
    print("Table 'historical-prices' not found")

print(soup.title)
