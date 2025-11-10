import cx_Oracle

# Connect to Oracle Database
con = cx_Oracle.connect("system/password@localhost:1521/orcl")  # Modify credentials as needed
cur = con.cursor()

# Create table if not exists
cur.execute("""
BEGIN
   EXECUTE IMMEDIATE 'CREATE TABLE emp (
       name VARCHAR2(30),
       quantity NUMBER,
       price NUMBER
   )';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -955 THEN RAISE; END IF;
END;
""")

while True:
    print("\n--- Oracle Menu ---")
    print("1. Insert Record")
    print("2. Display Records")
    print("3. Update Record")
    print("4. Delete Record")
    print("5. Exit")

    ch = input("Enter your choice: ")

    if ch == '1':
        name = input("Enter name: ")
        qty = int(input("Enter quantity: "))
        price = int(input("Enter price: "))
        cur.execute("INSERT INTO emp VALUES (:1, :2, :3)", (name, qty, price))
        con.commit()
        print("Record Inserted!")

    elif ch == '2':
        print("\n--- Records in Table ---")
        cur.execute("SELECT * FROM emp")
        for row in cur.fetchall():
            print(row)

    elif ch == '3':
        name = input("Enter name to update: ")
        new_price = int(input("Enter new price: "))
        cur.execute("UPDATE emp SET price = :1 WHERE name = :2", (new_price, name))
        con.commit()
        print("Record Updated!")

    elif ch == '4':
        name = input("Enter name to delete: ")
        cur.execute("DELETE FROM emp WHERE name = :1", (name,))
        con.commit()
        print("Record Deleted!")

    elif ch == '5':
        print("Exiting...")
        break

    else:
        print("Invalid Choice!")

cur.close()
con.close()
