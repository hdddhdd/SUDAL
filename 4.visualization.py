import pandas as pd
import folium

input_csv_file = 'result_chinese_ver2.csv'
myMap = folium.Map(location=[35.8678345708037, 128.588906059683], zoom_start=20)

df = pd.read_csv(input_csv_file)

for index, row in df.iterrows():
    latitude = row['위도']
    longitude = row['경도']
    popup_text = row['도로명주소']
    tooltip_text = row['상호명']

    folium.Marker(
        location=[latitude, longitude],
        popup=popup_text,
        tooltip=tooltip_text,
        icon=folium.Icon(color='blue', icon='star')
    ).add_to(myMap)

    # folium.CircleMarker(
    #     location=[latitude, longitude],
    #     radius=100,
    #     color='blue',
    #     fill_color='skyblue'
    # ).add_to(myMap)

myMap.save('index.html')
