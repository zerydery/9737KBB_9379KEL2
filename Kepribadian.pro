domains
kondisi = kond*
kond = string

facts
nondeterm pernyataan(symbol,symbol,integer)
nondeterm jawaban(symbol,symbol)
nondeterm pesan(symbol)
nondeterm judul(symbol)
nondeterm nilai(integer,symbol,integer)
nondeterm final(integer,symbol)
person(kondisi)
false(kond)

predicates
nondeterm mulai		nondeterm proses(string)
nondeterm credit    	nondeterm header
nondeterm mulaipro  	nondeterm tulis_pesan
nondeterm tampil(kondisi) 
nondeterm data
nondeterm lanjut(string,integer,integer)
nondeterm hitung(symbol)
nondeterm pola(symbol)

clauses
person(["\tAndre Prasetya R\t\t1515015080","\tRifki Adam M\t\t1515015052",
"\tMoch Hanafi\t\t1515015054","\tPitriah\t\t\t1515015058",""]).

tampil([H|T]):-
			not(false(H)),
			write(H),nl,
			tampil(T).
tampil([H|_]):-
			assertz(false(H)).

credit 	:- write("\t*************************** Kelompok 2 ******************************"),nl,
	   write("\t------------------------------------------------------------------------------------------------------"), nl,
	   person(A),
	   tampil(A),
	   write("\t------------------------------------------------------------------------------------------------------").


mulaipro:- 		header,
			data,
			hitung(_),
			pola(AB),
			write("\t================================================"),nl,
			write("\t=============="),write("Anda Termasuk ",AB),
			write("================"),nl,
			write("\t================================================"),nl,
			nl,jawaban(AB,Alasan),
			write(Alasan),nl,
			write("======================================================================================="),nl,
			retractall(nilai(_,_,_)),
			retractall(final(_,_)),mulai.

mulaipro:-
	nl,

	write("Maaf, Solusi tidak ada"),nl,nl,
	retractall(nilai(_,_,_)),
	retractall(final(_,_)),mulai.

data:- 		pernyataan(Tanya,Obs,Nomer),
			Awal=0,nl,nl,write("Sesi "),write(Nomer),write(". "),
			write(Tanya),nl,
			write("Jawaban anda "),readln(Ab),nl,
			lanjut(Ab,Awal,Baru),
			assert(nilai(Baru,Obs,Nomer)),
			hitung(Obs),
			fail.
data.
  
lanjut(Baca,Awal,Akhir):- Baca="SS", Akhir=Awal+4.
lanjut(Baca,Awal,Akhir):- Baca="S", Akhir=Awal+3.
lanjut(Baca,Awal,Akhir):- Baca="N", Akhir=Awal+2.
lanjut(Baca,Awal,Akhir):- Baca="T", Akhir=Awal+1.
lanjut(Baca,Awal,Akhir):- Baca="ss", Akhir=Awal+4.
lanjut(Baca,Awal,Akhir):- Baca="s", Akhir=Awal+3.
lanjut(Baca,Awal,Akhir):- Baca="n", Akhir=Awal+2.
lanjut(Baca,Awal,Akhir):- Baca="t", Akhir=Awal+1.
lanjut(Baca,Awal,Akhir):- not (Baca="t"),not (Baca="T"),not (Baca="n"),not (Baca="N"),not (Baca="s"),not (Baca="S"),not (Baca="ss"),
			  not (Baca="SS"), Akhir=Awal+0.

hitung(melankolis)	:- 	nilai(Baru,melankolis,1),
				nilai(Barus,melankolis,2),
				nilai(Barus2,melankolis,3),
				nilai(Barus3,melankolis,4),
				nilai(Barus4,melankolis,5),
				 BaruT=Barus+Baru+Barus2+Barus3+Barus4,
				assert(final(BaruT,melankolis)).
hitung(koleris)	:- 		nilai(Baru,koleris,1),
				nilai(Barus,koleris,2),
				nilai(Barus2,koleris,3),
				nilai(Barus3,koleris,4),
				nilai(Barus4,koleris,5),
				BaruT=Barus+Baru+Barus2+Barus3+Barus4,
				assert(final(BaruT,koleris)).
hitung(plegmatis):- 		nilai(Baru,plegmatis,1),
				nilai(Barus,plegmatis,2),
				nilai(Barus2,plegmatis,3),
				nilai(Barus3,plegmatis,4),
				nilai(Barus4,plegmatis,5),
				BaruT=Barus+Baru+Barus2+Barus3+Barus4,
				assert(final(BaruT,plegmatis)).
hitung(sanguinis):- nilai(Baru,sanguinis,1),
				nilai(Barus,sanguinis,2),
				nilai(Barus2,sanguinis,3),
				nilai(Barus3,sanguinis,4),
				nilai(Barus4,sanguinis,5),
				BaruT=Barus+Baru+Barus2+Barus3+Barus4,
				assert(final(BaruT,sanguinis)).
pola(AB)	:-final(Baru,melankolis),
			final(Barus,koleris),
			final(Barus1,plegmatis),
			final(Barus2,sanguinis),
			Baru>Barus,Baru>Barus1,Baru>Barus2,AB=melankolis;
			final(Baru,melankolis),
			final(Barus,koleris),
			final(Barus1,plegmatis),
			final(Barus2,sanguinis),
			Barus>Baru,Barus>Barus1,Barus>Barus2,AB=koleris;
			final(Baru,melankolis),
			final(Barus,koleris),
			final(Barus1,plegmatis),
			final(Barus2,sanguinis),
			Barus1>Baru,Barus1>Barus,Barus1>Barus2,AB=plegmatis;
			final(Baru,melankolis),
			final(Barus,koleris),
			final(Barus1,plegmatis),
			final(Barus2,sanguinis),
			Barus2>Baru,Barus2>Barus,Barus2>Barus1,AB=sanguinis.


header			:- 		judul(Judul),nl,
					write("\t================================================"),nl,
					write("\t=============="),write(Judul),write("===================="),nl,
					write("\t================================================"),nl,
					tulis_pesan.
tulis_pesan		:- 		pesan(Pesan),
					write("\t"),write(Pesan),nl,
					write("\t================================================"),nl,
					fail.
tulis_pesan.

	
mulai	:-write("\n\n\t****************** Sistem Kepribadian Manusia *********************"),nl,
		write("\t************************* Kelompok 2*********************************"),nl,
		write("\t**************************** Menu ************************************"),nl,
		write("\t***********************************************************************"),nl,
		write("\t1. Test Kepribadian                    			        *"),nl,
		write("\t2. Credit              		            			        *"),nl,
		write("\t3. Exit      	                    			        *"),nl,
		write("\t**********************************************************************"),nl,write("\t"),
		readln(Pilih),proses(Pilih).
		
proses(X):-	X="1", mulaipro;
		X="2",credit,mulai;
		X="3",!;
		X<>"1",X<>"2",X<>"3",write("\tInputan Salah"),mulai.
		
		


goal
consult("kel.2"),
mulai.