facts
nondeterm judul(symbol)
nondeterm pesan(symbol)
nondeterm pernyataan(symbol,symbol,integer)
nondeterm jawaban(symbol,symbol)

predicates
nondeterm gabung
clauses
judul("-Tes Kepribadian-").
gabung	:-	A="Berikan penilaian untuk masing-masing pernyataan di setiap \n\tbagian sesuai dengan diri Anda sendiri untuk menjelaskan\n\tkarakter dan perilaku Anda.\n\tPenginputan sesuai dengan Karakter yang telah ditentukan :\n\tSS ",
		B="(point 4 (paling mendekati/sangat sesuai)),\n\tS (point 3 (mendekati/sesuai)),\n\tN (point 2 (kurang mendekati/kadang sesuai)) atau\n\tT (point 1 (paling tidak mendekati/tidak sesuai))\n\tNb: Menginput tidak sesuai karakter yang telah ditentukan, point 0.",
		concat(A,B,Final),assert(pesan(Final)),fail.
gabung	:-	A="Si melankolis mempunyai rasa empati yang tinggi, tak jarang kalau ada teman yang ada\nmasalah dialah orang pertama yang merasakanya bahkan menjadi pendengar yang baik. selain\nberempati, melankolis juga romantis, jago bikin puisi.",
		B="Si melankolis ternyata punya bakat\nperfeksionis harus sempurna, dia juga tipe orang bertipe ini cenderung mempunyai rasa\nseni yang tinggi, suka akan gambar, grafik dll, cukup berbakat menjadi seorang seniman\nentah musik atau pelukis.",
		concat(A,B,Final),assert(jawaban(melankolis,Final)),fail.
gabung	:-	A="Orang dengan tipe ini umumnya menghindari konflik, bagi mereka Perdamaian itu nomer 1.\nMereka juga baik hati, pribadinya tenang rendah hati dan ",
		B="juga penyabar, terlihat kalem. kalau digabung\nsama sifat diatas. banyak dari tipe Plegmatis mempunyai daya humor yang tinggi, menyenangkan untuk diajak gaul.",
		concat(A,B,Final),assert(jawaban(plegmatis,Final)),fail.
gabung	:-	A="Orang dengan tipe ini terkenal dengan banyak omongnya, dan memiliki kemampuan komunikasi\nyang baik serta mengusasai pembicaraan. sanguinis memiliki hasrat untuk bersenang senang\nyang tinggi, mereka suka akan ketenaran, perhatian, kasih sayang dan",
		B="tipe sanguinis\ndukungan dari orang lain. juga memiliki rasa optimistis yang tinggi,humoris dan mudah\nbergaul, emosi mereka juga seperti Plegmatis yaitu cepat berubah, sesaat mereka bisa\nterlihat bahagia namun beberapa saat kemudian menangis.",
		concat(A,B,Final),assert(jawaban(sanguinis,Final)),fail.

gabung	:-	A="Orang tipe ini biasanya suka mengatur dan memerintah orang, dia tidak mau ada orang\nberdiam diri saja sementara dia sibuk kerja/beraktivitas.orang korelis suka akan\ntantangan, sang suka berpetualang, mereka juga tegas. tak heran banyak dari ",
		B="usahanya\nyang sukses karna memang sifatnya yang juga pantang menyerah dan juga mengalah.\nSisi negatifnya, mereka orang yang tidak sabaran, segalanya harus cepat karna memang\nsifat keproduktivitasnya yang tinggi.",
		concat(A,B,Final),assert(jawaban(koleris,Final)).


pernyataan("\nSaya memiliki kemauan yang sangat kuat dan keras kepala. Saya akan melakukan apa saja untuk mendapatkan apa yang Saya inginkan.",koleris,1).
pernyataan("\nSaya jika pertama kali bertemu dengan orang yang asing, biasanya Saya akan merasa agak sungkan. \nSaya lambat menerima orang baru. Mula-mula saya akan menarik diri dan kemudian akan menyesuaikan diri dengan perlahan-lahan.",melankolis,1).
pernyataan("\nSaya lebih sering menunjukkan perilaku yang menyenangkan. Saya lebih banyak tertawa dan tersenyum daripada berwajah muram.",plegmatis,1).
pernyataan("\nSaya tidak pernah santai/rileks. Saya selalu ingin bekerja walaupun waktunya sudah selesai.",sanguinis,1).

pernyataan("\nSaya menyukai privasi dan kadang kala menyendiri dan jarang bergaul.",melankolis,2).
pernyataan("\nSaya sering tampak tenang dan ramah. Saya umumnya memiliki reaksi yang tenang dan lembut terhadap suatu keadaan.",plegmatis,2).
pernyataan("\nSaya bertindak dengan cepat dan mandiri dan suka mengerjakan sesuatu sendiri.",koleris,2).
pernyataan("\nSaya  menunjukkan  perubahan  emosi  yang  jelas.  \nSaya  bertindak berdasarkan perasaannya dan memiliki bakat untuk mengerjakan sesuatu dengan dramatis.",sanguinis,2).

pernyataan("\nSaya mengajukan banyak pertanyaan dan lebih suka memikirkan sesuatu secara mendalam sebelum mengambil keputusan.",melankolis,3).
pernyataan("\nSaya kurang aktif dalam mencoba hal-hal baru dan biasanya lebih suka melakukan hal yang telah saya ketahui dan saya kenal.",plegmatis,3).
pernyataan("\nSaya umumnya tidak memberikan tanggapan yang berlebihan atas kasih sayang yang ditujukan kepada Saya.",koleris,3).
pernyataan("\nSaya umumnya optimis dan antusias dalam dalam hampir setiap situasi.",sanguinis,3).

pernyataan("\nSaya biasanya lebih banyak mendengarkan daripada berbicara.",plegmatis,4).
pernyataan("\nSaya mengatakan apa yang saya pikirkan dan memberi tahu apa yang Saya inginkan.\nSaya bisa sangat kasar dalam mengatakan pada orang lain tentang siapa atau apa yang tidak Saya suka.",koleris,4).
pernyataan("\nSaya mengajukan banyak pertanyaan (sering yang rumit) mengenai hal-hal yang khusus\ndan meminta penjelasan atau jawaban yang detail atas pertanyaan Saya.",melankolis,4).
pernyataan("\nSaya sangat gemar bercerita. Saya sangat suka menceritakan kepada orang lain mengenai prestasi Saya dan kawan-kawan Saya.\nSaya bisa agak manipulatif dengan kemampuan Saya meyakinkan orang lain untuk melakukan apa yang Saya inginkan.",sanguinis,4).

pernyataan("\nSaya sering terlihat serius dan/atau sedih.",melankolis,5).
pernyataan("\nSaya tidak suka berkelahi dan menghindari pertentangan.",plegmatis,5).
pernyataan("\nSaya sangat menyukai persaingan",koleris,5).
pernyataan("\nSaya sangat peduli dengan apa yang dikerjakan oleh orang lain.",sanguinis,5).

goal
gabung,
save("Kel.2"),
write("Success\n").

