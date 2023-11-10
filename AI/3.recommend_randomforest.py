import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score

data = pd.read_csv("../data/modified_FINAL.csv")

X = data[["업소수","유동인구","직장인 평균소득(만원)","반경내_가게수","위도", "경도"]]  # 입력 변수
y = data[["매출(만원)"]] # 결과 변수

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

#Random forest
model = RandomForestRegressor(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

y_pred = model.predict(X_test) #테스트데이터로 모델 펴가

mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

print(f"평균 제곱 오차 (MSE): {mse}")
print(f"결정 계수 (R-squared): {r2}")

data.corr()


N=30 #예측매출 기준 최상위 N개의 매장 
predicted_sales = model.predict(X_test) 

X_test["예측매출(만원)"] = predicted_sales

top_locations = X_test.sort_values(by="예측매출(만원)", ascending=False).head(N)
top_locations = top_locations.sort_values(by="예측매출(만원)", ascending=False)

#중복제거먼저!
top_locations = top_locations.drop_duplicates(subset=["위도", "경도"])

top_10_locations = top_locations.head(10)

print("최적의 입지 후보 (중복 제외, 상위 10개):")
print(top_10_locations)
top_10_locations.to_excel('../data/top_10_locations.xlsx', index=False)
