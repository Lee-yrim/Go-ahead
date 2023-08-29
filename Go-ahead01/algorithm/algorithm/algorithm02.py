# birth에서 년도만 추출하고 나이로 계산 후 연령대로 변환해서 age에 저장
import cx_Oracle
import datetime

# 오라클 데이터베이스에 연결
connection = cx_Oracle.connect("hr", "a1234", "localhost:1521/XE")

# 커서 생성
cursor = connection.cursor()

def calculate_age(birth):
    current_year = datetime.datetime.now().year
    age = current_year - birth.year
    return (age // 10) * 10

select_query = "SELECT memb_id, birth FROM algo"
cursor.execute(select_query)
result=cursor.fetchall()
connection.commit()


for row in result:
    memb_id, birth = row
    print(memb_id)
    age = calculate_age(birth)
    
   


# 데이터 업데이트 SQL 쿼리
    update_query = "UPDATE algo SET age = :age WHERE memb_id = :memb_id"
    
    try:
        # 데이터 업데이트 쿼리 실행
        cursor.execute(update_query, age=age, memb_id=memb_id)
        connection.commit()
        print(f"Updated birth for memb_id {memb_id}: {birth}")
    
    except cx_Oracle.DatabaseError as e:
        print("Error:", e)
        connection.rollback()
        
        
# 연결 종료
cursor.close()
connection.close()        