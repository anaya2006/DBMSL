import java.io.*;
import com.mongodb.*;
import java.util.*;

public class App {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int ch, eid, sal;
        String name, desig;

        try {
            /**** Connect to MongoDB ****/
            MongoClient mongo = new MongoClient("172.23.128.188:3306", 27017);

            /**** Get database ****/
            DB db = mongo.getDB("dmsa");

            /**** Get collection (table) ****/
            DBCollection table = db.getCollection("emp");

            do {
                System.out.println("\n-----------------------------");
                System.out.println("Choices for User");
                System.out.println("1. Insert document");
                System.out.println("2. View documents");
                System.out.println("3. Update document");
                System.out.println("4. Delete document");
                System.out.println("5. Exit");
                System.out.print("Enter your choice = ");
                ch = Integer.parseInt(br.readLine());

                switch (ch) {
                    case 1:
                        System.out.println("\n--- Insert Record ---");
                        System.out.print("Enter empid: ");
                        eid = Integer.parseInt(br.readLine());
                        System.out.print("Enter name: ");
                        name = br.readLine();
                        System.out.print("Enter designation: ");
                        desig = br.readLine();
                        System.out.print("Enter salary: ");
                        sal = Integer.parseInt(br.readLine());

                        BasicDBObject document = new BasicDBObject();
                        document.put("empid", eid);
                        document.put("ename", name);
                        document.put("designation", desig);
                        document.put("salary", sal);
                        table.insert(document);

                        System.out.println("Document inserted successfully!");
                        break;

                    case 2:
                        System.out.println("\n--- Employee Records ---");
                        DBCursor cursor = table.find();
                        while (cursor.hasNext()) {
                            System.out.println(cursor.next());
                        }
                        break;

                    case 3:
                        System.out.println("\n--- Update Record ---");
                        System.out.println("1. Update salary");
                        System.out.println("2. Update designation");
                        System.out.print("Enter your choice: ");
                        int ch2 = Integer.parseInt(br.readLine());
                        BasicDBObject query = new BasicDBObject();
                        BasicDBObject newDocument = new BasicDBObject();
                        BasicDBObject updateObj = new BasicDBObject();

                        System.out.print("Enter empid to update: ");
                        eid = Integer.parseInt(br.readLine());
                        query.put("empid", eid);

                        if (ch2 == 1) {
                            System.out.print("Enter new salary: ");
                            sal = Integer.parseInt(br.readLine());
                            newDocument.put("salary", sal);
                        } else if (ch2 == 2) {
                            System.out.print("Enter new designation: ");
                            desig = br.readLine();
                            newDocument.put("designation", desig);
                        } else {
                            System.out.println("Invalid choice!");
                            break;
                        }

                        updateObj.put("$set", newDocument);
                        table.update(query, updateObj);
                        System.out.println("Document updated successfully!");
                        break;

                    case 4:
                        System.out.println("\n--- Delete Record ---");
                        System.out.print("Enter empid to delete: ");
                        eid = Integer.parseInt(br.readLine());
                        BasicDBObject deleteQuery = new BasicDBObject();
                        deleteQuery.put("empid", eid);
                        table.remove(deleteQuery);
                        System.out.println("Document deleted successfully!");
                        break;

                    case 5:
                        System.out.println("Exiting...");
                        break;

                    default:
                        System.out.println("Invalid choice!");
                }
            } while (ch != 5);

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
