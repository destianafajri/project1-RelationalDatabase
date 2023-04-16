import csv

list_user = []

data_path = "Relational Database (SQL)/project 1/data_user.csv"


def load_data():
    with open(data_path, "r") as data_file:
        csv_reader = csv.reader(data_file)
        for i in csv_reader:
            list_user.append(i)


def save_data():
    with open(data_path, "w") as data_file:
        csv_writer = csv.writer(data_file)
        for i in list_user:
            csv_writer.writerow(i)


def add_user(id_user, id_kota, nama_depan, nama_belakang, no_telp, status_user, alamat):
    list_user.append(
        [id_user, id_kota, nama_depan, nama_belakang, no_telp, status_user, alamat])
    return True


def main():

    load_data()
    while(True):
        menu()
        menu_inp = int(input("Masukkan Menu Pilihan Anda : "))
        if (menu_inp == 1):
            # tambah data user
            id_user = int(input("Masukkan id user : "))
            id_kota = int(input("Masukkan id kota : "))
            nama_depan = (input("Masukkan nama depan user : "))
            nama_belakang = (input("Masukkan nama belakang user : "))
            no_telp = input("Masukkan nomor telpon user : ")
            status_user = input(
                "Masukkan status user (admin/penjual/buyer) : ")
            alamat = input("Masukkan alamat user : ")
            add_user(id_user, id_kota, nama_depan,
                     nama_belakang, no_telp, status_user, alamat)
            print("----- Data user berhasil di tambah -----")
        elif (menu_inp == 2):
            save_data()
            print("Selesai input data")
            break


def menu():
    print("1. tambah user")
    print("2. keluar program")


if __name__ == "__main__":
    main()
