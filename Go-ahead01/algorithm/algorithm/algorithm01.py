# algo테이블을 삭제 후 다시 생성하고 age컬럼을 추가해주는 파일
import cx_Oracle
import datetime

# 오라클 데이터베이스에 연결
connection = cx_Oracle.connect("hr", "a1234", "localhost:1521/XE")

# 커서 생성
cursor = connection.cursor()

# 테이블 삭제 함수 정의
def drop_table(table_name):
    drop_query = f"DROP TABLE {table_name}"
    cursor.execute(drop_query)
    connection.commit()

# 테이블 삭제
table_name = 'algo'
drop_table(table_name)
print(f"{table_name} 테이블이 삭제되었습니다.")

# 테이블생성
create_table_query = """
CREATE TABLE algo AS
    SELECT f.info_seq, f.memb_id, m.birth
    FROM favor f, memb m
    where f.memb_id = m.memb_id
"""

try:
    # 테이블 생성 쿼리 실행
    cursor.execute(create_table_query)
    print("Table created successfully.")

    # 커밋 (변경사항을 저장)
    connection.commit()

except cx_Oracle.DatabaseError as e:
    print("Error:", e)
    connection.rollback()

# age 컬럼추가
alter_table_query = """
alter table algo add age integer
"""

try:
    # 테이블 생성 쿼리 실행
    cursor.execute(alter_table_query)
    print("Table altered successfully.")

    # 커밋 (변경사항을 저장)
    connection.commit()

except cx_Oracle.DatabaseError as e:
    print("Error:", e)
    connection.rollback()

# 연결 종료
cursor.close()
connection.close()