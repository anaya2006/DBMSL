import mysql.connector

# Connect to MySQL
con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="testdb"  # create this database manually before running
)
cur = con.cursor()

# Create table if not exists
cur.execute("""
CREATE TABLE IF NOT EXISTS emp (
    name VARCHAR(30),
    quantity INT,
    price INT
)
""")

while True:
    print("\n--- MySQL Menu ---")
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
        cur.execute("INSERT INTO emp (name, quantity, price) VALUES (%s, %s, %s)", (name, qty, price))
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
        cur.execute("UPDATE emp SET price = %s WHERE name = %s", (new_price, name))
        con.commit()
        print("Record Updated!")

    elif ch == '4':
        name = input("Enter name to delete: ")
        cur.execute("DELETE FROM emp WHERE name = %s", (name,))
        con.commit()
        print("Record Deleted!")

    elif ch == '5':
        print("Exiting...")
        break

    else:
        print("Invalid Choice!")

cur.close()
con.close()
