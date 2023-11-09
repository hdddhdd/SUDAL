import pandas as pd
import requests
import googlemaps

gmaps = googlemaps.Client(key='AIzaSyBzv0NzoQyoElgXxwx0wRylhRYyXc0xEfE')
# reverse_geocode_result = gmaps.reverse_geocode((37.54794204380073, 127.07460710236217), language='ko')
# print(reverse_geocode_result)
# Google Maps Geocoding API 키
api_key = 'AIzaSyBzv0NzoQyoElgXxwx0wRylhRYyXc0xEfE'

# CSV 파일 불러오기
df = pd.read_csv('data/top_10_locations.csv')

# 새로운 열을 추가하여 도로명 주소를 저장
df['도로명주소'] = ''

# 위도와 경도를 도로명 주소로 변환
for index, row in df.iterrows():
    lat = row['위도']
    lng = row['경도']
    reverse_geocode_result = gmaps.reverse_geocode((lat, lng), language='ko')

    url = f'https://maps.googleapis.com/maps/api/geocode/json?latlng={lat},{lng}&key={api_key}'
    response = requests.get(url)
    if response.status_code == 200:
        result = response.json()
        if 'results' in result and result['results']:
            address = result['results'][0]['formatted_address']
            df.at[index, '도로명주소'] = address

# 변환된 데이터를 CSV 파일로 저장
df.to_csv('output_file.csv', index=False)
