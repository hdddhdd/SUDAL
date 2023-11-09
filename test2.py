import pandas as pd

input_csv_file = 'data/clothes_ver3.csv'
output_csv_file = 'data/clothes_ver4.csv'

df = pd.read_csv(input_csv_file)

# Define a function to map '행정동명' to the corresponding values
def map_subway_population(row):
    if row['행정동명'] == '성내1동':
        return 34054
    elif row['행정동명'] == '성내2동':
        return 11546
    elif row['행정동명'] == '성내3동':
        return 5420
    elif row['행정동명'] == '삼덕동':
        return 5762
    else:
        return None  # Handle other cases as needed

# Apply the mapping function and create a new column '지하철유동인구수'
df['지하철유동인구수'] = df.apply(map_subway_population, axis=1)

# Save the modified DataFrame to a new CSV file
df.to_csv(output_csv_file, index=False)

print(f'지하철유동인구수 열이 추가된 {output_csv_file} 파일이 생성되었습니다.')
