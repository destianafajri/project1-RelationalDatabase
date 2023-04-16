import csv

list_buyer = []

data_path = "Relational Database (SQL)/project 1/data_buyer.csv"


def load_data():
    with open(data_path, "r") as data_file:
        csv_reader = csv.reader(data_file)
        for i in csv_reader:
            list_buyer.append(i)


def save_data():
    with open(data_path, "w") as data_file:
        csv_writer = csv.writer(data_file)
        for i in list_buyer:
            csv_writer.writerow(i)


def add_data_buyer(id_buyer, id_user, id_product, date_bid, bid_price, bid_status):
    list_buyer.append(
        [id_buyer, id_user, id_product, date_bid, bid_price, bid_status])
    return True


def main():

    load_data()
    while(True):
        menu()
        menu_inp = int(input("Masukkan Menu Pilihan Anda : "))
        if (menu_inp == 1):
            # tambah data user
            id_buyer = int(input("Masukkan id buyer : "))
            id_user = int(input("Masukkan id user : "))
            id_product = int(input("Masukkan id produk : "))
            date_bid = input("Masukkan tanggal bid : ")
            bid_price = int(input("Masukkan harga bid : "))
            bid_status = input("Masukkan status bid (sent/not sent) : ")
            add_data_buyer(id_buyer, id_user, id_product,
                           date_bid, bid_price, bid_status)
            print("----- Data buyer berhasil di tambah -----")
        elif (menu_inp == 2):
            save_data()
            print("Selesai input data")
            break


def menu():
    print("1. tambah data")
    print("2. keluar program")


if __name__ == "__main__":
    main()
