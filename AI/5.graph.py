import matplotlib.pyplot as plt

plt.rc('font', family = 'AppleGothic') # mac 
# plt.rc('font', family = 'Malgun Gothic') # window
plt.rc('font', size = 12)
plt.rc('axes', unicode_minus = False) # -표시 오류 잡아줌
# method = ['XGBoost','Decision Tree', 'Random Forest', 'lasso', 'ridge']
# acc = [0.9829391864379696, 0.6648624184641596, 0.9334333338909537, 0.11936329609299912, 0.11980779873816605] 
method = ['XGBoost','Decision Tree', 'Random Forest',]
acc = [0.9829391864379696, 0.6648624184641596, 0.9334333338909537]

plt.figure(figsize = (10, 5))
plt.bar(method, acc)
plt.show()