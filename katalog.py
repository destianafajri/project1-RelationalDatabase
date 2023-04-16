import csv

list_katalog = []

data_path = "Relational Database (SQL)/project 1/data_katalog.csv"


def load_data():
    with open(data_path, "r") as data_file:
        csv_reader = csv.reader(data_file)
        for i in csv_reader:
            list_katalog.append(i)


def save_data():
    with open(data_path, "w") as data_file:
        csv_writer = csv.writer(data_file)
        for i in list_katalog:
            csv_writer.writerow(i)


def add_data_katalog(id_katalog, id_user, id_product, deskripsi_produk, status_produk):
    list_katalog.append(
        [id_katalog, id_user, id_product, deskripsi_produk, status_produk])
    return True


def main():

    load_data()
    while(True):
        menu()
        menu_inp = int(input("Masukkan Menu Pilihan Anda : "))
        if (menu_inp == 1):
            # tambah data user
            id_katalog = int(input("Masukkan id katalog : "))
            id_user = int(input("Masukkan id user : "))
            id_product = int(input("Masukkan id produk : "))
            deskripsi_produk = input("Masukkan deskripsi produk : ")
            status_produk = input("Masukkan status produk : (ready/sold) : ")
            add_data_katalog(id_katalog, id_user, id_product,
                             deskripsi_produk, status_produk)
            print("----- Data katalog berhasil di tambah -----")
        elif (menu_inp == 2):
            save_data()
            print("Selesai input data")
            break


def menu():
    print("1. tambah data")
    print("2. keluar program")


if __name__ == "__main__":
    main()
