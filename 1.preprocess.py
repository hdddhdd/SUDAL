import pandas as pd

input_csv_file = 'data/clothes_ver4.csv'
output_csv_file = 'data/clothes_ver4_girl.csv'

df = pd.read_csv(input_csv_file)

desired_rows = df[(df['상권업종중분류명'] == '섬유·의복·신발 소매') & 
                 (df['행정동명'].isin(['성내1동', '성내2동', '성내3동', '삼덕동'])) & 
                 (df['상권업종소분류명'].isin(['여성 의류 소매업']))]

desired_rows.to_csv(output_csv_file, index=False)

print(f'남성 의류 소매업, 기타 의류 소매업, 여성 의류 소매업 관련 행을 추출하여 {output_csv_file}로 저장되었습니다.')
