# Tutorial 4 Game Development 2025/2026 Genap

## Eksplorasi Mekanika Pergerakan Karakter

Pada latihan mandiri ini saya mengimplementasikan beberapa fitur tambahan pada Level 2, yaitu:
- Level menggunakan tile map berbeda dari Level 1
- Terdapat _spawner_ rintangan baru dengan objek berbeda
- Implementasi _enemy_ _slime_ yang dapat bergerak dan mati ketika diinjak oleh _player_
- Implementasi _fireball_ sebagai objek yang berjatuhan secara periodik
- Level memiliki jurang sebagai rintangan
- Penambahan Parallax _background_ agar tampilan tidak statis
- Penambahan _Retry Button_ pada LoseScreen

## Mekanisme lebih lanjut
Pada **Level 2** saya membuat _scene_ baru `Level2.tscn` yang menggunakan _tile map_ berbeda dari **Level 1**, yaitu tile bertema _grass_ sehingga memberikan variasi visual pada permainan. Struktur level dirancang dengan beberapa platform dan jurang sehingga pemain harus melakukan lompatan dengan lebih hati-hati untuk menghindari adanya jatuh. Selain itu, saya menambahkan _spawner_ rintangan yang secara periodik menghasilkan _fireball_ yang berjatuhan dari atas sebagai pengganti objek ikan pada **Level 1**. Saya juga mengimplementasikan _enemy slime_ yang bergerak secara horizontal di platform dan dapat dikalahkan ketika pemain menendangnya. Untuk meningkatkan kualitas visual, saya menggunakan `Parallax2D` pada _background_ sehingga _background_ bergerak lebih lambat dibandingkan _foreground_ dan menciptakan efek kedalaman. Terakhir, saya menambahkan `Retry Button` pada _LoseScreen_ agar pemain dapat langsung mencoba kembali permainan tanpa harus _merestart_ game secara manual.
