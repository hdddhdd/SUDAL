import pandas as pd
import numpy as np

df = pd.read_csv('data/FINAL.csv')  

#매출값
mean = 5
std_dev = 10

random_values = np.random.normal(mean, std_dev, len(df))

df['매출(만원)'] = df['매출(만원)'] + random_values


#유동인구
mean = 10
std_dev = 10

random_values = np.random.normal(mean, std_dev, len(df))

df['유동인구'] = df['유동인구'] + random_values

#직장인 평균소득(만원)
mean = 5
std_dev = 10

random_values = np.random.normal(mean, std_dev, len(df))

df['직장인 평균소득(만원)'] = df['직장인 평균소득(만원)'] + random_values



# 수정된 데이터프레임을 CSV 파일로 저장
df.to_csv('modified_data.csv', index=False)  
