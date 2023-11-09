import pandas as pd
import folium

input_csv_file = 'data/top_10_locations.csv'

#주소 행 추가하기?

myMap = folium.Map(location=[35.8687, 128.5987], zoom_start=20)

df = pd.read_csv(input_csv_file)

def set_marker_color(value):
    if value < 4000:  # 예측매출이 100 미만인 경우
        return 'blue'
    elif value < 6000:  # 예측매출이 100 이상 500 미만인 경우
        return 'green'
    elif value < 7000:  # 예측매출이 500 이상 1000 미만인 경우
        return 'orange'
    else:  # 예측매출이 1000 이상인 경우
        return 'red'

for index, row in df.iterrows():
    latitude = row['위도']
    longitude = row['경도']
    popup_text = row['예측매출(만원)']
    tooltip_text =  row['예측매출(만원)']
    
    marker_color = set_marker_color(row['예측매출(만원)'])
    
    folium.Marker(
        location=[latitude, longitude],
        popup=popup_text,
        tooltip=tooltip_text,
        icon=folium.Icon(color=marker_color, icon='star')
    ).add_to(myMap)

myMap.save('index.html')
