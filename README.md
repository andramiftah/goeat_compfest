# Go-Eat Compfest

This is a assignment for Compfest Software Engineering Academy Phase 2 Selection 2019. 

## Problem Description
You are going to make a command line app called “Go-Eat”. The app consists of drivers, stores, and a user. Every driver rated in the form of decimal number in the range of 0.0 to 5.0 and they will initially have 0 point of rating when the program runs for the first time. Each store has a menu which consists of item(s). The map which the user, drivers, and stores are placed on will be generated randomly and must be guaranteed that there is at least a path that can be taken for each driver to go to every store before finally proceeding to the user. Any additional logical assumptions is allowed.

## Your Go-Eat can be executed in three ways:
### 1. By running the app without any arguments
```
ruby go_eat.rb
```
### 2. By passing a filename as an argument
```
ruby go_eat.rb format.txt
```
#### Note the file format must following this format
```
mapsize {int value}
user_coordinate {int},{int}
drivers {int totalDriver} {name}-{coordinate X},{coordinate Y} {name}-{coordinate X},{coordinate Y} 
stores {int totalStore} {nameStore}-{coordinate X},{coordinate Y} {int totalMenu} {nameMenu}-{price} {nameMenu}-{price} {nameStore}-{coordinate X},{coordinate Y} {int totalMenu} {nameMenu}-{price} {nameMenu}-{price}
```

Example :
```
mapsize 20
user_coordinate 10,10
drivers 4 Alpha-11,15 Beta-2,7 Charlie-4,17 Echo-13,7
stores 2 warteg-12,13 4 Ikan_kembung-9 ayam_goreng-10 ayam_bakar-11 ayam_gulai-12 KFC-13,14 2 paha_atas-10 dada-11
```

### 3. By running the app with three arguments
```
ruby go_eat.rb 20 10 10
```
#### The user coordinate must be lower than the mapsize

## Once the app is running, user will be prompted choices of action.
### 1. Show Map

This is an example of 20x20 mapsize with 5 drivers, 3 stores, and 1 user.
```
| ....A...............
| ....................
| U'...................
| ....................
| ....................
| ....................
| ....................
| ........K'...........
| .......C............
| D...................
| ....................
| .........B..........
| .....E..............
| ....*...............
| ......W'.............
| ....................
| ....................
| ....................
| ....................
| ....................
------------------------
```
The user willl be denoted as *
The drivers will be denoted as the first letter in their name {A,B,C,D,E}
The stores will be denoted as the first letter in their name but added with aposthrope {K', W', U'}

### 2. Order Food
```
Choose the restaurant :
1. Warteg
2. Kfc
3. Upnormal
Insert the number >
```
User will choose the number that represent their chosen restaurant

```
Warteg Menu
Menu - Harga
Ayam - 10
Udang - 20
Kerang - 30
Masukkan menu yang anda pilih dengan format (Nama-Banyaknya)
Ketik 'OK' jika sudah selesai pesan dan 'Cancel' untuk mengosongkan pesanan
```
User will input the menu with format 
```Menu-Quantity```
and then type 'OK' if they already done with their order.

```
Your order
Menu - Harga - Quantity - Delivery fee
Ayam - 10 - 1 - 30
Udang - 20 - 1 - 60
Kerang - 30 - 1 - 90
Total Biaya : 240
Are you sure with your order? [Y/N]
```
Program will ask for order confirmation.

After type 'Y' when user already sure with the order.
```
Store name : Warteg
Store location : 7,6
Store distance : 3
Driver name : Echo
Driver rating : 0
Order :
Ayam - 10 - 1 - 30
Udang - 20 - 1 - 60
Kerang - 30 - 1 - 90
Total price : 240
Route >
Start at [7, 6]
- Go to [6, 6]
- Go to [5, 6]
- Go to [5, 7]
- Finish at [5, 7]
Enjoy your food
```
The program will generate the order information and the driver journey.

```Please give rating (0 - 5) :```

The program ask for your rating to the driver.

## Assumption Used

* The history will still after quit the program, but will reset when the program start
* The map coordinate start (0,0) at left-bottom and (maxsize,maxsize) at top-right
* The distance is based on vertical and horizontal move
* Nearest driver choosed from the vertical and horizontal step, not diagonal step
* If there are more than 1 nearest driver, the program will only choose 1
* Driver will shown in map by first letter in their name 
* Store will shown in map by first letter in their name with aposthrope (')
* User will shown in map by (*)
