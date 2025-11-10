from pymongo import MongoClient

client = MongoClient("mongodb://127.0.0.1:27017")
db = client.test1
col = db.emp

while True:
    print("\n--- MongoDB Menu ---")
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
        col.insert_one({"name": name, "quantity": qty, "price": price})
        print("Record Inserted!")

    elif ch == '2':
        print("\n--- Records in Collection ---")
        for doc in col.find():
            print(doc)

    elif ch == '3':
        name = input("Enter name to update: ")
        new_price = int(input("Enter new price: "))
        col.update_one({"name": name}, {"$set": {"price": new_price}})
        print("Record Updated!")

    elif ch == '4':
        name = input("Enter name to delete: ")
        col.delete_one({"name": name})
        print("Record Deleted!")

    elif ch == '5':
        print("Exiting...")
        break

    else:
        print("Invalid Choice!")

client.close()
