import pandas as pd

input_csv_file = 'data/대구교통공사_역별일별시간별승하차인원현황_20230930.csv'
output_csv_file = 'data/a2.csv'

df = pd.read_csv(input_csv_file)

desired_rows = df['역명'].isin(['경대병원', '반월당1', '반월당2', '중앙로','청라언덕1','청라언덕2','서문시장'])
desired_rows.to_csv(output_csv_file, index=False)

print(f'남성 의류 소매업, 기타 의류 소매업, 여성 의류 소매업 관련 행을 추출하여 {output_csv_file}로 저장되었습니다.')
