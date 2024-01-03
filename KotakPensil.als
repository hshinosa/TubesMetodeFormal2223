abstract sig AlatTulis{}
abstract sig Bentuk{}
one sig Panjang, Pendek extends Bentuk{ }
abstract sig Warna{}
one sig Hitam, Putih, Biru extends Warna{ }
abstract sig Kualitas{}
one sig Tumpul, Tajam extends Kualitas{ }
abstract sig Ukuran{}
one sig Besar, Sedang, Kecil extends Ukuran{ }

one sig KotakPensil{
  berisi: set AlatTulis,
  bentuk_KotakPensil: one Bentuk,
  warna_KotakPensil: one Warna,
  ukuran_KotakPensil: one Ukuran
}

one sig KotakPensilSalma extends KotakPensil {}

one sig Pulpen extends AlatTulis{
  bentuk_Pulpen: one Panjang,
  warna_Pulpen: one Warna
}

one sig Pensil extends AlatTulis{
  bentuk_Pensil: one Bentuk,
  kualitas_Pensil: one Kualitas,
  warna_Pensil: one Warna  
}

one sig Penghapus extends AlatTulis{
  bentuk_Penghapus: one Bentuk,
  warna_Penghapus: one Putih,
  ukuran_Penghapus: one Ukuran
}

one sig Bolpoin1 extends AlatTulis {
  bentuk_Bolpoin1: one Panjang, 
  warna_Bolpoin1: one Warna
}

one sig Bolpoin2 extends AlatTulis {
  bentuk_Bolpoin2: one Panjang,
  warna_Bolpoin2: one Warna  
}

one sig PensilWarna1 extends AlatTulis {
  bentuk_PensilWarna1: one Pendek,
  kualitas_PensilWarna1: one Tajam,
  warna_PensilWarna1: one Warna
}

one sig PensilWarna2 extends AlatTulis {
  bentuk_PensilWarna2: one Pendek,
  kualitas_PensilWarna2: one Tumpul,
  warna_PensilWarna2: one Warna
}

fact{
  KotakPensil.berisi = Pulpen + Pensil + Penghapus + Bolpoin1 + Bolpoin2 + PensilWarna1 + PensilWarna2
  KotakPensil.bentuk_KotakPensil in Panjang + Pendek 
  KotakPensil.warna_KotakPensil in Hitam + Biru
  KotakPensil.ukuran_KotakPensil in Besar + Sedang
}

fun bentukAlatTulis[alat: AlatTulis]: Bentuk {
  alat.(bentuk_KotakPensil + bentuk_Pensil + bentuk_Pulpen + bentuk_Penghapus +  
         bentuk_Bolpoin1 + bentuk_Bolpoin2 + bentuk_PensilWarna1)
}

fun warnaAlatTulis[alat: AlatTulis]: Warna {
  alat.(warna_KotakPensil + warna_Pensil + warna_Pulpen + warna_Penghapus +  
         warna_Bolpoin1 + warna_Bolpoin2 + warna_PensilWarna1 + warna_PensilWarna2)
}

fun ukuranAlatTulis[alat: AlatTulis]: Ukuran {
  alat.(ukuran_KotakPensil + ukuran_Penghapus) 
}

pred validKotakPensil[kotak: KotakPensil] {
    bentukAlatTulis[kotak.berisi] in kotak.bentuk_KotakPensil
    warnaAlatTulis[kotak.berisi] in kotak.warna_KotakPensil
    ukuranAlatTulis[kotak.berisi] in kotak.ukuran_KotakPensil
    kotak.berisi in (Pulpen + Pensil + Penghapus + Bolpoin1 + Bolpoin2 + PensilWarna1 + PensilWarna2)
}

run {}
