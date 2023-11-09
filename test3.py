import pandas as pd 

data_A = pd.read_csv('data/aaa.csv')  
df_A = pd.DataFrame(data_A, columns=data_A.keys())

data_B = pd.read_csv('data/clothes_ver4_girl.csv')  
df_B = pd.DataFrame(data_B, columns=data_B.keys())


result = pd.merge(df_A, df_B, on="법정동명", how="right")
result.to_csv('결과_파일.csv', index=False)
