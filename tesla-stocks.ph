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

table1 = soup.find('table', attrs={'data-test': 'historical-prices'})

if table1:
    headers = []
    for i in table1.find_all('th'):
        title = i.text
        headers.append(title)

    values = []
    for row in table1.find_all('tr'):
        row_values = []
        for cell in row.find_all('td'):
            value = cell.text
            row_values.append(value)
        values.append(row_values)

    for row in values:
        print(row)
else:
    print("Table with data-test attribute 'historical-prices' not found")

print(soup.title)

[]
['May 01, 2023', '163.17', '204.48', '158.83', '203.93', '203.93', '2,681,994,800']
['Apr 01, 2023', '199.91', '202.69', '152.37', '164.31', '164.31', '2,505,176,300']
['Mar 01, 2023', '206.21', '207.79', '163.91', '207.46', '207.46', '3,311,619,900']
['Feb 01, 2023', '173.89', '217.65', '169.93', '205.71', '205.71', '3,624,845,100']
['Jan 01, 2023', '118.47', '180.68', '101.81', '173.22', '173.22', '3,897,499,400']
['Dec 01, 2022', '197.08', '198.92', '108.24', '123.18', '123.18', '2,944,247,700']
['Nov 01, 2022', '234.05', '237.40', '166.19', '194.70', '194.70', '1,885,275,300']
['Oct 01, 2022', '254.50', '257.50', '198.59', '227.54', '227.54', '1,735,263,100']
['Sep 01, 2022', '272.58', '313.80', '262.47', '265.25', '265.25', '1,299,271,000']
['Aug 25, 2022', '3:1 Stock Split']
['Aug 01, 2022', '301.28', '314.67', '271.81', '275.61', '275.61', '1,695,263,200']
['Jul 01, 2022', '227.00', '298.32', '216.17', '297.15', '297.15', '1,744,884,000']
['Jun 01, 2022', '251.72', '264.21', '208.69', '224.47', '224.47', '2,011,227,900']
['*Close price adjusted for splits.**Adjusted close price adjusted for splits and dividend and/or capital gain distributions.']
<title>Tesla, Inc. (TSLA) Stock Historical Prices &amp; Data - Yahoo Finance</title>
