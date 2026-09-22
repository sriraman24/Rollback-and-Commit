import mysql.connector

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="#Sriraman24",
        database="Transactionsdb"
    )
    mycursor = conn.cursor()
    mycursor.execute("SELECT * FROM Bank_account WHERE Account_number IN ('ACC1001', 'ACC1002')")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    
    cursor = conn.cursor()
    conn.autocommit = False
    cursor.execute("START TRANSACTION;")
    cursor.execute("UPDATE Bank_account SET Balance = Balance - 2000 WHERE Account_number = 'ACC1002' ")
    cursor.execute("UPDATE Bank_account SET Balance = Balance + 2000 WHERE Account_number = 'ACC1001'")
    conn.commit()
    print("Transaction successful! ₹2000 transferred.")

    mycursor1= conn.cursor()
    mycursor1.execute("SELECT * FROM Bank_account WHERE Account_number IN ('ACC1001', 'ACC1002')")
    myresult1 = mycursor1.fetchall()

    for x in myresult1:
        print(x)

except Exception as e:
    conn.rollback()
    print("Transaction failed! Rolling back.")
    print("Error:", e)

finally:
    if cursor:
        cursor.close()
    if conn:
        conn.close()
