import csv
from geopy.distance import great_circle

# CSV 파일의 경로
csv_file_path = "data/clothes_ver2.csv"

# 반경 (500m)을 미터로 변환
radius = 500 #도보 

# 새로운 CSV 파일의 경로
output_csv_file_path = "data/clothes_ver3.csv"

# 중심 위치의 위도와 경도를 초기화
center_lat = None
center_lon = None

# CSV 파일 열기
with open(csv_file_path, "r") as infile, open(output_csv_file_path, "w", newline="") as outfile:
    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames
    fieldnames.append("반경내_가게수")
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()

    # 중심 위치의 위도와 경도 찾기
    for row in reader:
        if "위도" in row and "경도" in row:
            center_lat = float(row["위도"])
            center_lon = float(row["경도"])
            break

    # 중심 위치가 없으면 종료
    if center_lat is None or center_lon is None:
        print("중심 위치 정보를 찾을 수 없습니다. CSV 파일을 확인하세요.")
        exit()

    # CSV 파일을 다시 읽고 가게 수를 계산하여 새로운 열에 추가
    infile.seek(0)
    next(reader)  # 헤더를 건너뜁니다.

    for row in reader:
        # 가게의 위도와 경도
        lat = float(row["위도"])
        lon = float(row["경도"])

        # 중심 위치 에서 가게 위치 사이의 거리 계산
        distance = great_circle((center_lat, center_lon), (lat, lon)).m

        # 거리가 500m 이내에 있는 가게 수 계산
        if distance <= radius:
            row["반경내_가게수"] = 1
        else:
            row["반경내_가게수"] = 0

        # 수정된 행을 CSV 파일에 쓰기
        writer.writerow(row)

print("반경 내 가게 수가 추가된 CSV 파일이 생성되었습니다.")
