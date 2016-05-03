# Dockerize Laravel Application
Tutorial membangun aplikasi dengan laravel 5 dan docker. Untuk menjalankan instruksi dalam tutorial ini sangat disarankan menggunakan docker yang dijalankan diatas docker machine.

# Cara Penggunaan
Sebelum menggunakan source code ini pastikan anda sudah menginstall composer di local pc anda. Cara menginstall composer dapat dibaca di: https://getcomposer.org/doc/00-intro.md.

Clone repo ke local pc anda:
```
git clone https://github.com/doenikoe/devops-phpid.git
```
Masuk kedalam direktori dimana Dockerfile berada:
```
cd devops-phpid
```
Build image:
```
docker-build -t doenikoe/laravel5:v1 .
```
Jalankan container dengan docker-compose:
```
docker-compose up -d
```
Masuk kedalam direktori web dan install dependency laravel:
```
composer install
```
Tambahkan baris berikut ini kedalam file hosts (ganti ip_docker_machine dengan alamat IP dari docker machine yang anda gunakan untuk menajalankan container):
```
ip_docker_machine laravel.app
```
Penting untuk diingat bahwa lokasi file hosts berbeda-beda di setiap sistem operasi. Jika anda menggunakan Mac/Linux maka file host berada di direktori /etc/hosts sedangkan jika anda menggunakan windows maka file hosts ada didalam direktori  C:\Windows\System32\drivers\etc\hosts.

# Menjalankan aplikasi laravel
Anda dapat menjalankan aplikasi laravel yang telah terinstall dengan mengetikkan http://laravel.app:8000 pada browser.
